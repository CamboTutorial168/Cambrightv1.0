
var monthNames = ["Jan", "Feb", "Mar","Apr", "May", "Jun", "Jul","Aug", "Sep", "Oct", "Nov", "Dec"];
var dayName = ["Su","Mo","Tu","We","Th","Fr","Sa"];
var date=new Date();
var dayNow=date.getDate();
var monthNow=date.getMonth();
var yearNow=date.getFullYear();
initCal();
var dateinControl;
function initCal(){
	
	var token=($('#control-date').val()).split("/");
	var dateNow=yearNow+"/"+(monthNow+1)+"/1";
		dateinControl=token[1]+"/"+(monthNames.indexOf(token[0])+1)+"/1";
	getListDay(token[1],monthNames.indexOf(token[0]),dateNow,dateinControl);
	
}


function getLastDayOfMonth(y,m){
   // returns the last day of a given month
    var tmpDate = new Date(y, m, 28);
    var checkMonth = tmpDate.getMonth();
    var lastDay = 27;

    while(lastDay <= 31){
        temp = tmpDate.setDate(lastDay + 1);
        if(checkMonth != tmpDate.getMonth())
            break;
        lastDay++;
    }
    return lastDay;
}

function getNameStartDayOfMonth(y,m){
	var day = new Date(y , m ,29).getDay();
	return day;
}


function getListDay(y,m,dateNow,dateinControl){
	var firstDate=1;
	var lastDate=getLastDayOfMonth(y,m);
	var indexDateName=getNameStartDayOfMonth(y,m);
	$("#list-date").html(getListDaySupply(firstDate,lastDate,indexDateName,dateNow,dateinControl));
}

function getListDaySupply(fstDate,lstDate,indexDateName,dateNow,dateinControl){
	var lst='';
	lst="<td>ID</td><td>Employee Name</td>";
	for(var i=fstDate;i<=lstDate;i++){

		if(indexDateName==0){
			lst+="<td  class='holiday'>"+dayName[indexDateName]+"<div>"+i+"</div></td>";
		}else if(dateNow!=dateinControl){
			lst+="<td >"+dayName[indexDateName]+"<div>"+i+"</div><input type='checkbox' value='' disabled></td>";
		}else{
			if(i==dayNow){
				lst+="<td  class='today'>"+dayName[indexDateName]+"<div>"+i+"</div><input type='checkbox' id='ckall_"+i+"' onchange='checkAll("+i+");'></td>";
			}else{
				lst+="<td >"+dayName[indexDateName]+"<div>"+i+"</div><input type='checkbox' id='ckall_"+i+"' onchange='checkAll("+i+");'></td>";
			}
		}

		if(indexDateName==6) {indexDateName=0;continue;}
		indexDateName++;
	}
	return lst;
}
function getPeople(people){
	$.ajax({
		url:"attendanceempchecklist.json",
		method:"POST",
		data:{
			date:dateinControl
		},
		success:function(cklist){
			
			$("#list-emp").html(getEmpSupply(people,cklist));
			
		}
	});
	
	
}

