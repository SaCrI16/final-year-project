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
	
	<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>Holy guacamole!</strong> <p class="errorMessga"></p>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

	<div class="container">
		<div class="row justify-content-md-center">
			<div class="section-login">
				<div class="col-md-12 col-md-offset-6 mb-4">

					<div class="card login-card">
						<h5 class="card-header card-header-login">Login</h5>
							<div class="login-card-body">
							<form Method="Get" action="user/login">
								<div class="form-group">
									 <input type="text" class="form-control usertxt" id="inputName"
										name="username" aria-describedby="emailHelp" placeholder="Enter email">
									
								</div>
								<div class="form-group">
									 <input type="password" name="password" class="form-control passwordtxt" 
										id="inputPassword" placeholder="Password">
								</div>
								
								<%-- <a type="submit" class="btn btn-login-submit">Submit</a> --%>
								 <button type="submit" class="btn btn-primary">Sign in</button>
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
	<script type="text/javascript">
	$(function(){
		function setCookie(cvalue,exdays) {
				var d = new Date();
				d.setTime(d.getTime() + (exdays*24*60*60*1000));
				var expires = "expires=" + d.toGMTString();
				document.cookie = "user=" + cvalue + ";" + expires + ";path=/";
			}

			

			function checkCookie() {
				var user=getCookie("username");
				if (user != "") {
					alert("Welcome again " + user);
				} else {
				user = prompt("Please enter your name:","");
				if (user != "" && user != null) {
					setCookie("username", user, 30);
				}
				}
			}
		
	// 	var userName = "";
	// 	var passWord = "";
		
	// 	$("#inputName").change(function(){
	// 		 userName = $("#inputName").val();
	// 		console.log(userName)	
	// 	})
		
	// 	$("#inputPassword").change(function(){
	// 		passWord = $("#inputPassword").val();
	// 		console.log(passWord)
			
	// 	})
		
	// 	$('.alert').alert().hide();
	// 	$('.btn-login-submit').click(function(){
	// 		var errorMessage = "";
	// 		var EmptyMessage = "";
	// 		if( userName && passWord ){
			
	// 			$.ajax({
	// 				url:"<c:url value = 'user/login'/>",
	// 				Method:"GET",
	// 				async: false,
	// 				dataType:"json",
	// 				data:{
	// 					username:userName,
	// 					password:passWord
	// 				},
	// 				success : function(data){
	// 					console.log(data)
						
	// 					//console.log(data.username == userName && data.password == passWord, userName," <------ input", data.username, " <------- data")
	// 					if(data.username == userName && data.password == passWord){
	// 						alert("work")
	// 						window.location= "/user-profile" + "?userExist=" + userName ;
	// 					}else{
	// 						alert("wrong")
	// 						errorMessage = "Invalid username and password!";
	// 						$('.alert').alert().slideDown().delay(5000).fadeOut()
	// 						$('.errorMessga').html(errorMessage)
	// 					}	
						
	// 				},
	// 				error: function(err,  xhr, status){
	// 					alert('something wrong')
	// 					console.log( "Error: " + err );
	// 	                console.log( "Status: " + status );
	// 	                console.dir( xhr );
	// 	                $('.alert').alert().show().delay(5000).fadeOut()
	// 					}
					
	// 			});
				
	// 		}else{
				
	// 			$('.alert').alert().show().delay(5000).fadeOut()
	// 			EmptyMessage = "enter username and password!";
	// 			$('.errorMessga').html(EmptyMessage)
	// 		}
				
	// 	})
		
		
	// });
	 });
	
	</script>
</body>
</html>