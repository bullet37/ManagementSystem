var oldpassword = null;
var newpassword = null;
var rnewpassword = null;
var saveBtn = null;

$(function(){
	oldpassword = $("#oldpassword");
	newpassword = $("#newpassword");
	rnewpassword = $("#rnewpassword");
	saveBtn = $("#save");

	oldpassword.next().html("*");
	newpassword.next().html("*");
	rnewpassword.next().html("*");

	oldpassword.on("blur",function(){
		$.ajax({
			type:"GET",
			url:path+"/jsp/user.do",
			data:{method:"pwdmodify",oldpassword:oldpassword.val()},
			dataType:"json",
			success:function(data){
				if(data.result == "true"){
					validateTip(oldpassword.next(),{"color":"green"},imgYes,true);
				}else if(data.result == "false"){
					validateTip(oldpassword.next(),{"color":"red"},imgNo + " Original password incorrect",false);
				}else if(data.result == "sessionerror"){
					validateTip(oldpassword.next(),{"color":"red"},imgNo + " Session expired, please log in again",false);
				}else if(data.result == "error"){
					validateTip(oldpassword.next(),{"color":"red"},imgNo + " Please enter the original password",false);
				}
			},
			error:function(data){
				validateTip(oldpassword.next(),{"color":"red"},imgNo + " Request error",false);
			}
		});


	}).on("focus",function(){
		validateTip(oldpassword.next(),{"color":"#666666"},"* Please enter the original password",false);
	});

	newpassword.on("focus",function(){
		validateTip(newpassword.next(),{"color":"#666666"},"* Password length must be greater than 6 and less than 20",false);
	}).on("blur",function(){
		if(newpassword.val() != null && newpassword.val().length > 5
			&& newpassword.val().length < 20 ){
			validateTip(newpassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(newpassword.next(),{"color":"red"},imgNo + " Entered password is incorrect, please re-enter",false);
		}
	});


	rnewpassword.on("focus",function(){
		validateTip(rnewpassword.next(),{"color":"#666666"},"* Please re-enter your password",false);
	}).on("blur",function(){
		if(rnewpassword.val() != null && rnewpassword.val().length > 5
			&& rnewpassword.val().length < 20 && newpassword.val() == rnewpassword.val()){
			validateTip(rnewpassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(rnewpassword.next(),{"color":"red"},imgNo + " Two password entries are inconsistent, please re-enter",false);
		}
	});


	saveBtn.on("click",function(){
		oldpassword.blur();
		newpassword.blur();
		rnewpassword.blur();
		if(oldpassword.attr("validateStatus") == "true"
			&& newpassword.attr("validateStatus") == "true"
			&& rnewpassword.attr("validateStatus") == "true"){
			if(confirm("Sure to change your password?")){
				$("#userForm").submit();
			}
		}

	});
});