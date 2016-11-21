/**
 * Created by zzh on 16/3/25.
 */
$.pagination = {
    turnPage: function (pageSize, pageNo) {
        $("#pageNo").val(pageNo);
        $("#pageSize").val(pageSize);
        $("#searchForm").submit();
    },
    appendHidden: function (pageSize, pageNo, formName) {
        var textSize = '<input id = "pageSize" name = "pageSize" type = "hidden" value = "' + pageSize + '" />';
        var textNo = '<input id = "pageNo" name = "pageNo" type = "hidden" value = "' + pageNo + '" />';
        $("#" + formName).append(textSize).append(textNo);
    }
}