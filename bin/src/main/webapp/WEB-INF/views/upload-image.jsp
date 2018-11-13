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
	<jsp:include page="navigator/navbar.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<div class="row justify-content-md-center mt-5">

			<div class="col-sm-6 col-md-8 mb-4">
				<h3 class="mt-5 post-title">Post Your Ad</h3>
				<div class="post-title-line"></div>

				

                <div class="col-md-12 mb-3 mt-5 mb-5" style="padding-left: 0; padding-right: 0;">
                    <form id="uploadForm" action="/advertisement/5ba6918b9087fcdf90ba9736/addd-image" method="post" enctype="multipart/form-data">
                    	<div class="col-md-12 mb-3">
							<input type="text" name="name" class="form-control" id="post-title"
								placeholder="Title" required>
							<div class="valid-feedback">Looks good!</div>
						</div>

                    <div class="col-md-12 mb-3 mt-5 mb-5" id="upload-wrap">
                        <div id="img-section"></div>
                       <%-- <div class="icon-choose-image" >
                        <input name="userImage" id="userImage" type="file" class="inputFile" onChange="showPreview(this);" /> --%>

                        <input name="image" id="userImage" type="file" class="custom-file-input" id="post-image" onChange="Preview(this);">
						<label class="custom-file-label icon-choose-image" for="customFile">Choose
							file</label>
                        </div>
                    </div>
                    <div>
                    <input type="submit" value="Upload Photo" class="btnSubmit" />
                   </form> 
                </div>


			</div>

			<div class="col-md-12 mb-3 mt-5">
				<hr>
			</div>

			<button class="btn btn-submit mb-5 mt-5" type="button">Submit form</button>



			<!-- /.row -->
		</div>
		<!-- /.container -->

	</div>


	<jsp:include page="navigator/footer.jsp"></jsp:include>
</body>
</html>
<script>
function Preview(objFileInput) {
    if (objFileInput.files[0]) {
        var fileReader = new FileReader();
        fileReader.onload = function (e) {
            $("#img-section").html('<img src="'+e.target.result+'" width="200px" height="200px" class="upload-preview" style="margin-top: 232px;" />');
			$("#img-section").css('opacity','1');
			$(".icon-choose-image").css({'opacity':'0.5','margin-top':'232px;'});
        }
		fileReader.readAsDataURL(objFileInput.files[0]);
    }
}

$(function() {


    
})

</script>