function page_nav(frm,num){
		frm.pageIndex.value = num;
		frm.submit();
}

function jump_to(frm,num){

	var regexp=/^[1-9]\d*$/;
	var totalPageCount = document.getElementById("totalPageCount").value;
	//alert(totalPageCount);
	if(!regexp.test(num)){
		alert("Please enter a positive integer!");
		return false;
	}else if((num-totalPageCount) > 0){
		alert("Please enter a page number less than the total number of pages");
		return false;
	}else{
		page_nav(frm,num);
	}
}