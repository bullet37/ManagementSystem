var userCode = null;
var userName = null;
var userPassword = null;
var ruserPassword = null;
var phone = null;
var birthday = null;
var userRole = null;
var addBtn = null;
var backBtn = null;


$(function(){
	userCode = $("#userCode");
	userName = $("#userName");
	userPassword = $("#userPassword");
	ruserPassword = $("#ruserPassword");
	phone = $("#phone");
	birthday = $("#birthday");
	userRole = $("#userRole");
	addBtn = $("#add");
	backBtn = $("#back");
	userCode.next().html("*");
	userName.next().html("*");
	userPassword.next().html("*");
	ruserPassword.next().html("*");
	phone.next().html("*");
	birthday.next().html("*");
	userRole.next().html("*");
	
	$.ajax({
		type:"GET",
		url:path+"/jsp/user.do",
		data:{method:"getrolelist"},
		dataType:"json",
		success:function(data){
			if(data != null){
				userRole.html("");
				var options = "<option value=\"0\">Please select</option>";
				for(var i = 0; i < data.length; i++){
					options += "<option value=\""+data[i].id+"\">"+data[i].roleName+"</option>";
				}
				userRole.html(options);
			}
		},
		error:function(data){
			validateTip(userRole.next(),{"color":"red"},imgNo+" Get user role list error",false);
		}
	});

	userCode.bind("blur",function(){
		$.ajax({
			type:"GET",
			url:path+"/jsp/user.do",
			data:{method:"ucexist",userCode:userCode.val()},
			dataType:"json",
			success:function(data){
				if(data.userCode == "exist"){//Account already exists, error message
					validateTip(userCode.next(),{"color":"red"},imgNo+ " The user account already exists",false);
				}else{//Account is available, correct prompt
					validateTip(userCode.next(),{"color":"green"},imgYes+" This account can be used",true);
				}
			},
			error:function(data){
				validateTip(userCode.next(),{"color":"red"},imgNo+" The page you are visiting does not exist",false);
			}
		});
		
		
	}).bind("focus",function(){
		//Tip for login
		validateTip(userCode.next(),{"color":"#666666"},"* ID is your account to log in to the system",false);
	}).focus();
	
	userName.bind("focus",function(){
		validateTip(userName.next(),{"color":"#666666"},"* Username length must be greater than 1 and less than 10",false);
	}).bind("blur",function(){
		if(userName.val() != null && userName.val().length > 1
				&& userName.val().length < 10){
			validateTip(userName.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userName.next(),{"color":"red"},imgNo+" Entered username is incorrect, please re-enter",false);
		}
		
	});
	
	userPassword.bind("focus",function(){
		validateTip(userPassword.next(),{"color":"#666666"},"* Password length must be greater than 6 and less than 20",false);
	}).bind("blur",function(){
		if(userPassword.val() != null && userPassword.val().length > 6
				&& userPassword.val().length < 20 ){
			validateTip(userPassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userPassword.next(),{"color":"red"},imgNo + " Entered password is incorrect, please re-enter",false);
		}
	});
	
	ruserPassword.bind("focus",function(){
		validateTip(ruserPassword.next(),{"color":"#666666"},"* Please re-enter the password",false);
	}).bind("blur",function(){
		if(ruserPassword.val() != null && ruserPassword.val().length > 6
				&& ruserPassword.val().length < 20 && userPassword.val() == ruserPassword.val()){
			validateTip(ruserPassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(ruserPassword.next(),{"color":"red"},imgNo + " Two password entries are inconsistent, please re-enter",false);
		}
	});
	
	
	birthday.bind("focus",function(){
		validateTip(birthday.next(),{"color":"#666666"},"* Click the input box to select the date",false);
	}).bind("blur",function(){
		if(birthday.val() != null && birthday.val() != ""){
			validateTip(birthday.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(birthday.next(),{"color":"red"},imgNo + " Selected date is incorrect, please re-enter",false);
		}
	});
	
	phone.bind("focus",function(){
		validateTip(phone.next(),{"color":"#666666"},"* Please enter phone number",false);
	}).bind("blur",function(){
		var patrn=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
		if(phone.val().match(patrn)){
			validateTip(phone.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(phone.next(),{"color":"red"},imgNo + " Your phone number is incorrect",false);
		}
	});
	
	userRole.bind("focus",function(){
		validateTip(userRole.next(),{"color":"#666666"},"* Please select user role",false);
	}).bind("blur",function(){
		if(userRole.val() != null && userRole.val() > 0){
			validateTip(userRole.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userRole.next(),{"color":"red"},imgNo + " Please reselect user role",false);
		}
	});
	
	addBtn.bind("click",function(){
		if(userCode.attr("validateStatus") != "true"){
			userCode.blur();
		}else if(userName.attr("validateStatus") != "true"){
			userName.blur();
		}else if(userPassword.attr("validateStatus") != "true"){
			userPassword.blur();
		}else if(ruserPassword.attr("validateStatus") != "true"){
			ruserPassword.blur();
		}else if(birthday.attr("validateStatus") != "true"){
			birthday.blur();
		}else if(phone.attr("validateStatus") != "true"){
			phone.blur();
		}else if(userRole.attr("validateStatus") != "true"){
			userRole.blur();
		}else{
			if(confirm("Confirm the submitted data")){
				$("#userForm").submit();
			}
		}
	});
	
	backBtn.on("click",function(){
		if(referer != undefined 
			&& null != referer 
			&& "" != referer
			&& "null" != referer
			&& referer.length > 4){
		 window.location.href = referer;
		}else{
			history.back(-1);
		}
	});
});