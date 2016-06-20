	
//var websocket=new WebSocket("ws://"+rootip+":8080/CamBrightv1.0/socket"); //ws://localhost:8080/ProjectName/annotation.  @ServerEndpoint("/chating")
	var inter;
     websocket.onopen=function(message){
    	/* console.log("open:");
    	 console.log(message);*/
     };
     websocket.onclose=function(message){
    	 $('#activeusers').find(".pull-right").children().remove();
		 $('#activeusers').find(".pull-right").append('<i class="md md-brightness-1" data-toggle="tooltip" data-placement="left" title="Connection refuse" style="color: #d4d4d4;font-size:12px"></i>');
		 console.log(message);
    	 if(message.type=='close'){
    		 if(message.reason==""){
    			 msg="Connection failed reconnect in 5 seconds";
    		 }else{
    			 msg=message.reason;
    		 }
    		 swal({
    			 title:"Failed !",
    			 text:""+msg+"",
    			 type:"error",
    			 confirmButton:false
    		});
    	 }
    	 
    	 setInterval(function(){
    		 location.reload();
    	 },5000);
    	 
    	 
    	/* console.log(message);
    	 console.log(message.data+" is close!");*/
    	 websocket.close();
     };
    
    // window.addEventListener ("beforeunload", function(){ socket.close(); });
     
     websocket.onmessage=function(message){
    	 
    	 var data=JSON.parse(message.data);
    	// $('#user'+data[1]["emp_id"]).remove();
    	 if(data[0]=="offline"){
    		
    		 $('#user'+data[1]["emp_id"]).find(".pull-right").children().remove();
    		 $('#user'+data[1]["emp_id"]).find(".pull-right").append('<i class="md md-brightness-1" data-toggle="tooltip" data-placement="left" title="Just Offline" style="color: #e64a19;font-size:12px"></i>');
    		 setTimeout(function(){
    			 //check tracking for 5 sec who is in red status change to minute
 				if($('#user'+data[1]["emp_id"]).find(".md-brightness-1").css("color")=="rgb(230, 74, 25)"){
 					var i=1;
 					inter=setInterval(function(){
 						$('#user'+data[1]["emp_id"]).find(".pull-right").children().remove();
 						$('#user'+data[1]["emp_id"]).find(".pull-right").text(i+" m");
 						i++;
 					},60000);
 					
 				}
 		     }, 10000);
    		 //console.log($('#user'+data[1]["emp_id"]).find(".md-brightness-1").css("color"));
    		
    	 }else{
    		
    		 $("#activeusers").children().remove();
    		 for (var i = 1; i <= inter; i++){
    			 clearInterval(i);
    		 }
    		 
     		 for(var i=1;i<data.length;i++){
     			 var li=$('<li class="tile" id="user'+data[i]["emp_id"]+'"></li>');
     			 
     			 var a=$('<a class="tile-content ink-reaction"  data-toggle="offcanvas" data-backdrop="false"></a>');
     			 var divtitle=$('<div class="tile-icon"></div>');
     			 var img=$('<img src='+rootpath+'/admin/cpanel/img/emp/'+data[i]["image_url"]+'>');
     			 var text=$('<div class="tile-text"></div>');
     			 var status=$('<span class="pull-right"><i data-toggle="tooltip" data-placement="left" title="Online" class="md md-brightness-1" style="color: #009e1d;font-size:12px"></i></span>');
     			 
     			 divtitle.append(img);
     			 text.append(data[i]["english_name"]);
     			 text.append(status);
     			 a.append(divtitle);
     			 a.append(text);
     			 li.append(a);
     			
     			 $("#activeusers").append(li);
     			
     			 
     		 }
     		
     		
     			getAutoplay();
     		
    	 }
    	 $('[data-toggle="tooltip"]').tooltip();
     };
     /*function sendMessage(){
    	 console.log("sendMessage: "+messages.value);
    	 websocket.send(message.value);
    	 message.value="";
     }*/
     
     function getAutoplay() {
 		var snd = new Audio(""+rootpath+"/mastertop/alert2.mp3");
 		snd.play();
 	}
