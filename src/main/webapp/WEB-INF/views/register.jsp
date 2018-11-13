<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Moses Basket - Login</title>
<link rel="stylesheet" href="<c:url value = '/resources/css/main.css'/>">
<link rel="stylesheet"
	href="<c:url value = '/resources/css/bootstrap.min.css'/>">
</head>
<body class="bg-light">
<%
   String user = request.getParameter( "username" );
	 session.getAttribute("user");
			
%>
	<jsp:include page="navigator/navbar.jsp"></jsp:include>

	<div class="container">
		<div class="row justify-content-md-center">
			<div class="section-login">
				<div class="col-md-12 col-md-offset-6 mt-5 mb-4">

					<div class="card login-card">
						<h5 class="card-header card-header-login">Register</h5>
					
							<div class="login-card-body">
							
								<div class="form-group">
									 <input type="text"  class="form-control" id="inputFirstname"
										aria-describedby="firstnameHelp" placeholder="Enter Firstname">	
								</div>
								
								<div class="form-group">
									 <input type="text"   class="form-control" id="inputSurname"
										aria-describedby="emailSuname" placeholder="Enter surname">					
								</div>
								
								<div class="form-group">
									 <input type="text"  class="form-control" id="inputUserName"
										aria-describedby="emailHelp" placeholder="Enter Username">	
								</div>
								<div class="form-group">
									 <input type="text"  class="form-control" id="inputEmail"
										aria-describedby="emailHelp" placeholder="Enter Email">	
								</div>
								<div class="form-group">
									 <input type="password" class="form-control"
										id="inputPassword" placeholder="Password">
								</div>
								
								<button class="btn btn-login-submit">Submit</button>
							
					</div>
					</div>
				</div>

			</div>


		</div>



	</div>




	<jsp:include page="navigator/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/js/jquery/jquery.min.js"></script>
	<script src="/resources/js/bootstrap.bundle.min.js"></script>
	<script defer src="/resources/icon/js/fontawesome-all.js"></script>
<script>

$(function() {
	var registerData = {}
	
	
	$('#inputEmail').on("change", function () {
		 registerData.email = $('#inputEmail').val();
		
	});
	$('#inputFirstname').on("change", function () {
		 registerData.firstname = $('#inputFirstname').val();
		
	});
	$('#inputPassword').on("change", function () {
		 registerData.password = $('#inputPassword').val();
		
	});
	$('#inputSurname').on("change", function () {
		 registerData.surname = $('#inputSurname').val();
		
	});
	$('#inputUserName').on("change", function () {
		 registerData.username = $('#inputUserName').val();
		
	});
	registerData.points = "100";
	registerData.roles = [{role: registerData.role = "user",
		}]

		console.log(registerData);
		
	$('.btn-login-submit').click(function (e) { 
		e.preventDefault();
	
		
		// if (registerData==null) {
		// 	alert()
		// } else {
			
		// }
		$.ajax({
			type: "POST",
			url: "<c:url value = '/user/update'/>",
			data:JSON.stringify(registerData),
			contentType: "application/json; charset=utf-8",
			success: function (response) {
				 $('.col-md-12').empty().append('<h3 class="sucess-sent" style="display:block; margin:100px 0 0px 0; ">thank you for register</h3><a href="/login" style="display:block; margin:50px 0 300px 0; ">Login</a>');
            
			},
			complete: function(xmlHttp) {
                  console.log(xmlHttp);
				  //window.location="/login";
               }
		});
	});



})

</script>

</body>
</html>