/**
 * Created by xgjt on 16/3/31.
 */

/**
 * 当前时间转为 “yyyy-MM-dd”格式
 * @param now
 * @returns {string}
 */
var formatDate = function(now){
    var   year=now.getFullYear();
    var   month=now.getMonth()+1;
    if(month<10){
        month = "0"+month;
    }
    var   date=now.getDate();
    if(date<10){
        date = "0"+date;
    }
    return   year+"-"+month+"-"+date;
}