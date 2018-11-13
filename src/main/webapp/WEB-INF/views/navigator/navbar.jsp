
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.aaron.babebasket.models.Users"%>
<body class="bg-content">
	<%
		if (session.getAttribute("user") != null) {
			Users user = (Users) session.getAttribute("user");
			
	%>
	<c:set var="tempUser" value="<%=user%>"></c:set> 
		
	<%
		}
	%>

	<script src="resources/js/jquery/jquery.min.js"></script>
	<script>
		var obj =JSON.stringify("${tempUser.id}");
		
	//  	 function getCookie(cname) {
	// 			var name = cname + "=";
	// 			var decodedCookie = decodeURIComponent(document.cookie);
	// 			var ca = decodedCookie.split(';');
	// 			console.log("all"+ca)
	// 			for(var i = 0; i < ca.length; i++) {
	// 				var c = ca[i];
	// 				while (c.charAt(0) == ' ') {
	// 					c = c.substring(1);
	// 				}
	// 				if (c.indexOf(name) == 0) {
						
	// 					return c.substring(name.length, c.length);
	// 				}
	// 			}
	// 			return "";
	// 		}
			
 	// 	if(${tempUser}){
 	// 			var d = new Date();
	// 			d.setTime(d.getTime() + (1*24*60*60*1000));
	// 			var expires = "expires=" + d.toGMTString();
	// 			document.cookie = "cuser=" + ${tempUser} + ";" + expires + ";path=/";
 

	// 	var cookieVal = getCookie('cuser')

	// }

	
	</script>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-mb-bleu fixed-top">
		<div class="container">
			<a class="navbar-brand" href="<c:url value = '/'/>">Babe Basket</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">

					<c:choose>
						<c:when test="${not empty user.username}">
							<li class="nav-item active"><a class="nav-link logoutbtn"
								href="<c:url value = '/profile'/>">${user.username} !</a></li>

							<li class="nav-item active"><a class="nav-link logoutbtn"
								href="<c:url value = '/profile'/>">Account</a></li>

							<li class="nav-item active"><a class="nav-link logoutbtn"
								href="<c:url value = '/'/>"> <i class="fas fa-sign-out-alt"></i>
									Logout <span class="sr-only">(current)</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item active"><a class="nav-link"
								href="<c:url value = '/login'/>"> <i
									class="fas fa-sign-in-alt"></i> Login <span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value = '/register'/>"><i
									class="fas fa-user-plus"></i> Register</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a href="<c:url value = '/post-ads'/>"
						class="btn btn-postAds"> <i class="far fa-paper-plane"></i>
							Post Ads
					</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<nav id="navSecond"
		class="navbar navbar-expand-lg navbar-light bg-secondo sticky">
		<div class="container">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item second-item first"><a class="nav-link mat"
						href="#">maternity & nursery <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item second-item"><a class="nav-link" href="#">bedding</a>
					</li>
					<li class="nav-item second-item"><a class="nav-link" href="#">service</a>
					</li>
					<li class="nav-item second-item"><a class="nav-link" href="#">clothes</a>
					</li>
					<li class="nav-item second-item last"><a class="nav-link"
						href="#">toys</a></li>
					<c:if test="${not empty param.username}">
						<li class="nav-item second-item last"><a class="nav-link"
							href="#">Account</a></li>
					</c:if>
					<c:if test="${not empty param.admin}">
						<li class="nav-item second-item last"><a class="nav-link"
							href="#">User list</a></li>
					</c:if>
				</ul>
			</div>

		</div>
	</nav>
	

	<script src="/resources/js/jquery/jquery.min.js"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.0/js.cookie.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/js-cookie@2.2.0/src/js.cookie.min.js"></script>

	<script type="text/javascript">
		
			// function checkCookie() {
			// 	var user=getCookie("username");
			// 	if (user != "") {
			// 		alert("Welcome again " + user);
			// 	} else {
			// 	user = prompt("Please enter your name:","");
			// 	if (user != "" && user != null) {
			// 		setCookie("username", user, 30);
			// 	}
			// 	}
			// }
	</script>
</body>
