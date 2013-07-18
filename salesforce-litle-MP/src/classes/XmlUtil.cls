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
}