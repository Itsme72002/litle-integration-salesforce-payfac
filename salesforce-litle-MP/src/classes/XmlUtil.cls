public class XmlUtil {

	// extract tag's text from response
	public static String extractXmlTagText(HttpResponse response, String tagName){
		if(response != null && String.isNotEmpty(tagName)){
			try{
				Xmlstreamreader xmlReader = response.getXmlStreamReader();
				while(xmlReader.hasNext()){
					if(xmlReader.getEventType() == Xmltag.START_ELEMENT){
						if(xmlReader.getLocalName().equals(tagName)){
							xmlReader.next();
							if(xmlReader.getEventType() == Xmltag.CHARACTERS){
								return xmlReader.getText();
							}
						}
					}
					xmlReader.next();
				}
			}catch(XMLException e){
				System.debug('Error in Xml text extraction: '+ e);
			}
		}
		return null;
	}
}