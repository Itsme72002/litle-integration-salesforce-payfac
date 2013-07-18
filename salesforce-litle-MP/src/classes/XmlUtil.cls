public class XmlUtil {

	// extract tag's text from response
	public static String extractXmlTagText(HttpResponse response, String tagName){
		String tagValue ='';
		if(response != null && String.isNotEmpty(tagName)){
			try{
				Xmlstreamreader xmlReader = response.getXmlStreamReader();
				while(xmlReader.hasNext()){
					if(xmlReader.getEventType() == Xmltag.START_ELEMENT){
						if(xmlReader.getLocalName().equals(tagName)){
							xmlReader.next();
							while(xmlReader.getEventType() != Xmltag.END_ELEMENT){
								if(xmlReader.getEventType() == Xmltag.CHARACTERS){
									system.debug('tagname: '+ tagName + ' value: '+ xmlReader.getText());
									tagValue += xmlReader.getText();
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
	
	
	//creates start and end tag with the given name and the given value
	//e.g: tagName = 'legalEntity' value='Individual'
	//outputs <legalEntity>Individual</legalEntity>
	public static void addTagToXml(Xmlstreamwriter xmlWriter, String tagName, String value){
		if(String.isNotEmpty(value)){
			xmlWriter.writeStartElement(null, tagName, null);	//start tagName
			xmlWriter.writeCharacters(value.escapeXml());
			xmlWriter.writeEndElement();	//end tagName
		}
	} 
}