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
	<div class="alert alert-danger alert-dismissible fade show" style="display:none" role="alert">
		<strong>Advertisement!</strong> <p class="errorMessga"></p>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>

	<!-- Page Content -->
	<div class="mb-category-ads section">
		<div class="container">

			<div class="row justify-content-md-center">
		
				<div class="col-sm-6 col-md-10 mb-4">
					<div class="card mt-4 category-search row">
						<div class="row justify-content-md-center">
							<div class="col-sm-4 ">
								<div class="dropdown">
									<select class="btn btn-dropCateg dropdown-toggle">
									<option  class="dropdown-item">Distance</option> 
										<option value="5" class="dropdown-item">5</option> 
										<option value="10" class="dropdown-item">10</option> 
										<option value="15" class="dropdown-item">15</option> 
										<option value="20" class="dropdown-item">20</option> 
										<option value="25" class="dropdown-item">25</option> 
										<option value="30" class="dropdown-item">30</option> 
										<option value="35" class="dropdown-item">35</option> 
										<option value="40" class="dropdown-item">40</option> 
										<option value="50" class="dropdown-item">50</option> 
										<option value="60" class="dropdown-item">60</option> 
										<option value="70" class="dropdown-item">70</option> 
										<option value="80" class="dropdown-item">80</option> 
									</select>
								</div>
							</div>
							<div class="col-sm-7 input-section-search">
								<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="search">
							</div>
							<div class=" col-sm-1 button-section-search">
								<button type="button" class="btn btn-info">Info</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mb-title-section">
				<div class="title-ct">
					<h2>Browse Categories</h2>

					<p>Duis autem vel eum iriure dolor in hendrerit in vulputate
						velit esse molestie consequat, vel illum dolore eu feugiat nulla
						facilisis at vero eros et accumsan et iusto odio dignissim</p>
				</div>
			</div>
			<div class="row category-section">
			<div class="col-sm-6 col-md-12 mb-4">
                     <div class="card mt-4 category-ads">
					 <ul class="icon-inline"></ul>
					 </div>
			</div>
			</div>
			<!-- /.row -->
		
		<div class="mb-title-section mt-5">
				<div class="title-ct">
					<h2>Recent Ads</h2>
				</div>
			</div>
			<div class="col-sm-3 col-md-12 mb-4">
			<div class="card-deck"></div>
			</div>
		</div>
		<!-- /.container -->

	</div>


	<jsp:include page="navigator/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/js/jquery/jquery.min.js"></script>
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script defer src="resources/icon/js/fontawesome-all.js"></script>
	<script>
$(function () {
	catgoryList();	
	console.log("${tempUser} ", " Aaron ------->")
});
function RecentAds(){
		var date2 = new Date();
			date2.setDate(date2.getDate() -5);
		var today = date2.getFullYear()+'-'+ ((date2.getMonth()+1).toString().length==1?0+(date2.getMonth()+1).toString():(date2.getMonth()+1)) + '-' +(date2.getDate().toString().length==1?0+date2.getDate().toString():date2.getDate());
		
		$.ajax({
			url:"<c:url value = 'advertisement/creationDate'/>",
			context:$(this),
			Method:"GET",
			data:{creationDate:today},
			success: function (data) {
			
				$.each(data, function(index, val){
					var date = new Date(val.creationDate);
					var creationDate = date.getFullYear()+'-'+ ((date.getMonth()+1).toString().length==1?0+(date.getMonth()+1).toString():(date.getMonth()+1)) + '-' +(date.getDate().toString().length==1?0+date.getDate().toString():date.getDate());
		
					var card = $("<div class=\"card card-ads col-sm-6\"></div>");
					$(".card-deck").append(card);
					$.each(val.images, function (ind, el) { 
						 	console.log(el.path);
					});
				console.log(val.imageContents);
				
					
					var cardBody = $( "<img class='card-img-top' src=\"data:image/png;base64,"+ val.imageContents[0] +"\"' width:246; alt='Card image cap'>\
					<div class='card-body'><h5 class='card-title'>"+val.title+"</h5>\
					<p class='card-text'>"+val.description+"</p</div>");
						
					card.append(cardBody);
					
					var cardFooter = $("<div class='card-footer'><small class='text-muted'>"+creationDate+"</small></div>");
					card.append(cardFooter);
				})			
			},
			error:function(err) {
				errorMessage = "no ads is available !";
				$('.alert').alert().slideDown().delay(5000).fadeOut()
				$('.errorMessga').html(errorMessage);
				
			}
		});
	
}
function catgoryList(){
		$.ajax({
			url:"<c:url value = 'category'/>",
			context:$(this),
			Method:"GET",
			success: function (data) {
				var iconArray = ['female','tshirt','home','bed','car','gamepad','church']
					var _category="";
				$.each(data, function(index, cat) {
													
						/* var _category = $(" <li class='category-icon'>\
						<a href='/list?&categoryName="+ cat.categoryName +"' ><i class='fas fa-"+iconArray[index] +"'></i></a><h5><a>"+cat.categoryName+"<span>("+cat.count+" ads)</span></a></h5>\
						</li>");  */
					
						var _category = $(" <li class='category-icon'>\
						<a href='/list?categoryName="+ cat.categoryName +"' ><i class='fas fa-"+iconArray[index] +"'></i></a><h5><a>"+cat.categoryName+"<span class=\"count\" data-count="+cat.count+">("+cat.count+" ads)</span></a></h5>\
						</li>");

					
					 $('.icon-inline').append(_category)
								
				}); 
/* 
				var count =  $('.icon-inline').find(".count").data("count");
				console.log(count)
				if (count == 0 ) {
					errorMessage = "ads is  not available !";
					$('.alert').alert().slideDown().delay(5000).fadeOut()
					$('.errorMessga').html(errorMessage);
					return
				} */
				
				
            },
			error: function(err){
			alert('something wrong'+ err)
			}
				});
					RecentAds();
					searchIndex();
}

function searchIndex(){
		var selectRange = "";
		var postcode = ""; 

		$('.btn-dropCateg').change(function(){
			selectRange	= $(this).val();	
		});
		
		$('#exampleInputEmail1').change(function(){
			postcode	= $(this).val();	
		});
	
		$('.btn-info').click(function (e) { 
				e.preventDefault();
				window.location= "/list?postcode=" + postcode + "&maxRange=" + selectRange;
		});

}

</script>
</body>
</html>