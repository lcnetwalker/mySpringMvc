var UITreeRadio= function () {
    var handleSample1 = function () {
        var zTree;
        var demoIframe;
        var setting = {
            view: {
                dblClickExpand: false, //双击是否展开节点
                showLine: true,      // 是否显示线
                selectedMulti: false //是否可以多选
            },
            data: {
            	key:{name:"colname"},
                simpleData: {
                    enable:true, //是否强制转化为数组
                    idKey: "colnum",
                    pIdKey: "pcolnum",
                    rootPId: ""
                }
            },
            callback: {
            	onClick: zTreeBeforeClick //设置节点点击前事件
            }
        };
        var t = $("#Qtree");
        t = $.fn.zTree.init(t, setting, zNodes);
        var zTree = $.fn.zTree.getZTreeObj("Qtree");
        zTree.expandAll(true);
       //var node =  zTree.getNodeByParam("colnum", "root");
       //zTree.selectNode(node);
       // zTree.expandNode(node);
    };
    var initTable = function () {
        var table = $('#sample_1');  
        // 控制是否排序
        table.dataTable(
                {
                    "pageLength": 10,
                    "searching": false,//搜索
                    "dom": '<"toolbar">frtip', //控制左上角是否显示几行
                    //"pagingType": "bootstrap_full_number",
                    "language": {
                        "lengthMenu": "  _MENU_  页",
                        "zeroRecords": "请选择小类别",
                        "infoEmpty": "无记录",
                        "paginate": {
                            "previous": " 上一页",
                            "next": "下一页"
                        }
                    },
                    "bInfo": false,//页脚信息
                    "columnDefs": [{  // set default column settings
                        'orderable': false,
                        'targets': [0]
                    }, {
                        "searchable": false,
                        "targets": [0]
                    }],
                    "order": [
                        [1, "asc"]
                    ] // set first column as a default sort by asc

                }
            );
        $('#sample_1 tbody').on( 'click', 'tr', function () {
        	   $('#kkk tr').removeClass('selected');
        	   $('#kkk tr td').removeClass('backrsdio');
                $(this).addClass('selected ');
                $(this).children('td').addClass("backrsdio");
                var   n =  $(this).attr("data_a");
                var   m =  $(this).attr("data_b");
               $("#num",parent.document).val(n);
               $("#mame",parent.document).val(m);
        } );
     
        $('#button').click( function () {
            table.row('.selected').remove().draw( false );
        } );
   }

    return {
        //main function to initiate the module
        init: function () {
            handleSample1();
        },
        inittable:function(){
    	  initTable();
       }
   

    };

}();