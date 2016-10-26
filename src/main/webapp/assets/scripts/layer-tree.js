var UITree2 = function () {

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
            	onClick: zTreeBeforeClick //设置节点点击前11事件
            }
        };
        var t = $("#onlytree");
        t = $.fn.zTree.init(t, setting, zNodes);
        var zTree = $.fn.zTree.getZTreeObj("onlytree");
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
                "columns": [{
                    "orderable": false
                }, {
                    "orderable": true
                }, {
                    "orderable": false
                }, {
                    "orderable": false
                }, {
                    "orderable": true
                }, {
                    "orderable": false
                }],
                "pageLength": 5,
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


        var tableWrapper = jQuery('#sample_1_wrapper');
        table.find('.group-checkable').change(function () {
            var set = jQuery(this).attr("data-set");
            var checked = jQuery(this).is(":checked");
            jQuery(set).each(function () {
                if (checked) {
                    $(this).attr("checked", true);
                    $(this).parents('tr').addClass("active");
                } else {
                    $(this).attr("checked", false);
                    $(this).parents('tr').removeClass("active");
                }
            });
        });

        table.on('change', 'tbody tr .checkboxes', function () {
            $(this).parents('tr').toggleClass("active");
        });

        tableWrapper.find('.dataTables_length select').addClass("form-control input-xsmall input-inline"); // modify table per page dropdown
    }

    return {
        //main function to initiate the module
        init: function () {
            initTable();
            handleSample1();

        }

    };

}();