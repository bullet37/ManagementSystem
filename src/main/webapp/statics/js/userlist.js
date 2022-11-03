var userObj;

function deleteUser(obj){
	$.ajax({
		type:"GET",
		url:path+"/jsp/user.do",
		data:{method:"deluser",uid:obj.attr("userid")},
		dataType:"json",
		success:function(data){
			if(data.delResult == "true"){
				cancleBtn();
				obj.parents("tr").remove();
			}else if(data.delResult == "false"){
				changeDLGContent("Sorry, delete user ["+obj.attr("username")+"] failed");
			}else if(data.delResult == "notexist"){
				changeDLGContent("Sorry, user ["+obj.attr("username")+"] not exists");
			}
		},
		error:function(data){
			changeDLGContent("Sorry, delete failed");
		}
	});
}

function openYesOrNoDLG(){
	$('.zhezhao').css('display', 'block');
	$('#removeUser').fadeIn();
}

function cancleBtn(){
	$('.zhezhao').css('display', 'none');
	$('#removeUser').fadeOut();
}
function changeDLGContent(contentStr,yesString ="Yes",NoString = "No"){
	var p = $(".removeMain").find("p");
	p.html(contentStr);
}

$(function(){
	/**
	 * bind、live、delegate
	 * on
	 */
	$(".viewUser").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/jsp/user.do?method=view&uid="+ obj.attr("userid");
	});
	
	$(".modifyUser").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/jsp/user.do?method=modify&uid="+ obj.attr("userid");
	});

	$('#no').click(function () {
		cancleBtn();
	});
	
	$('#yes').click(function () {
		deleteUser(userObj);
	});

	$(".deleteUser").on("click",function(){
		userObj = $(this);
		changeDLGContent("Sure to delete the user ["+userObj.attr("username")+"] ?");
		openYesOrNoDLG();
	});
	
	$(".deleteUser").on("click",function(){
		var obj = $(this);
		if(confirm("Sure to delete the user ["+obj.attr("username")+"] ?")){
			$.ajax({
				type:"GET",
				url:path+"/jsp/user.do",
				data:{method:"deluser",uid:obj.attr("userid")},
				dataType:"json",
				success:function(data){
					if(data.delResult == "true"){
						alert("Successfully deleted");
						obj.parents("tr").remove();
					}else if(data.delResult == "false"){
						alert("Sorry, delete user ["+obj.attr("username")+"] failed");
					}else if(data.delResult == "notexist"){
						alert("Sorry, user ["+obj.attr("username")+"] not exists");
					}
				},
				error:function(data){
					alert("Sorry, delete failed");
				}
			});
		}
	});
});