 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import = "com.aaron.babebasket.models.Users" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Moses Basket</title>
<link rel="stylesheet" href="<c:url value = '/resources/css/main.css'/>">
<link rel="stylesheet"
	href="<c:url value = '/resources/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
</head>
<body class="bg-light">
<%
		if (session.getAttribute("user") != null) {
			Users user = (Users) session.getAttribute("user");
			
	%>
	<c:set var="tempUser" value="<%=user%>"></c:set> 
		
	<%
		}
	%>
	<jsp:include page="navigator/navbar.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="mb-profil-ads section">
		<div class="container">

			<div class="card card-ads mt-5">
				<div class="card-body row">
					<div class="col-md-8">
						<div class="user-name">
							<h2>
								<span class="user-title">Hello,</span>
							</h2>
							<h5>You last logged in at: 10-01-2017 6:40 AM [ GB time
								(GMT + 6:00hrs)]</h5>
						</div>
					</div>
					<div class="col-md-2">
						<div class="user-number credit-section">
							
						</div>
					</div>
					<div class="col-md-2">
						<div class="user-number">
							<span class="credit-number">10 </span>Activity
						</div>
					</div>

				</div>
			</div>


			<div class="card card-ads mt-5">
				<div class="card-body row d-flex justify-content-center">
					<div class="user-ad col-md-10">
					<div class="item-info row">
						<div class="item-image-box col-md-2">
							<div class="item-image">
								<a href="job-details.html"><img src="./images/maternity.jpeg" alt="Image" class="img-responsive" width="100" height="100"></a>
							</div><!-- item-image -->
						</div>

						<div class="ad-info col-md-10">
							<span class="ad-title"></span>
							<div class="text-mgs">
							
							</div>
							<div class="ad-meta">
								<ul>
									<li><a href="#"><i class="far fa-comment"></i> Feedback</a></li>
									<li><a href="#"><i class="far fa-eye"></i> View Product</a></li>
									<li><a class="accept-btn"><i class="fas fa-check"></i> Accept</a></li>
									<li><a href="#"><i class="fas fa-ban"></i> Cancel</a></li>
								</ul>
							</div>					
						</div>
					</div>
				</div>
		</div>
</div>
		</div>
		<!-- /.container -->
<%-- <c:if test="${not empty user.username}">
	<h5>${user.username}</h5>
	</c:if> --%>
	</div>


	<jsp:include page="navigator/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/js/jquery/jquery.min.js"></script>
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script defer src="resources/icon/js/fontawesome-all.js"></script>
	<script>
$(function () {
  
	$.ajax({
		type: "GET",
		url: "<c:url value = 'user/username'/>",
		data: {username:"${tempUser.username}"},
		success: function (resp) {
			$('.user-title').after('<span class"title"> '+resp.firstname+' '+resp.surname+ '</span>');
			$('.credit-section').append('<span class="credit-number email-section">'+resp.points+'</span>credit');
			AdvertByEmail(resp);
		}
	});
});

function AdvertByEmail(params) {
		$.ajax({
		type: "GET",
		url: "<c:url value = 'advertisement/user-ads'/>",
		data:{email:"${tempUser.email}"},
		success: function (resp) {
			$.each(resp, function (indexInArray, value) {
			$('.ad-title').append('<a href="job-details.html" class="title">'+value.title+'</a>');
			$.each(value.message, function (indexInArray, val) { 
				$('.text-mgs').append('<span class="wrap-message"><p class="message-text">'+val.message+'</p>');
				$('.message-text').before('<strong>'+val.subject+'</strong><span class="date-text">'+val.creationDate+'</span></span>');
      });
			});	
      	acceptAds(resp);	
		},
		complete:function(xmlHttp) {
			console.log(xmlHttp);		
		}
	});	
}
function acceptAds(obj) {
  console.log(obj);
  
  var adsId = "";
  var offerAdsId = "";
  $.each(obj, function (ind, val) { 
    adsId = val.id; 
  console.log(adsId);
  
  $.each(val.offers, function (ind, offerVal) { 
    offerAdsId = offerVal.id; 
  });
    
  });
 console.log(offerAdsId);
  $(".accept-btn").click(function (e) { 
    e.preventDefault();
    $.ajax({
      type: "POST",
      url: "<c:url value = 'advertisement/"+adsId+"/offer/accept'/>",
      data: {offerId: offerAdsId},
      success: function (response) {
        
      }
    });
  });
}
</script>
</body>
</html>