public class XmlUtil {

	// extract tag's text from response
	public static String extractXmlTagText(HttpResponse response, String tagName){
		String tagValue;
		if(response != null && String.isNotEmpty(tagName)){
			try{
				Xmlstreamreader xmlReader = response.getXmlStreamReader();
				while(xmlReader.hasNext()){
					if(xmlReader.getEventType() == Xmltag.START_ELEMENT){
						if(xmlReader.getLocalName().equals(tagName)){
							xmlReader.next();
							while(xmlReader.getEventType() != Xmltag.END_ELEMENT){
								if(xmlReader.getEventType() == Xmltag.CHARACTERS){
									if(tagValue == null){
										tagValue = xmlReader.getText();
									}else{
										tagValue += xmlReader.getText();
									}
								}
								xmlReader.next();	
							}
							return tagValue;
						}
					}
					xmlReader.next();
				}
			}catch(XMLException e){
				System.debug('Error in Xml text extraction: '+ e);
			}
		}
		return tagValue;
	}
	
	public static List<String> extractListOfTagText(Httpresponse response, String parentTagName, String childTagName){
		List<String> textList = new List<String>();
		if(response != null && String.isNotEmpty(parentTagName) && String.isNotEmpty(childTagName)){
			Xmlstreamreader xmlReader = response.getXmlStreamReader();
			while(xmlReader.hasNext()){
				if(xmlReader.getEventType() == Xmltag.START_ELEMENT){
					if(xmlReader.getLocalName().equals(parentTagName)){
						xmlReader.next();	
						while(xmlReader.hasNext()){
							if(xmlReader.getEventType() == Xmltag.START_ELEMENT){
								if(xmlReader.getLocalName().equals(childTagName)){
									xmlReader.next();
									if(xmlReader.getEventType() == Xmltag.CHARACTERS){
										textList.add(xmlReader.getText());
									}
								}
							}
							xmlReader.next();
						}
					}
				}
				xmlReader.next();
			}						
		}
		return textList;
	}
	
	public static String extractTagValueWithParentTag(Httpresponse response, String parentTagName, String childTagName){
		String tagValue;
		if(response != null && String.isNotEmpty(parentTagName) && String.isNotEmpty(childTagName)){
			Xmlstreamreader xmlReader = response.getXmlStreamReader();
			while(xmlReader.hasNext()){
				if(xmlReader.getEventType() == Xmltag.START_ELEMENT){
					if(xmlReader.getLocalName().equals(parentTagName)){
						xmlReader.next();	
						while(xmlReader.hasNext()){
							if(xmlReader.getEventType() == Xmltag.START_ELEMENT){
								if(xmlReader.getLocalName().equals(childTagName)){
									xmlReader.next();
									if(xmlReader.getEventType() == Xmltag.CHARACTERS){
										tagValue = xmlReader.getText();
										break;
									}
								}
							}
							xmlReader.next();
						}
					}
				}
				xmlReader.next();
			}						
		}
		return tagValue;
	}
	
	
	public static String extractAttributeValue(HttpResponse response, String tagName, String attributeName){
		String attributeValue;
		if(response != null  && String.isNotEmpty(tagName) && String.isNotEmpty(attributeName)){
			Xmlstreamreader xmlreader = response.getXmlStreamReader();
			while(xmlreader.hasNext()){
				if (xmlreader.getEventType() == XmlTag.START_ELEMENT) {
					if(tagName.equals(xmlreader.getLocalName())){
						attributeValue = xmlreader.getAttributeValue(null, attributeName);
						break;
					}
				}
				
				xmlreader.next();
			}
		}
		return attributeValue;
	}
	
	
	//creates start and end tag with the given name and the given value
	//e.g: tagName = 'legalEntity' value='Individual'
	//outputs <legalEntity>Individual</legalEntity>
	public static Xmlstreamwriter addTagToXml(Xmlstreamwriter xmlWriter, String tagName, String value){
		if(xmlWriter != null && String.isNotEmpty(tagName) && String.isNotEmpty(value)){
			xmlWriter.writeStartElement(null, tagName, null);	//start tagName
			xmlWriter.writeCharacters(value.escapeXml());
			xmlWriter.writeEndElement();	//end tagName
		}
		return xmlWriter;
	} 
	
	public static boolean elementExists(Httpresponse response, String elementName){
		boolean isElementPresent = false;
		if(response != null && String.isNotEmpty(elementName)){
			Xmlstreamreader xmlReader = response.getXmlStreamReader();
			while(xmlReader.hasNext()){
				if(xmlReader.getEventType() == Xmltag.START_ELEMENT){
					if(xmlReader.getLocalName().equals(elementName)){
						isElementPresent = true;
						break;
					}
				}
				xmlReader.next();
			}
		}
		return isElementPresent;
	}
	
