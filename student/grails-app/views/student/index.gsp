<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Student Service</title>
<!--<g:javascript library="jquery"/>-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
    

$(function(){
	 $("#form1").submit(function(event) {
			// Prevent the form from submitting via the browser.
			event.preventDefault()
			
			addStudent()
		})
		
		$("#form2").submit(function(event) {
			// Prevent the form from submitting via the browser.
			event.preventDefault()
			
			searchStudent()
		})
	    
		ShowStudentList()
})
function ShowStudentList(){
	$.ajax({
method:"POST",
url:"listStudent",
data:{},
success:function(data){
$("#divListStudent").html(data)
	 }
  })
}

function addStudent(){
   $.ajax({
		method:"POST",
		//url: "${g.createLink( controller: 'Student', action:'addStudent')}",
		url:"addStudent",
		data : $("#form1").serialize(),
		dataType : "json",
		success:function(data){
	console.log(data)
	if(data.msg=="OK"){
$("#msg").html("Student Added/Updated successfully")
$("input[name=firstName]").val("")
$("input[name=lastName]").val("")
$("input[name=email]").val("")
ShowStudentList()
		}else{
			$("#msg").html("Fields value must be unique,Not Blank,must have at least 2 characters")
	      }
       }
	})
}
function deleteStudent(id){
	if (confirm ("Are you sure to delete the Student?")){
		$.ajax({
			method:"POST",
			url:"deleteStudent",
			data:{"id":id},
			success:function(data){
				if(data.msg=="OK"){
					ShowStudentList()
					}else{
						$("#msg").html("Student deleting failed")
					     }
		         }
			})
	    }	
	}

	function updateStudent(id){
		$.ajax({
			method:"POST",
			url:"getStudent",
			data:{"id":id},
			success:function(data){
				$("#form1 input[name=firstName]").val(data.firstName)
				$("#form1 input[name=lastName]").val(data.lastName)
				$("#form1 input[name=email]").val(data.email)
			$("#form1 input[name=id]").val(data.id)
				}
		})
	}

	function searchStudent(){
		$.ajax({
			method:"POST",
			//url: "${g.createLink( controller: 'Student', action:'searchStudent')}",
			url: "searchStudent",
			data : $("#form2").serialize(),
			dataType : "json",
			success:function(data){
		console.log(data)
		
		var result="<thead><tr><th>FirstName</th><th>LastName</th><th>Email</th></tr></thead>";
				result +="<tbody>";
				$.each(data,function(k,v){
					result +="<tr>";
					result +="<td>";
					result +=v.firstName
					result +="</td>";
					result +="<td>";
					result+=v.lastName
					result +="</td>";
					result +="<td>";
					result+=v.email
					result +="</td>";
					result +="</tr>";
					
				});
				result +="</tbody>";
				$("#searchResult").html(result)
			}
		})
	}
</script>
</head>

<body>
<div id="container">
<div id="createStudent">
<div id="msg"></div>
<form id="form1" name="form1">
First Name:<input type="text" name="firstName" id="firstname">
Last Name:<input type="text" name="lastName" id="lastname">
Email:<input type="email" name="email" id="email">
<input type="hidden" name="id">
<input type="submit" name="submit" value="Add/Update a Student" >
</form>
</div>

<div id="searchStudent">
<form id="form2" name="form2">
<input type="text" name="search" id="search" placeholder="Search our Inventory" >
<input type="submit" name="submit" value="search" >
</form>
<div id="searchResult"></div>
</div>

<div id="divListStudent"></div>
</div>

</body>


</html>