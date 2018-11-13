<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import = "com.aaron.babebasket.models.Users" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Babe-Basket - Login</title>
<link rel="stylesheet" href="<c:url value = '/resources/css/main.css'/>">
<link rel="stylesheet"
	href="<c:url value = '/resources/css/bootstrap.min.css'/>">
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

  <div class="alert alert-rouge alert-danger alert-dismissible show fixed-top" role="alert">
		<strong> <p class="errorMessga"></p></strong>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
  <div class="alert alert-warning alert-dismissible show fixed-top" role="alert">
		<strong> <p class="errorMessga"></p></strong>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>

	<div class="container">
		<div class="row">

			<div class="col-md-8">
				<div class="section-carousel">
					<div id="carouselExampleSlidesOnly" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100" src="http://placehold.it/900x350"
									alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="http://placehold.it/900x350"
									alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="http://placehold.it/900x350"
									alt="Third slide">
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-12 ad-dt-form" style="display: none">
					<div class="section-detail">
						<div class="card card-ads-detail">


							<div class="ads-contact">
								<h4>Contact Seller</h4>
								<%-- <form id="contact-form" class="contact-form" name="contact-form"
									method="post" action="#"> --%>
									<div class="row form-sector">
										<div class="col-md-12">
											<div class="form-group">
												<input type="text" class="form-control" id="subject" required="required"
													placeholder="Subject">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<textarea name="message" id="message" required="required"
													class="form-control" rows="5" placeholder="Message"></textarea>
											</div>
										</div>
									</div>
									<div class="form-group">
										<button type="button" class="btn btn-primary message-btn">Submit
											Message</button>
									</div>

								<%-- </form> --%>
							</div>

						</div>
					</div>
          
          <div class="card card-ads-detail">

							<div class="section-adsOffer">
								<h4>Make an Offer</h4>
								<%-- <form id="contact-form" class="contact-form" name="contact-form"
									method="post" action="#"> --%>
									<div class="row form-sector">
										
                    <div class="col-md-6">
												<div class="form-group">
											<select  class="custom-select" id="exchangeOption">
												<option value="0">Select Exchange:</option>
												<option value="credit">Credit</option>
												<option value="item">advertisement</option>
											</select>
											
										</div>
									</div>
                    <div class="col-md-6">
											<div class="form-group">
												<input type="text" class="form-control crediInput" style="display:none" required="required"
													placeholder="Credit">
											</div>
										</div>
                    
                     <div class="form-group">
										<button type="button" class="btn btn-success credit-btn">Submit Offer
											</button>
										
							</div>
							<div class="col-md-12">
                      <table class="table" style="display:none">
                        <thead>
                          <tr>
                            <th scope="col">Title</th>
                            <th scope="col">Description</th>
                            <th scope="col">Credit</th>
                            <th scope="col">Action</th>
                          </tr>
                        </thead>
                        <tbody></tbody>
                      </table>
										</div>
										<div class="col-md-12">
										</div>
									</div>
									<%-- <div class="form-group">
										<button type="button" class="btn btn-primary credit-btn">Submit
											Message</button>
									</div> --%>

								<%-- </form> --%>
							</div>

						</div>
					</div>
				<div class="col-md-12 mb-4 ad-dt">
					<div class="section-detail">
						<div class="card card-ads-detail">
							<div class="card-body row">
									<div class="col-md-12 date-section">
										<div class="card-price-wrap"></div>
									</div>
									<div class="col-md-12">
										<div class="divider"></div>
									</div>
									<div class="ad-detail">
										<h5>Description</h5>
									</div>
							</div>
						</div>

					</div>
				</div>

			</div>

			<div class="col-lg-4 side-filter">

				<div class="card side-cat-ads">
					<div class="card-body">
						<h5 class="card-title">Seller Info</h5>
						<div class="divider"></div>
						<div class="row">
							<div class="col-md-4">
								<div class="seller-image">
									<img class="img-responsive"
										src="/resources/images/seller-pic.png" alt="seller">
								</div>
							</div>
							<div class="col-md-8">
								<div class="seller-info">
								<div class="hidden-info">
									<p>
										<span>Seller:</span> <a href="#">Mark Bartlar</a>
									</p>
									<address>
										<span>Address:</span> 151/7, Green Road, NY, USA
									</address>
									<p>
										<span>Phone :</span> +012 012 345 678
									</p></div>
									<p>
									
										<a class="btn btn-form">contact Seller</a>
									</p>
								</div>
							</div>
						</div>
						<div class="divider"></div>

						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2646.216225729443!2d-89.2391164!3d48.45238070000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4d5921616d61c26b%3A0x15e5407d2071c8dd!2s109+Hogarth+St%2C+Thunder+Bay%2C+ON+P7A+7G8!5e0!3m2!1sen!2sca!4v1424371524427"
							width="300" height="250" frameborder="0" style="border: 0"></iframe>

					</div>
				</div>

				<div class="col-lg-12 side-form">
					<div class="list-group side-cat">
						<a href="#" class="list-group-item">Category</a> <a href="#"
							class="list-group-item">Category 2 <span>(122)</span></a> <a
							href="#" class="list-group-item">Category 3 <span>(122)</span></a>
					</div>
				</div>
				<!-- /.col-lg-3 -->
			</div>
		</div>

	</div>

	<jsp:include page="navigator/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/js/jquery/jquery.min.js"></script>
	<script src="/resources/js/bootstrap.bundle.min.js"></script>
	<script defer src="/resources/icon/js/fontawesome-all.js"></script>