	public static Xmlstreamreader getXmlReaderTillNode(String xml, String tagName){
		Xmlstreamreader xmlReader;
		Xmlstreamreader outputReader;
		if(String.isNotEmpty(xml) && String.isNotEmpty(tagName)){
			xmlReader = new Xmlstreamreader(xml);
			xmlReader.setCoalescing(true);
			while(xmlReader.hasNext()) {
		         if (xmlReader.getEventType() == XmlTag.START_ELEMENT && tagName == xmlReader.getLocalName()) {
		         	outputReader = xmlReader;
	            	break;
	            }
	        	xmlReader.next();
	     	}
		}
		return outputReader;
	}
	
	public static String getTagTextFromXml(String inputXml, String tagName){
		String tagValue;
		if(String.isNotEmpty(inputXml) && String.isNotEmpty(tagName)){
			Xmlstreamreader xmlReader = new Xmlstreamreader(inputXml);
			xmlReader.setCoalescing(true);
			while(xmlReader.hasNext()) {
		        if(XmlTag.START_ELEMENT == xmlReader.getEventType() && tagName == xmlReader.getLocalName()){
		        	xmlReader.next();
			        if (XmlTag.END_ELEMENT != xmlReader.getEventType() && xmlReader.getEventType() == XmlTag.CHARACTERS) {
			           tagValue = xmlReader.getText();
			           break;
			        }
				}
		        xmlReader.next();
		     }
		}
     	return tagValue;
	}
	
	public static String getXmlOfNode(String xml, String tagName){
		String outputXmlString;
		if(String.isNotEmpty(xml) && String.isNotEmpty(tagName)){
			String startTagWithArrtibute = '<' + tagName + ' ';
			String startTag = '<' + tagName + '>';
			String singleTagClosed = '<' + tagName + '/>';
			String endTag = '</' + tagName + '>';
			Integer singleTagClosedIndex = xml.indexOf(singleTagClosed);
			Integer startTagIndex = xml.indexOf(startTag);
			Integer endTagIndex = xml.indexOf(endTag);
			Integer startTagWithAttributeIndex = xml.indexOf(startTagWithArrtibute);
			if(singleTagClosedIndex != -1){
				outputXmlString = singleTagClosed;
			}else if((startTagIndex != -1 || startTagWithAttributeIndex != -1) && endTagIndex != -1){
				if(startTagIndex != -1 && startTagWithAttributeIndex != -1){
					if(startTagIndex < startTagWithAttributeIndex){
						outputXmlString = xml.substring(startTagIndex, endTagIndex + endTag.length());
					}else{
						outputXmlString = xml.substring(startTagWithAttributeIndex, endTagIndex + endTag.length());
					}
				}else if(startTagWithAttributeIndex != -1){
					outputXmlString = xml.substring(startTagWithAttributeIndex, endTagIndex + endTag.length());
				}else if(startTagIndex != -1){
					outputXmlString = xml.substring(startTagIndex, endTagIndex + endTag.length());
				}
			}
		}
		return outputXmlString;
	}
	
	
	public static List<String> getListOfChildrenOfNode(String xml, String childTagName){
		List<String> childXmls = new List<String>();
		if(String.isNotEmpty(xml) && String.isNotEmpty(childTagName)){
			while(String.isNotEmpty(xml)){
				String startTagWithArrtibute = '<' + childTagName + ' ';
				String startTag = '<' + childTagName + '>';
				String endTag = '</' + childTagName + '>';
				String singleTagClosed = '<' + childTagName + '/>';
				Integer singleTagClosedIndex = xml.indexOf(singleTagClosed);
				Integer startTagIndex = xml.indexOf(startTag);
				Integer endTagIndex = xml.indexOf(endTag);
				Integer startTagWithAttributeIndex = xml.indexOf(startTagWithArrtibute);
				if(singleTagClosedIndex != -1){
					childXmls.add(singleTagClosed);
					xml = xml.substring(singleTagClosedIndex + singleTagClosed.length());
					continue;
				}else if((startTagIndex != -1 || startTagWithAttributeIndex != -1) && endTagIndex != -1){
					if(startTagIndex != -1 && startTagWithAttributeIndex != -1){
						if(startTagIndex < startTagWithAttributeIndex){
							childXmls.add(xml.substring(startTagIndex, endTagIndex + endTag.length()));
						}else{
							childXmls.add(xml.substring(startTagWithAttributeIndex, endTagIndex + endTag.length()));
						}
					}else if(startTagWithAttributeIndex != -1){
						childXmls.add(xml.substring(startTagWithAttributeIndex, endTagIndex + endTag.length()));
					}else if(startTagIndex != -1){
						childXmls.add(xml.substring(startTagIndex, endTagIndex + endTag.length()));
					}
					xml = xml.substring(endTagIndex + endTag.length());
				}else{
					break;
				}
			}
		}
		return childXmls;		
	}
}