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
		if(xmlWriter != null && String.isNotEmpty(tagName) && value != null){
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
	
	public static Xmlstreamreader getXmlReaderTillNode(Xmlstreamreader inputXmlReader, String tagName){
		Xmlstreamreader xmlReader;
		if(inputXmlReader != null && String.isNotEmpty(tagName)){
			while(inputXmlReader.hasNext()) {
		         if (inputXmlReader.getEventType() == XmlTag.START_ELEMENT && tagName == inputXmlReader.getLocalName()) {
		            	xmlReader = inputXmlReader;
		            	break;
	            }
	        	inputXmlReader.next();
	     	}
		}
		return xmlReader;
	}
	
	public static String getTagTextFromXmlStreamReader(Xmlstreamreader inputXmlReader, String tagName){
		String tagValue;
		if(inputXmlReader != null && String.isNotEmpty(tagName)){
			while(inputXmlReader.hasNext()) {
		        if(XmlTag.START_ELEMENT == inputXmlReader.getEventType() && tagName == inputXmlReader.getLocalName()){
		        	inputXmlReader.next();
			        if (XmlTag.END_ELEMENT != inputXmlReader.getEventType() && inputXmlReader.getEventType() == XmlTag.CHARACTERS) {
			           tagValue = inputXmlReader.getText();
			           break;
			        }
				}
		        inputXmlReader.next();
		     }
		}
     	return tagValue;
	}
}