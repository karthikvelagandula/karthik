function checkOnlyNum(field) {	
	var fieldRef = document.getElementById(field).value;
	var onlyNum = /^[0-9]+$/.test(fieldRef);
	if(fieldRef.length == 0 || onlyNum) {
		document.getElementById(field).focus();
		return true;
	}else {
		return false;
	}
}


function checkFloatingPointNum(field) {	
	var fieldRef = document.getElementById(field).value;
	var onlyNum = /^[0-9.]+$/.test(fieldRef);
	if(fieldRef.length == 0 || onlyNum) {
		return true;
	}else {
		document.getElementById(field).focus();
		return false;
	}
}


function checkInputCharRange(field,range) {	
	var fieldRef = document.getElementById(field).value;
	if(fieldRef.length < 2 || fieldRef.length > range) {
		document.getElementById(field).focus();
		return true;
	}else {
		return false;
	}
}


function checkCharRangeWhenNotNull(field,range) {	
	var fieldRef = document.getElementById(field).value;
	if(fieldRef.length != 0 && (fieldRef.length < 2 || fieldRef.length > range)) {
		document.getElementById(field).focus();
		return true;
	}else {
		return false;
	}
}



function checkZipcode(field,range) {	
	var fieldRef = document.getElementById(field).value;
	if(fieldRef.length < 5 && fieldRef.length < range) {
		document.getElementById(field).focus();
		return true;
	}else {
		return !checkOnlyNum(field);
	}
}
