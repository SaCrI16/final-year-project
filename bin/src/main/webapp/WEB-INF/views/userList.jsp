<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Moses Basket- Users list</title>
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
	<div class="mb-userlist section">
		<div class="container">

			<div class="row justify-content-md-center mt-5">
				<div class="card card-ads col-md-12">
					<div class="card-body row">
					<h3 class="header-userlist">List of Users</h3>
						<table class="table">
							<thead>
								<!-- <tr>
									<th scope="col">Username</th>
									<th scope="col">Firstname</th>
									<th scope="col">Lastname</th>
									<th scope="col">Email</th>
									<th scope="col">Role</th>
									<th scope="col">Action</th>
								</tr> -->
							</thead>
							<tbody class="databody">
							</tbody>
						</table>
					</div>
				</div>

			</div>

			<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
						<div class="col-md-10 justify-content-md-center ml-5">
							<div class="form-group">
								<input type="email" class="form-control" id="exampleInputEmail1"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<input type="email" class="form-control" id="exampleInputEmail2"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<input type="email" class="form-control" id="exampleInputEmail3"
									placeholder="Enter email">
							</div>

							<div class="form-group">
								<input type="email" class="form-control" id="exampleInputEmail4"
									placeholder="Enter email">
							</div>

							<div class="form-group">
								<input type="email" class="form-control" id="exampleInputEmail5"
									placeholder="Enter email">
							</div>

							<div class="form-group">
								<input type="email" class="form-control" id="exampleInputEmail6"
									placeholder="Enter email">
							</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary btn-save">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- /.container -->

	</div>


	<jsp:include page="navigator/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/js/jquery/jquery.min.js"></script>
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script defer src="resources/icon/js/fontawesome-all.js"></script>
	
	<script type="text/javascript">
	
	$(function(){
		getUserlist()
				
			
	})
			var tb= "";
	function getUserlist(){

		$.ajax({
			type: "GET",
			contentType: "application/json; charset=utf-8",
			context: $(this),
			url: "<c:url value = 'user'/>",
			success: function (response) {
				 
					$.each(response, function (indexInArray, el) { 
						 tb = $('.databody').append("<tr class='removetr'><th scope='row' class='tdusername' data-username="+el.username+">"+el.username+"</th><td class='tdpasswd' data-password="+el.password+">"+el.password+"</td>\
						 <td class='tdfname' data-firstname="+el.firstname+">"+el.firstname+"</td><td class='tdsname' data-surname="+el.surname+">"+el.surname+"</td>\
							<td class='tdemail'data-email="+el.email+">"+el.email+"</td><td class='tdrole' data-role="+el.role+">"+el.role+"</td><td>\
							<a data-id="+el.id+" class='tbbin'><span><i class='fas fa-trash-alt'></i></span></a> \
							<a data-id="+el.id+" class='tbedit' data-toggle='modal' data-target='#exampleModal'><span><i class='fas fa-edit'></i></span></a>\
							<a data-id="+el.id+" class='tbeye'><span class='tbeye'><i class='fas fa-eye'></i></span></a></td></tr>");
						 
					});		
					removeUser(response);
					editUser($(this));
			}
		});
	 
	}

	function editUser(obj){
		tb.find(".tbedit").click(function (e) { 
			e.preventDefault();
			var cont = $(this).parent().parent();
			var _id= $(this).data('id');
			var _username = cont.find('.tdusername').data('username');
			var _password = cont.find('.tdpasswd').data('password');
			var _fname = cont.find('.tdfname').data('firstname');
			var _sname = cont.find('.tdsname').data('surname');
			var _email = cont.find('.tdemail').data('email');
			var _role = cont.find('.tdrole').data('role');
				
				 $('#exampleInputEmail1').val(_username);
				 $('#exampleInputEmail2').val(_password);
				 $('#exampleInputEmail3').val(_fname);
				 $('#exampleInputEmail4').val(_sname);
				 $('#exampleInputEmail5').val(_email);
				 $('#exampleInputEmail6').val(_role);

		});	

		function dataCollect() {
			var data = {};
				data.username = $('#exampleInputEmail1').val();
				data.password = $('#exampleInputEmail2').val();
				data.firstname= $('#exampleInputEmail3').val();
				data.surname  = $('#exampleInputEmail4').val();
				data.email 	  = $('#exampleInputEmail5').val();
				data.role 	  = $('#exampleInputEmail6').val();

				return data;
		}

		$(".btn-save").click(function (e) { 
			
			e.preventDefault();
			$.ajax({
				type: "POST",
				contentType: "application/json; charset=utf-8",
				url: "<c:url value = 'user/update'/>",
				context: $(this),
				data: dataCollect(),
				success: function (response) {
					console.log(response)
			}
			});
		
		});
	
}
	
	function removeUser(data) {
		
		tb.find(".tbbin").click(function (e) { 
			e.preventDefault();
			var _id= $(this).data('id');
			if (!confirm("Are you sure you want to delete this user?")) {
				return
			}
			
			$.ajax({
				type: "POST",
				url: "<c:url value = 'user/delete'/>",
				context: $(this),
				data: {"id":_id},
				success: function (response) {
					console.log( $(this).find('.removetr'));
					
					 $(this).closest('tr').fadeOut('fast', function() {
					        $(this).remove();
					 });	
				}
			});
			
		});
	
		
	}
	
	</script>
</body>
</html>