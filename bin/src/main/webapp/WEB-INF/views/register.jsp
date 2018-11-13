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
	<jsp:include page="navigator/navbar.jsp"></jsp:include>

	<div class="container">
		<div class="row justify-content-md-center">
			<div class="section-login">
				<div class="col-md-12 col-md-offset-6 mb-4">

					<div class="card login-card">
						<h5 class="card-header card-header-login">Register</h5>
					
							<div class="login-card-body">
							<form action="/user/update" method="post">
								<div class="form-group">
									 <input type="text" name="firstname" class="form-control" id="inputFirstname"
										aria-describedby="firstnameHelp" placeholder="Enter Firstname">
									
								</div>
								
								<div class="form-group">
									 <input type="text"  name="surname" class="form-control" id="inputSurnamel"
										aria-describedby="emailSuname" placeholder="Enter surname">
									
								</div>
								
								<div class="form-group">
									 <input type="text" name="username" class="form-control" id="inputEmail"
										aria-describedby="emailHelp" placeholder="Enter email">
									
								</div>
								<div class="form-group">
									 <input type="password" name="password" class="form-control"
										id="inputPassword" placeholder="Password">
								</div>
								
								<button type="submit" class="btn btn-login-submit">Submit</button>
							</form>
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

</body>
</html>