<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Babe Basket - List</title>
<link rel="stylesheet" href="<c:url value = '/resources/css/main.css'/>">
<link rel="stylesheet"
	href="<c:url value = '/resources/css/bootstrap.min.css'/>">
</head>
<body class="bg-light">
	<jsp:include page="navigator/navbar.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			
				

				<div class="col-lg-3 side-filter">
				<div class="list-group side-condition">
						<a href="#" class="list-group-item search-btn">Search</a>
						<div class="list-group-item">
							<div class="input-section-search">
								<input type="text" class="form-control" id="exampleInputPostcode1"
									aria-describedby="search">
							</div>
						</div>
						<div class="list-group-item">
							<select class="btn btn-dropSearch">
							<option class="dropdown-item">Distance</option> 
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
								</select></div>
							<div class="list-group-item">
							<div class="button-nearby-search">
								<button type="button" class="btn btn-info btn-nearby">Info</button>
							</div>
							</div>					
				</div>

					<div class="list-group side-cat my-4">
						<a href="#" class="list-group-item cat-btn">Category <span class="icon-plusMinus"><i class="fas fa-minus"></i></span></a>
						<div class="catWarp"></div>
				</div>


				<div class="list-group side-nearby my-4 nearbySection">
					<a href="#" class="list-group-item side-nearby nearby-btn">Nearby  <span class="icon-plusMinus"><i class="fas fa-plus"></i></span></a>
					<div class="list-group nearby-section" style="display: none;">
						<a class="list-group-item category-filter">Lewisham</a>
						<a class="list-group-item category-filter">New cross</a>
						<a class="list-group-item category-filter">Greenwich</a>
						<a class="list-group-item category-filter">Charlton</a>
						<a class="list-group-item category-filter nearbyHidden">Deptford</a>
						<a class="list-group-item category-filter nearbyHidden">Canada water</a>
						<a class="list-group-item category-filter nearbyHidden">Surrey quays</a>
						<a class="list-group-item category-filter nearbyHidden">Catford</a>
						<a class="list-group-item category-filter nearbyHidden">Brockley</a>
						<a class="list-group-item category-filter nearbyMore">More..</a>
						</div>
				</div>

				<div class="list-group side-condition">
					<a href="#" class="list-group-item condit-btn">Condition <span class="icon-plusMinus"><i class="fas fa-plus"></i></span></a>
					<div class="hidden-condition" style="display: none;">
						<a class="list-group-item category-filter condition-btn" data-conditon="new">New</a>
						<a class="list-group-item category-filter condition-btn" data-conditon="Like new">Like new</a>
						<a class="list-group-item category-filter condition-btn" data-conditon="Good">Good</a>
						<a class="list-group-item category-filter condition-btn"data-conditon="Used">Used</a>
						</div>
				</div>
			</div>





			<!-- /.col-lg-3 -->

			<div class="col-md-9 mb-4">
				<div class="section-listAds">
					<div class="loader"></div>
					<div class="card card-ads">
						<div class="card-body row">
							<div class="row main"></div>
							

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
	$(function() {

		mainAdversit();
		console.log("${user}")
	});
	
	$('.loader').hide();
function templateAds(ads){
	var _col = $("<div class=\"col-md-10\"></div>");
	$(".main").append(_col);
	   
	var _image = $("<div class=\"col-md-2\" style=\"padding: 0 0px 0 22px;\"><img class=\"card-img-top\" src=" +ads.img +" alt=\"Card image cap\"></div>");
	 _col.before(_image);		
	   
	var _statusWrap = $("<div class=\"card-price-wrap\"></div>");
	 _col.append(_statusWrap);
		
	var _title = $("<h5 class=\"card-title\" data-category="+ads.title+">"+ads.title+"</h5>");
	 _col.append(_title);
	 
	var _city = $("<h6 class=\"card-subtitle mb-2 text-muted\">"+ads.city+"</h6>");
	 _title.after( _city);
		
	var _description = $("<div class=\"card-text\"><p class=\"card-text-p\">"+ads.smalldescription+"</p></div>");
	 _city.after( _description);
		 
	var _smalldetail = $("<div><ul class=\"detail-below\"><li class=\"item-detail detail-first\"><a>"+ads.condition+"</a></li><li  class=\"item-detail\"><a>"+ads.dateOfPurchase+"</a></li>\
		<li  class=\"item-detail\"><a>"+ads.price+"</a></li></ul></div>");
	 _description.after( _smalldetail);

	var _status = $("<span class='card-link card-price' >"+ads.status+"</span>");
	 _statusWrap.append(_status);
		 
	var _divider = $("<div class=\"col-md-12\"><div class=\"divider\"></div></div>");
	  _col.after( _divider);	
	  
	/* var nearbyList = $("<li><a class=\"list-group-item\">"+ads.address.city+"</a></li>"); 
	  $(".nearbySection").append(nearbyList);
	     */
		  var prof =  _col.find('.card-title').data('category');
		  console.log(prof)
	     _col.find('.card-title').click(function (e) { 
			 e.preventDefault();
			window.location="/detail?title="+ prof; 
			 alert('voila')
		 });
	}
