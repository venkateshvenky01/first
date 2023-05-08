import com.sap.gateway.ip.core.customdev.util.Message;
import java.util.HashMap;
import com.sap.it.api.mapping.*;
import com.sap.it.api.mapping.MappingContext;

def Message processData(Message message) {
	
	def pmap = message.getProperties();
	def messageLog = messageLogFactory.getMessageLog(message);
	String enableLogging = pmap.get("ENABLE_LOGGING");
	String payloadName = pmap.get("PAYLOAD_NAME");
	// Prepare string for MPL attachment content
	
	if(enableLogging != null && enableLogging.toUpperCase().equals("TRUE")){
		def body = message.getBody(java.lang.String) as String;
		if(messageLog != null){
			messageLog.addAttachmentAsString(payloadName, body, "text/xml");
		}
	}
	
	return message;
}