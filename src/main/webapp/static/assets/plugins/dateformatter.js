$.FormatDateTime_YYYYMMDD = function (obj) {   
		        var myDate = new Date(obj);   
		        var year = myDate.getFullYear();  
		        var month = ("0" + (myDate.getMonth() + 1)).slice(-2);  
		        var day = ("0" + myDate.getDate()).slice(-2);  
	            return year + "-" + month + "-" + day;   
		    };
$.FormatDateTime_YYYYMMDDHM = function (obj) {   
		        var myDate = new Date(obj);   
		        var year = myDate.getFullYear();  
		        var month = ("0" + (myDate.getMonth() + 1)).slice(-2);  
		        var day = ("0" + myDate.getDate()).slice(-2);  
		        var h = ("0" + myDate.getHours()).slice(-2);  
		        var m = ("0" + myDate.getMinutes()).slice(-2);  
	            return year + "-" + month + "-" + day + " " + h + ":" + m;   
		    };
$.FormatDateTime_YYYYMMDDHMS = function (obj) {   
		        var myDate = new Date(obj);   
		        var year = myDate.getFullYear();  
		        var month = ("0" + (myDate.getMonth() + 1)).slice(-2);  
		        var day = ("0" + myDate.getDate()).slice(-2);  
		        var h = ("0" + myDate.getHours()).slice(-2);  
		        var m = ("0" + myDate.getMinutes()).slice(-2);  
		        var s = ("0" + myDate.getSeconds()).slice(-2);   
	            return year + "-" + month + "-" + day + " " + h + ":" + m + ":" + s;   
		    };
$.FormatDateTime_YYYYMMDDHMSSS = function (obj) {   
		        var myDate = new Date(obj);   
		        var year = myDate.getFullYear();  
		        var month = ("0" + (myDate.getMonth() + 1)).slice(-2);  
		        var day = ("0" + myDate.getDate()).slice(-2);  
		        var h = ("0" + myDate.getHours()).slice(-2);  
		        var m = ("0" + myDate.getMinutes()).slice(-2);  
		        var s = ("0" + myDate.getSeconds()).slice(-2);   
		        var mi = ("00" + myDate.getMilliseconds()).slice(-3);  
	            return year + "-" + month + "-" + day + " " + h + ":" + m + ":" + s + "." + mi;   
		    };		   