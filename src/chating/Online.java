package chating;


import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
@ServerEndpoint(value="/socket",configurator=RoomConfig.class)
public class Online {

	public static Map<String,Session> chater=Collections.synchronizedMap(new HashMap<String,Session>());
	
	   @OnOpen
	   public void handleOpen(EndpointConfig endpointConfig, Session userSession){
		  
		   try{ 
		   userSession.getUserProperties().put("emp_id", (String)endpointConfig.getUserProperties().get("emp_id"));
		   userSession.getUserProperties().put("english_name", (String)endpointConfig.getUserProperties().get("english_name"));
		    chater.put(userSession.getUserProperties().get("emp_id").toString(),userSession);   
		    
		    Map<String, Session> map= chater;
		    String json="['online',";
			for(Map.Entry<String, Session> u:  map.entrySet()){
				
					json+="{'emp_id':'"+u.getValue().getUserProperties().get("emp_id")+"'"+
						 ",'english_name':'"+u.getValue().getUserProperties().get("english_name")+"'"+
						 ",'image_url':'"+u.getValue().getUserProperties().get("image_url")+"'"+
						 ",'user_mode':'"+u.getValue().getUserProperties().get("user_mode")+"'"+
						 "},";
		
			}
			json=json.substring(0,json.length()-1);
			json+="]";
			System.out.println(json);
			for(Map.Entry<String, Session> u:  map.entrySet()){
				
				u.getValue().getBasicRemote().sendText(json.replaceAll("'", "\""));
				
			}
			
			   }catch(Exception e){e.printStackTrace();}	
				
		   }
	   @OnClose
	   public void handleClose(Session userSession) throws IOException{
		   
		   System.out.println(userSession.getUserProperties().get("english_name")+" : Closed");
		   
		   Map<String, Session> map= chater;
		   chater.remove(userSession.getUserProperties().get("emp_id").toString());
		   for(Map.Entry<String, Session> u:  map.entrySet()){
			   
				try{
					String json="['offline',";
					json+="{'emp_id':'"+userSession.getUserProperties().get("emp_id")+"'"+
						 ",'english_name':'"+userSession.getUserProperties().get("english_name")+"'"+
						 "}]";
					u.getValue().getBasicRemote().sendText(json.replaceAll("'", "\""));
				}catch(Exception e){e.printStackTrace();}
				
			}
		   
		   System.out.println("Client disconnected...!");  
		   
	   }
	   
	   @OnError
	   public void handleError(Throwable th, Session userSession){
		   
		   Map<String, Session> map= chater;
		   chater.remove(userSession.getUserProperties().get("emp_id").toString());
		   for(Map.Entry<String, Session> u:  map.entrySet()){
			   
				try{
					u.getValue().getBasicRemote().sendText(th.toString());
				}catch(Exception e){e.printStackTrace();}
				
			}
		   
	   }
	   
	   @OnMessage
	   public void handleMessage(String msg,Session usersession) throws IOException{
		  System.out.println("handle "+msg);
		  
	   }
	}
