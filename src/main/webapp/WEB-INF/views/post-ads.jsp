<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
   String user = request.getParameter( "username" );
	 session.getAttribute("user");
			
%>
	<jsp:include page="navigator/navbar.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<div class="row justify-content-md-center mt-5">

			<div class="col-sm-6 col-md-8 mb-4">
				<h3 class="mt-5 post-title">Post Your Ad</h3>
				<div class="post-title-line"></div>

				<form class="needs-validation" novalidate>
					<div class="form-row">
						<div class="col-md-12 mb-3">
							<input type="text" class="form-control" id="post-title"
								placeholder="Title" required>
							<div class="valid-feedback">Looks good!</div>
						</div>
						<div class="col-md-12 mb-3">
							<label for="validationCustom02">Description</label>
							<textarea cols="5" rows="5" class="form-control"
								id="post-des" placeholder="Last name" required></textarea>
							<div class="valid-feedback">Looks good!</div>
						</div>
						<div class="col-md-12 mb-3">
							<input type="text" class="form-control" id="post-price"
								placeholder="credit" required>
							<div class="valid-feedback">Looks good!</div>
						</div>
						<div class="col-md-12 mb-3 mt-5 mb-5">
							<div class="separator-text">
								<span>Choose Category</span>

							</div>
						</div>
						<div class="col-md-6">
							<select class="custom-select mr-sm-2" id="post-category">
								<option selected>Category...</option>
								<option value="maternity">Maternity</option>
								<option value="clothing">Clothing</option>
								<option value="nursery Furniture">Nursery Furniture</option>
								<option value="bedding">Bedding</option>
								<option value="pushchairs & car seats">Pushchairs & Car Seats</option>
								<option value="toys">Toys</option>
								<option value="service">Service</option>
							</select>
						</div>
						<div class="col-md-6">
							<select class="custom-select mr-sm-2" id="post-subcategory">
								<option selected>Sub Category...</option>
								<option value="lingerie">Lingerie</option>
								<option value="bags">Bags</option>
								<option value="dresses">Dresses</option>
								<option value="Tops">Tops</option>
								<option value="baby clothes">Baby Clothes</option>
								<option value="baby clothes">Baby Clothes</option>
								<option value="girls clothing">Girls Clothing</option>
								<option value="boys clothing">Boys Clothing</option>
								<option value="footwear & accessories">Footwear & Accessories</option>
								<option value="service">service</option>


							</select>
						</div>
						<div class="col-md-6">
							<select class="custom-select mr-sm-2 mt-3" id="post-condition">
								<option selected>Condition...</option>
								<option value="new">New</option>
								<option value="liked new">Liked new</option>
								<option value="good">Good</option>
								<option value="used">Used</option>
							</select>
						</div>
						<div class="col-md-12 mt-5">
							<div class="separator-text">
								<span>Contact Details</span>

							</div>
						</div>
					</div>
					<div class="form-row mt-5">
					<div class="col-md-6 mb-3">
							<input type="text" class="form-control" id="post-email"
								placeholder="Email" required>
							<div class="invalid-feedback">Please provide a valid state.
							</div>
						</div>
							<div class="col-md-6 mb-3">
							<input type="text" class="form-control" id="post-tele"
								placeholder="Telephone" required>
							<div class="invalid-feedback">Please provide a valid state.
							</div>
						</div>
						<div class="col-md-12 mb-3">
							<input type="text" class="form-control" id="post-address"
								placeholder="Street" required>
							<div class="invalid-feedback">Please provide a valid city.
							</div>
						</div>
						<div class="col-md-5">
							<input type="text" class="form-control" id="post-town"
								placeholder="Town" required>
							<div class="invalid-feedback">Please provide a valid state.
							</div>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" id="post-county"
								placeholder="County" required>
							<div class="invalid-feedback">Please provide a valid state.
							</div>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control" id="post-postcode"
								placeholder="Postcode" required>
						</div>
					</div>

				</form>

			</div>

			<div class="col-md-12 mb-3 mt-5">
				<hr>
			</div>

			<button class="btn btn-submit mb-5 mt-5" type="submit">Submit form</button>



			<!-- /.row -->
		</div>
		<!-- /.container -->

	</div>


	<jsp:include page="navigator/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/js/jquery/jquery.min.js"></script>
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script defer src="resources/icon/js/fontawesome-all.js"></script>
	<script>
	
	function dataCollection(){
		data = {};
		data.title = $('#post-title').val();
		data.price = $('#post-price').val();
		data.description = $('#post-des').val();
		data.categoryName = $('#post-category').val();
		data.subcategories = $('#post-subcategory').val();
		data.address = {addrss: data.addres = $('#post-address').val(),
		postcode: data.postcode = $('#post-postcode').val(),

		}
			//data.addres = $('#post-address').val();
		data.smalldescription = $('#post-town').val();
		data.city = $('#post-county').val();
		//data.postcode = $('#post-postcode').val();
		//data.img = $('#post-image').val();
		data.telephone = $('#post-tele').val();
		data.email = $('#post-email').val();
		data.condition = $('#post-condition').val();
		 data.creationDate  = new Date();
		
		return data;
		console.log(data.address)
	}

	function previewImage(){
		
		if(this.file && this.file[0]){
			var obj = new FileReader();
			obj.onload = function(data){
				var img = document.getElementById('imgs');
				img.src = data.target.result;
				img.style.display="block";
			}
			obj.readAsDataURL(this.files[0]);
			
		}
		
	}
$(function() {
	
	$('.btn-submit').click(function(){
	
		$.ajax({
			url : "<c:url value = '/advertisement/add'/>",
			type : "POST",
			headers: { 
					'Accept': 'application/json',
					'Content-Type': 'application/json' 
					}, 
			context:$(this),
			data: JSON.stringify( dataCollection()),
			success : function(data) {
				console.log(data)
				top.location.href = '/upload?info='+ data.id;
			},
			error:function(err) {
				console.log(err)
				
			},
			complete:function(xmlHttp) {
				console.log(xmlHttp.status);
				
				if (xmlHttp.status == 200) {
		
				}
				
			}
	
		});				
	})
});
	</script>
</body>
</html>