sideFilterCategory();
	
	
function mainAdversit(){
	$('.loader').hide();
	console.log("${param.categoryName}")
	$.ajax({
		 <c:if test = "${not empty param.categoryName}">
		   url : "<c:url value = 'advertisement/categoryName'/>",
		   data:{categoryName:"${param.categoryName}"},
		 </c:if>
		   
		   <c:if test = "${not empty param.postcode}">
		   url: "<c:url value = 'advertisement/by-range'/>",
		   data:{
			   postcode:"${param.postcode}",
				maxRange:"${param.maxRange}",
		   },
		 </c:if>
		  
		   context : $(this),
		   Method : "GET",
		   beforeSend: function(data) {
				$('.loader').show();	
			},
		   success : function(data) {
			   	$('.loader').hide();
			$.each(data, function(index, ads){
				 templateAds(ads);
				 
			   })
		  }		
	})
	sideCondition($(this));

}
	
function sideFilterCategory(){
		$('.loader').hide();
		$.ajax({
			url : "<c:url value = 'category'/>",
			Method : "GET",
			context : $(this),
			beforeSend: function(data) {
				$('.loader').show();	
			},
			success : function(data) {
					$('.loader').hide();
		$.each(data, function(index, catego){
			var categ = $(this).find('.card-title ').data('category');
			var side_category = $("<a class='list-group-item category-filter'>"+ catego.categoryName +" <div class='amountNo'>"+catego.count +"</div></a>");
			$(".catWarp").append(side_category);
						
			var side_subCategory= $("<ul class='list-group-item side-hidden' style='display:none;'></ul>");
			side_category.after(side_subCategory);
			var subCategory = "";
	       	for (var i = 0; i < catego.subcategories.length; i++) {
	        subCategory += "<li><a class='sub-filter list-group-item' data-subname='"+ catego.subcategories[i] +"' >"+ catego.subcategories[i] + "</a></li>";
	        }
	       	
	       	side_subCategory.append(subCategory);  
	       
			   sideFilter(side_category);
			   		
		});
	     
			},
		error: function(err){
			alert('something wrong'+ err)
			}
			
			
		});
		
		$(".nearbyHidden").hide();
		$(".nearbyMore").click(function(){	
			$(".nearbyHidden").slideToggle();
			  $(this).find('.svg-inline--fa').toggleClass('fa-minus fa-plus');
			console.log( $(this).find('i'))
			console.log( "djsddjsddhjs")
		});

		$('.cat-btn').click(function (e) { 
			e.preventDefault();
			$(".catWarp").slideToggle();
			$(this).find('.svg-inline--fa').toggleClass('fa-plus fa-minus')
		});	

		$('.nearby-btn').click(function (e) { 
			e.preventDefault();
			$(".nearby-section").slideToggle();
			 $(this).find('.svg-inline--fa').toggleClass('fa-plus fa-minus')	
		});	
		
		$('.condit-btn').click(function (e) { 
			e.preventDefault();
			$(".hidden-condition").slideToggle();
			$(this).find('.svg-inline--fa').toggleClass('fa-plus fa-minus')	
		});	
	
}
		
function sideFilter(side){
	$(".side-hidden :nth-child(1)").css("display", "block !important");
	
	side.click(function(e){
		e.preventDefault();
   		var _category = $(".side-hidden").data('category');
   		$(this).next('.side-hidden').toggle();
   	});	 
	 
	
	$('.loader').hide();
	side.next().find(".sub-filter").click(function(){
		var sub = $(this).data('subname');
		console.log(sub)
		alert('voila')
		$.ajax({
			Method : "GET",
			url : "<c:url value = 'advertisement/subcategory'/>",
			context : $(this),
			data:{ subcategories:sub},
			beforeSend: function(data) {
				$('.loader').show();	
			},
			success : function(data) {
				$('.loader').hide();
				console.log(data)
				$(".main").empty();
				$.each(data, function(index, ads){
				 templateAds(ads);
			   })
			}			
		});	
	});	
		
}

function sideCondition(obj){
		$('.loader').hide();
		$(document).on("click",'.condition-btn', {}, function(e){
		var sub = $(this).data('subname');
		var condition = $(this).text();
		console.log(condition);
		console.log($(this).find('.sub-filter'));

		$.ajax({
			Method : "GET",
			url : "<c:url value = 'advertisement/condition'/>",
			context : $(this),
			data:{ subcategories:"${param.categoryName}",
				   condition:condition},
			beforeSend: function(data) {
				$('.loader').show();	
			},
			success : function(data) {
				$('.loader').hide();
				console.log(data)
				$(".main").empty();
				$.each(data, function(index, ads){
				 templateAds(ads);
			   })
			}			
		});	
	});		

}

</script>
</body>
</html>