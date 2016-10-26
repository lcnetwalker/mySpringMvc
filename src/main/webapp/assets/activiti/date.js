Date.prototype.pattern=function(fmt) {           
    var o = {           
    "M+" : this.getMonth()+1, //月份           
    "d+" : this.getDate(), //日           
    "h+" : this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, //12小时制           
    "H+" : this.getHours(), //小时           
    "m+" : this.getMinutes(), //分           
    "s+" : this.getSeconds(), //秒           
    "q+" : Math.floor((this.getMonth()+3)/3), //季度           
    "S" : this.getMilliseconds() //毫秒           
    };           
    var week = {           
    "0" : "/u65e5",           
    "1" : "/u4e00",           
    "2" : "/u4e8c",           
    "3" : "/u4e09",           
    "4" : "/u56db",           
    "5" : "/u4e94",           
    "6" : "/u516d"          
    };           
    if(/(y+)/.test(fmt)){           
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));           
    }           
    if(/(E+)/.test(fmt)){           
        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);           
    }           
    for(var k in o){           
        if(new RegExp("("+ k +")").test(fmt)){           
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));           
        }           
    }           
    return fmt;           
} ;

function dateDiff(d1,d2){
	var separator = "-"; //日期分隔符
	var oDate1;
	var oDate2;
	var iDays;
	oDate1= d1.split(separator);
	oDate2= d2.split(separator);
	var strDateS = new Date(oDate1[0], oDate1[1]-1, oDate1[2]);
	var strDateE = new Date(oDate2[0], oDate2[1]-1, oDate2[2]);
	iDays = parseInt(Math.abs(strDateS - strDateE ) / 1000 / 60 / 60 /24); //把相差的毫秒数转换为天数 
	return iDays ;
};