<script type="text/javascript">
function collectionData() {
		data = {};
			data.subject = $('#subject').val();
			data.message = $('#message').val();
			data.advertId = $('.card-title').data('id');
			data.sendTo = "5b9d18239087fc0140b122e2";
			data.option = $('#exchangeOption').find('option:selected').val();
			data.from = "${tempUser.id}";
      
		return data;	
	}
	var id = "";
  	 var creditIn ="";
$(function() {
			
	itemDetail();		
});

function itemDetail() {
   
	$.ajax({
		type: "GET",
		contentType: "application/json; charset=utf-8",
		url: "<c:url value = 'advertisement/title'/>",
		data: {title: "${param.title}"},
		success: function (response) {
			$.each(response, function (index, el) {
				var _desc = $("<p class='card-text'>"+el.description+"</p>");
				$(".ad-detail").append(_desc);

				var _status = $("<span class='card-link ads-price'>Credit: "+el.price+"</span>");
				$(".card-price-wrap").append(_status);

				var _title = $("<h5 class='card-title' data-id='"+el.id+"'>"+el.title +"</h5><span class='card-link ads-status'>"+el.status+"</span>")
				$(".card-link").after(_title);

				var _date = $("<span class='ads-date'>"+el.creationDate+"</span>")
                $(".ads-status").after(_date);
             
             id =el.id;
			});
		}
	});


   $('.alert').hide();
	$('.seller-image, .hidden-info').hide();
	var username = "${user.username}";
			
	$('.btn-form').click(function() {
		if ("${tempUser.username}") {
			$('.ad-dt-form').slideToggle();
			$('.seller-image, .hidden-info').show();
        } else {
	        errorMessage = "must be login !!";
	        $('.alert-warning').alert().fadeIn().delay(5000).fadeOut()
	        $('.errorMessga').html(errorMessage);
	    }
	});	
	sendMessage();		
}

function makeOffer(id) {
   
   $(".ads-offer").click(function (e) { 
     
      var _offerid = $(this).data('offerid');
      var swap = {
               userId: "${tempUser.id}",
               offeredAdvertId: _offerid,
       }
       e.preventDefault();
      
       $.ajax({
          type: "POST",
          url: "<c:url value = '/advertisement/"+id+"/offer/new/swap'/>",
		  contentType: "application/json; charset=utf-8",
          data: swap,
          success: function (response) {
            $('.section-adsOffer').empty().append('<h3 class="sucess-sent">thank you for accepting a swap</h3>');  
             
          }
       });
    });  
      
}

