<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript">
	function addprocess() {
		$
				.ajax({
					type : "post",
					url : "addData.jsp",
					data : "uid=" + $('#uid').val() + "&pwd="
							+ $('#password').val() + "&name="
							+ $('#name').val() + "&role=" + $('#role').val(),
					success : function(msg) {
						$('#output').append(msg);
					}
				});

	}
	function deleteprocess() {
		if (confirm("Confirm delete?")) {
			$.ajax({
				type : "post",
				url : "deletedata.jsp",
				data : "uid=" + $('#uid').val(),
				success : function(msg) {
					$('#output').append(msg);
				
				}
			});
		}

	}
	function searchdata() {
		$.ajax({
			type : "post",
			url : "search.jsp",
			data : "uid=" + $('#uid').val() + "&pwd=" + $('#password').val(),
			success : function(msg1) {
				$('#search_result').append(msg1);

			}
		});

	}
	function editprocess() {
		$.ajax({
			type : "post",
			url : "editdata.jsp",
			data : "uid=" + $('#uid').val(),
			success : function(msg) {
				split = msg.split(":");
				document.getElementById("name").value = split[1];
				document.getElementById("password").value = split[2];
				document.getElementById("role").value = 'student';
			}
		});

	}
	
	function savedata(){
		alert("Save data? ")
		$.ajax({
			type : "post",
			url : "savedata.jsp",
			data : "uid=" + $('#uid').val() + "&pwd="
			+ $('#password').val() + "&name="
			+ $('#name').val() + "&role=" + $('#role').val(),
			success : function(msg1) {
				$('#search_result').append(msg1);

			}
		});
	}
	
</script>
</head>
<body>
	<h4 style="text-align:center; color:blue">CRUD Form </h4>
	<form action="result.jsp">
		<div class="form-group row">
			<label for="uid" class="control-label col-sm-2 text-center"><b>Enter UID</b></label>
			<div class="col-sm-10">
				<input type="number" width="1" id="uid" placeholder="UID" required>
			</div>
		</div>
		<br>
		<div class="form-group row">
			<label for="name" class="control-label col-sm-2 text-center"><b>Enter Name</b></label>
			<div class="col-sm-10">
				<input type="text" id="name" placeholder="Name">
			</div>
		</div>
		<br>

		<div class="form-group row">
			<label for="password" class="control-label col-sm-2 text-center"><b>Enter Password</b></label>
			<div class="col-sm-10">
				<input type="text" id="password" placeholder="Your password">
				<div class="input-group-addon">
					<a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
				</div>
			</div>
		</div>
		<br>
		<div class="form-group row">
			<label for="Role" class="control-label col-sm-2 text-center"><b> Enter Role</b></label>
			<div class="col-sm-10">
				<select id="role">
					<option value="Developer">Developer</option>
					<option value="DB manager">DB Manager</option>
					<option value="DB manager">client</option>
				</select>
			</div>
		</div>
		<br>
	
		<div class="form-group row">
			<div class="col-sm-2 text-center">
				<input type="button" class="btn btn-primary" id="add" value="Add"
					onclick="addprocess()">
			</div>
			<div class="col-sm-10 pull-right">
				<button type="button" class="btn btn-primary" id="delete"
					onclick="deleteprocess()">Delete</button>
			</div>
		</div>
		<br>
		<div class="form-group row">
			<div class="col-sm-2 text-center">
				<input type="button" class="btn btn-primary" onclick="editprocess(); change(this)"
					value="Edit">
				<script type="text/javascript">
					function change(el) {
						if (el.value === "Edit") {
							el.value = "Save";	
						} else {
							savedata();
							el.value = "Edit";
						}
					}
				</script>
			</div>
			<div class="col-sm-10 pull-right">
				<input type="button" class="btn btn-primary" onclick="searchdata()"
					value="Search">
			</div>
		</div>
		<br>
		<div class="form-group row">
			<div id="output" class="mx-3"></div>
		</div>
		<div class="form-group row">
			<div id="search_result" class="mx-3"></div>
		</div>
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>