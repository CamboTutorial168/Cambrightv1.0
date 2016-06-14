<div id="menubar" class="menubar-inverse ">

	<div class="menubar-scroll-panel">

		<!-- BEGIN MAIN MENU -->
		<ul id="main-menu" class="gui-controls">

			<!-- BEGIN DASHBOARD -->
			<li><a
				href="${pageContext.servletContext.contextPath }/admin/cpanel/dashboard"
				id="dashboard">
					<div class="gui-icon">
						<i class="md md-home"></i>
					</div> <span class="title">DASHBOARD</span>
			</a></li>
			<!--end /menu-li -->
			<!-- END DASHBOARD -->

			<!-- BEGIN BRANCH -->
			<li><a href="branchmgnt" id="branchmgnt">
					<div class="gui-icon">
						<i class="md md-location-on"></i>
					</div> <span class="title">BRANCH</span>
			</a></li>
			<!--end /menu-li -->
			<!-- END BRANCH -->
			<li><a href="createclass.jsp" id="createclass">
					<div class='gui-icon'>
						<i class="fa fa-building"></i>
					</div>
					<span class="title">CLASSROOM MANAGEMENT</span>
			</a></li>
			<!-- END CLASS -->
			<li class="gui-folder"><a>
					<div class="gui-icon">
						<i class="fa fa-university"></i>
					</div> <span class="title">PROGRAM & CLASSROOM</span>
			</a> <!--start submenu -->
				<ul>
					<li><a href="addmainprog.jsp" id="mainprog"><span
							class="title">Main Program Enrollment</span></a></li>
					<li><a href="addsubprog.jsp" id="addsubprog"><span
							class="title">Program Enrollment</span></a></li>
					<li><a href="time.jsp" id="schedual"><span
							class="title">Time match Class</span></a></li>
				</ul> <!--end /submenu --></li>
			<!--end /menu-li -->
			
			<li><a href="addposition.jsp" id="addposition">
					<div class='gui-icon'>
						<i class="md md-perm-identity"></i>
					</div>
					<span class="title">POSITIONS MANAGEMENT</span>
			</a></li>
			<!-- BEGIN STAFF -->
			<li class="gui-folder"><a>
					<div class="gui-icon">
						<i class="md md-people"></i>
					</div> <span class="title">EMPLOYEES MANAGEMENT</span>
			</a> <!--start submenu -->
				<ul>
					<li><a href="empreg.jsp" id="empreg"><span class="title">Employees
								Management</span></a></li>
					<li><a href="teachtask.jsp" id="teachtask"><span
							class="title">Teacher Task</span></a></li>
				</ul></li>
			<!--end /menu-li -->
			<!-- END STAFF -->
			<!-- BEGIN STUDENT -->
			<li class="gui-folder"><a>
					<div class="gui-icon">
						<i class="md md-school"></i>
					</div> <span class="title">STUDENTS</span>
			</a> <!--start submenu -->
				<ul>
					<li><a href="studentreg.jsp" id="studentreg"><span
							class="title">Student Registration</span></a></li>
					<li><a href="studentreg.jsp" id="studentreg"><span
							class="title">Student Promote</span></a></li>
					<li><a href="studying.jsp" id="studying"><span
							class="title">Change Time [AM/PM]</span></a></li>
					<!-- <li><a href="studattcheck.jsp" id="studattcheck"><span
							class="title">Checking Attendant</span></a></li>
					<li><a href="studlist.jsp" id="studlist"><span
							class="title">List All Students</span></a></li> -->
				</ul> <!--end /submenu --></li>
			<!--end /menu-li -->
			<!-- END STUDENT -->

			<!-- BEGIN FORMS -->
			<li class="gui-folder"><a>
					<div class="gui-icon">
						<span class="glyphicon glyphicon-list-alt"></span>
					</div> <span class="title">ATTENDANT</span>
			</a> <!--start submenu -->
				<ul>
					<li><a href="empattcheck.jsp" id="empatt"><span
							class="title">Employees Attendant</span></a></li>
					<li><a href="studattcheck.jsp" id="studatt"><span
							class="title">Students Attendant</span></a></li>
				</ul> <!--end /submenu --></li>
			<!--end /menu-li -->
			<!-- END FORMS -->

			<!-- BEGIN PAGES -->
			<li><a href="score.jsp" id="score">
					<div class="gui-icon">
						<i class="md md-assessment"></i>
					</div> <span class="title">SCORE MANAGEMENT</span>
			</a></li>
			<li><a href="">
					<div class="gui-icon">
						<i class="fa fa-file-pdf-o"></i>
					</div>
					<span class="title">REPORTS</span>
			</a></li>
		</ul>
		<!--end .main-menu -->
		<!-- END MAIN MENU -->

		<div class="menubar-foot-panel">
			<small class="no-linebreak hidden-folded"> <span
				class="opacity-75">Copyright &copy; 2016</span> <strong>CamBright</strong>
			</small>
		</div>
	</div>
	<!--end .menubar-scroll-panel-->
</div>
<!--end #menubar-->
<script>
	var rootpath="${pageContext.servletContext.contextPath }";
	var rootip="${pageContext.request.localAddr}";
</script>
<script
	src="${pageContext.servletContext.contextPath }/assets/js/libs/jquery/jquery-1.11.2.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath }/assets/dist/sweetalert2.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath }/assets/error/catcherr.js"></script>
<script
	src="${pageContext.servletContext.contextPath }/mastertop/chat.js"></script>

<script
	src="${pageContext.servletContext.contextPath }/assets/js/core/source/AppOffcanvas.js"></script>
<style>
* {
	font-family: "Khmer OS Siemreap"
}
</style>
<script>
	   
	    $("#confirm-password,#new-password").on("change keypress keyup paste click",function(){
	    	
	    	if(($('#new-password').val())!=($("#confirm-password").val())){
	    		$("#helper-pwd").css("display","inline");
	    	}else{
	    		$("#helper-pwd").css("display","none");
	    	}
	    });
		$("#fm-changepwd").submit(function(e){
			e.preventDefault();
			$.ajax({
				url:"change_pw",
				method:"POST",
				data:{
					old_pw:$("#old-password").val(),
					new_pw:$("#new-password").val()
				},
				beforeSend: function() {
  					$("body").append("<div class='sweet-overlay' tabindex='-1' style='opacity: 1.09; display: block;width:100%; text-align:center;' id='loading'><i class='fa fa-spinner faa-spin animated' style='font-size:90px;margin-top:15%;color:black;'></i></div>");
  			    },
  				complete: function(){
  					$("#loading").remove();
  				},
				success:function(data){
					
					if(data=="false"){
						swal("FAILED","Change password unsuccessfully !","error");
					}else{
						swal("DONE","Password has been changed !","success");
						$("#formModal").modal('hide');
					}
					$("#old-password").val("").change();
					$("#new-password").val("").change();
					$("#confirm-password").val("").change();
					
				},
               	error: function(jqXHR, exception) {
               		catchErr(jqXHR, exception);
                }
			});
		});
		var id="${adminsession.emp_id}";
	</script>