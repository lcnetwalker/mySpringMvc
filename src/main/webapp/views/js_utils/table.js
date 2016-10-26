/**
 * Created by xgjt on 16/3/31.
 */

/**
 * remove表中某字段为空的行
 * @param items  元素数组  如$("#cpx_table").find("input[name='cpx_money'][kstar='"+kstar+"']");获取
 */
function table_clearZeroLine(items){
    $.each(items,function(i,v){
        var n_v = parseFloat($(v).val());
        if($(v).val()=="" || n_v==0){
            $(v).parents("tr").remove();//清除
        }

    });
}