function getEmpSupply(people,cklist){
	$("#ck-att").attr("disabled",true);
	var dateNow=yearNow+"/"+(monthNow+1)+"/1";
	var token=($('#control-date').val()).split("/");
	var firstDate=1;
	var list='';
	var person="";
	for (var i = 0; i < people.length; i++) {
		person=searchObj(cklist,people[i]['emp_id']);
		list+='<tr>';
		list+="<td style='cursor:pointer;' title='Click to reset' onclick='resetRad(\""+people[i]["emp_id"]+"\")'>"+people[i]["id_card"]+"</td>";
		list+="<td >"+people[i]["english_name"]+"</td>";
		var lastDate=getLastDayOfMonth(token[1],monthNames.indexOf(token[0]));
		var indexDateName=getNameStartDayOfMonth(token[1],monthNames.indexOf(token[0]));
		var dateinControl=token[1]+"/"+(monthNames.indexOf(token[0])+1)+"/1";
		for(var day=firstDate;day<=lastDate;day++){
			ready:
			if(indexDateName==0){
				list+="<td class='holiday'  ></td>";
			}else if(dateNow!=dateinControl || day!=dayNow){
					for(var k=0; k<person.length; k++){
						var myday=(person[k]['att_date']).split("-");
						if(myday[2]==day && myday[1]==(monthNames.indexOf(token[0])+1)){
							list+="<td >";
							if(person[k]['is_absent']=='g'){
								list+="<span>G</span><input type='radio' disabled checked name='"+k+""+people[i].emp_id+"'><br>";
								list+="P<input type='radio' disabled checked name='"+k+""+people[i].emp_id+"'>";
							}else if(person[k]['is_absent']=='p'){
								list+="<span>G</span><input type='radio' disabled name='"+k+""+people[i].emp_id+"'><br>";
								list+="P<input type='radio' disabled checked name='"+k+""+people[i].emp_id+"'>";
							}else{
								list+="<span>G</span><input type='radio' disabled><br>";
								list+="P<input type='radio' disabled>";
							}
							list+="</td>";
							break ready;
						}
						
					}
				
					list+="<td ><span>G</span><input type='radio' disabled ><br>";
					list+="P<input type='radio' disabled></td>";
				
			}else{
				
				for(var k=0; k<person.length; k++){
					var myday=(person[k]['att_date']).split("-");
					if(myday[2]==dayNow && myday[1]==(monthNames.indexOf(token[0])+1)){
						list+="<td ";
						if(person[k]['is_absent']=='p'){
							list+=" class='today'><span>G</span><input type='radio' disabled name='"+k+""+people[i].emp_id+"'><br>";
							list+="P<input type='radio' checked disabled name='"+k+""+people[i].emp_id+"'>";
						}else if(person[k]['is_absent']=='g'){
							list+=" class='today'><span>G</span><input type='radio' checked disabled name='"+k+""+people[i].emp_id+"'><br>";
							list+="P<input type='radio' disabled name='"+k+""+people[i].emp_id+"'>";
						
						}else{
							list+=" class='today'><span>G</span><input type='radio' disabled ><br>";
							list+="P<input type='radio' disabled >";
							//list+="value=\"{'date':'"+token[1]+'/'+(monthNames.indexOf(token[0])+1)+'/'+day+"','emp_id':'"+people[i]['emp_id']+"'}\" class='ck_"+day+"' onchange='checking("+day+")'></td>";
						}
						list+="</td>";
						$("#ck-att").attr("disabled",true);
						break ready;
					}
					
				}
				$("#ck-att").attr("disabled",false);
				list+="<td  class='today'><span>G</span><input type='radio' name='"+people[i].emp_id+"'";
				list+="value=\"{'date':'"+token[1]+'/'+(monthNames.indexOf(token[0])+1)+'/'+day+"','emp_id':'"+people[i]['emp_id']+"','is_absent':'g'}\" class='ck_"+day+"' onchange='checking("+day+")'><br>";
				list+="P<input type='radio' name='"+people[i].emp_id+"'";
				list+="value=\"{'date':'"+token[1]+'/'+(monthNames.indexOf(token[0])+1)+'/'+day+"','emp_id':'"+people[i]['emp_id']+"','is_absent':'p'}\" class='ck_"+day+"' onchange='checking("+day+")'></td>";
			}
			
			if(indexDateName==6) {indexDateName=0;continue;}
			indexDateName++;
		}

		list+='</tr>';
	}
	
	return list;
}
function checkAll(clas){
	if($('#ckall_'+clas).prop('checked')==true)
	    $(".ck_"+clas).prop('checked',true);
	else
		$(".ck_"+clas).prop('checked',false);
}
function checking(day){
	var bool=true;
	$("[class='ck_"+day+"']").each(function(index,obj){
			if($(this).prop("checked")==false) bool=false ;
			if(bool==false) $('#ckall_'+day).prop('checked',bool);
			else $('#ckall_'+day).prop('checked',bool);
	});
}
function searchObj(json,stuid){
	var s=[];
	$.each(json, function(i, v) {
        if (v.emp_id == stuid) {
        	s.push(v);
        }
    });
	return s;
}
function resetRad(name){
	
	$("input[name=\""+name+"\"]").prop("checked",false);
}
