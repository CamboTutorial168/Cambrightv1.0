package chating;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.*;

public class RoomConfig extends ServerEndpointConfig.Configurator{ 

	@Override
	public void modifyHandshake(ServerEndpointConfig sec,
			HandshakeRequest request, HandshakeResponse response) {
		// TODO Auto-generated method stub
		//System.out.println(((HttpSession)request.getHttpSession()).getAttribute("emp_id").toString());
		sec.getUserProperties().put("emp_id", ((HttpSession)request.getHttpSession()).getAttribute("emp_id").toString());
		sec.getUserProperties().put("english_name", ((HttpSession)request.getHttpSession()).getAttribute("english_name").toString());
		sec.getUserProperties().put("image_url", ((HttpSession)request.getHttpSession()).getAttribute("image_url").toString());
		
	}
}
