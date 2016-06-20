function catchErr(jqXHR, exception){
	console.log(jqXHR);
	 if (jqXHR.statusText === "error") {
			swal("ERROR",'Not connected.Verify Network or Server down.',"error");
		} else if (jqXHR.statusText == "Not Found") {
			swal("ERROR",'Requested page not found. [404]',"error");
		} else if (jqXHR.status == 500) {
			swal("ERROR",'Internal Server Error [500].',"error");
		} else if (jqXHR.statusText === 'parsererror') {
			swal({
				 title:"ERROR",
				 text:'Requested JSON parse failed.',
				 closeOnConfirm: false,
				 allowOutsideClick: false,
				 type:"error"
				},function(isConfirm) {
				  if (isConfirm) {
					  location.reload();
				  }
			});
			
		} else if (jqXHR.statusText === 'timeout') {
			swal("ERROR",'Time out error.',"error");
		} else if (jqXHR.statusText === 'abort') {
			swal("ERROR",'Ajax request aborted.',"error");
		} else {
			swal("ERROR",'Uncaught Error.' + jqXHR.responseText+"","error");
		}
}