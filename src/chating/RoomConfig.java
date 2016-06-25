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
		HttpSession session=(HttpSession)request.getHttpSession();
		if(session.getAttribute("adminsession")!=null){
			sec.getUserProperties().put("emp_id", ((HttpSession)request.getHttpSession()).getAttribute("emp_id").toString());
			sec.getUserProperties().put("english_name", ((HttpSession)request.getHttpSession()).getAttribute("english_name").toString());
			sec.getUserProperties().put("image_url", ((HttpSession)request.getHttpSession()).getAttribute("image_url").toString());
			sec.getUserProperties().put("user_mode", "employee");
		}
		if(session.getAttribute("studentsession")!=null){
			System.out.println(((HttpSession)request.getHttpSession()).getAttribute("st_id").toString());
			sec.getUserProperties().put("emp_id", ((HttpSession)request.getHttpSession()).getAttribute("st_id").toString());
			sec.getUserProperties().put("english_name", ((HttpSession)request.getHttpSession()).getAttribute("st_name").toString());
			sec.getUserProperties().put("image_url", ((HttpSession)request.getHttpSession()).getAttribute("st_image_url").toString());
			sec.getUserProperties().put("user_mode", "student");
		}
	}
}
