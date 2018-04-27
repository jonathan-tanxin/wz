function get(url, successHandler) {
	$.ajax({
		url: url,
		dataType: 'json',
		type: 'get',
		success: function(data) {
			if (successHandler) {
				successHandler(data);
			}
		}
		
	}) 
}

function post(url, data, successHandler) {
	if (!data) {
		data = {};
	}
	$.ajax({
		url: url,
		dataType: 'json',
		data: data,
		type: 'post',
		success: function(data) {
			if (successHandler) {
				successHandler(data);
			}
		}
		
	}) 
}

function isSuccess(data) {
	if (data.success) {
		return true;
	} else {
		alert(data.msg);
		return false;
	}

}