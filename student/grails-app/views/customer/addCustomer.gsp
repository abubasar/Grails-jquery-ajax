<!doctype html>

<html>
<head>
	<title>grails-jquery</title>
        <meta name="layout" content="main">
        <script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
        
        <script type="text/javascript">
            
   $(document).ready(function(){
   
    var form= $("#formCustomer");


   form.submit(function(event){
	var firstName=$("#firstName").val();
        var lastName=$("#lastName").val();
        var email=$("#email").val();
        var message=$("#message").val();
        var checked=$("#checkbox").is(":checked");
        var password=$("#password").val();

	validateFirstNameFeild(firstName,event);
        validatelastNameFeild(lastName,event);
        validateEmailFeild(email,event);
        validateMessageField(message,event);
        validateCheckboxField(checked,event);
	validatePasswordField(password,event);
        
});
function validateFirstNameFeild(firstName,event){
if(!isValidFirstName(firstName)){
$("#firstName-feedback").text("Please enter at least two characters");
event.preventDefault();
	} else{
		$("#firstName-feedback").text("");
	}
}
function validatelastNameFeild(lastName,event){
if(!isValidLastName(lastName)){
$("#lastName-feedback").text("Please enter at least two characters");
event.preventDefault();
	} else{
		$("#lastName-feedback").text("");
	}
}

function validateEmailFeild(email,event){
if(!isValidEmail(email)){
$("#email-feedback").text("Please enter a valid email address");
event.preventDefault();
	} else{
		$("#email-feedback").text("");
	}
}

function validateMessageField(message,event){
	if(!isValidMessage(message)){
$("#message-feedback").text("Please enter a message");
event.preventDefault();
	} else{
		$("#message-feedback").text("");
	}
}

function validateCheckboxField(isChecked,event){
	if(!isChecked){
$("#checkbox-feedback").text("Please agree to this");
event.preventDefault();
	} else{
		$("#checkbox-feedback").text("");
	}
}


function validatePasswordField(password,event){
	if(!isValidPassword(password)){
$("#password-feedback").text("The password should have at least six characters and contain a number");
event.preventDefault();
	} else{
		$("#password-feedback").text("");
	}
}

function isValidFirstName(firstName){
	return firstName.length>=2;
}
function isValidLastName(lastName){
	return lastName.length>=2;
}
function isValidEmail(email) {
return /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email);
}
function isValidMessage(message){
	return message.trim() !="";

}
function isValidPassword(password){
	return password.length>=6 && /.*[0-9].*/.test(password);

}

});



</script>
</head>

<body>
<div id=container>
    <div id="head>"<h1>Grails with jquery form validation</h1></div>
  <div id="msg"></div> 
<div id="form">
<g:form id="formCustomer" name="formCustomer" action="addCustomer" method="post">
First Name:<input id="firstName" type="text" name="firstName"><span id="firstName-feedback"></span> <br>
Last Name:<input id="lastName" type="text" name="lastName"><span id="lastName-feedback"></span> <br>
Email:<input id="email" type="email" name="email"><span id="email-feedback"></span> <br>
<textarea name="message" id="message" cols="30" rows="10" placeholder="Enter your message here"></textarea> <span id="message-feedback"></span><br>
<input id="checkbox" type="checkbox" name="notify"> <label for="notify">you must agree to get email notification!</label><span id="checkbox-feedback"></span><br>
Password:<input id="password" type="password" name="password"><span id="password-feedback"></span> <br>

<input id="submit" type="submit" name="submit" value="Submit">
</g:form>
<div id="list"></div>
</div>
<div id="list"></div>
</div>
</body>
</html>