function sendMessage() {
	var _option = "";
   var mess = $('#message').val();
	var subj = $('#subject').val()
	var	_id = $('.card-title').data('id')
      
   $('#exchangeOption').on('change', function () {
    	_option = $('#exchangeOption').val();
		if ( _option =="credit") {
			$('.crediInput').show();
			$('.table').hide();
		}else if( _option == "item") {
			$('.table').show();
			$('.crediInput').hide();
		}else{
			errorMessage = "must select one!!";
	        $('.alert-warning').alert().fadeIn().delay(5000).fadeOut()
	        $('.errorMessga').html(errorMessage);
		}
     });
 
	$(".message-btn").click(function (e) {
		e.preventDefault();	 
        if (_option.length == 0 && _option == 0 && mess.length == 0 && subj.length == 0) {
        	errorMessage = "must select exchange option and enter message and subject !!";
	        $('.alert-rouge').alert().fadeIn().delay(5000).fadeOut()
	        $('.errorMessga').html(errorMessage);
        }else{
	        $.ajax({
		        type: "POST",
		        url:"<c:url value = 'message/send-message'/>",
				contentType: "application/json; charset=utf-8",
		        data: collectionData(),
	            success: function (response) {
	            	$('.ads-contact').empty().append('<h3 class="sucess-sent">your message has been send</h3>');  
	            }
			});
		}
	 });
}
  
 ListOfOffer();
function ListOfOffer() {
   console.log("${tempUser.email}")
   var rowOffer="";
	$.ajax({
        type: "GET",
        url: "<c:url value = 'advertisement/user-ads'/>",
		contentType: "application/json; charset=utf-8",
        data: {email:"${tempUser.email}"},
        success: function (resp) {
        	console.log(resp.length );
        
          	$.each(resp, function (index, val) {
				  if (confirm("Are you sure you want to exchange by ads")) {
					   rowOffer = $(' <tr><th scope="row">'+val.title+'</th><td><div class="tabl-descri">'+val.description+'</div></td><td>'+val.price+'</td><td><a type="button" class="ads-offer" data-offerid="'+val.id+'">accpet</a></td></tr>');
             			$('tbody').append(rowOffer);
				  }
          		
          	});      
        }
    });

	$('.crediInput').on('change', function () {
       creditIn = $(this).val();
        console.log(creditIn, " ------->",  creditIn >= "${tempUser.points}");
		if (isNaN(creditIn)) {
           alert("Must input numbers");
            return
        }
	
	   });
	
	$('.credit-btn').click(function (e) {
            e.preventDefault();
		if (isNaN(creditIn)) {
		   errorMessage = "Must only enter number !!";
	        $('.alert-rouge').alert().fadeIn().delay(5000).fadeOut()
	        $('.errorMessga').html(errorMessage);
            return
       
	    }else if (creditIn >= "${tempUser.points}" || creditIn == 0 ) {
			errorMessage = "you do not have enough credit !!";
	        $('.alert-rouge').alert().fadeIn().delay(5000).fadeOut()
	        $('.errorMessga').html(errorMessage);
		} else {
            $.ajax({
               type: "POST",
               url: "<c:url value = '/advertisement/"+id+"/offer/new/point'/>",
               data: {userId:"${tempUser.id}", amount:creditIn},
               success: function (response) {
                  console.error(response); 
                  $('.section-adsOffer').empty().append('<h3 class="sucess-sent">thank you for making an offer</h3>');
               },
               complete: function(xmlHttp) {
                  console.log(xmlHttp);
               }

            });
		}
        });
	
}
 
</script>
</body>
</html>