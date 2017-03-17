<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>lottery管理后台 - 用户投注管理</title>

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <!-- jqgrid-->
    <link href="css/plugins/jqgrid/ui.jqgridffe4.css?0820" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">


    <style>
        #alertmod_table_list_2 {
            top: 900px !important;
        }
    </style>

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>投注记录</h5>
                    </div>
                    <div class="ibox-content">

                       <%-- <h4 class="m-t">高级用法</h4>--%>

                        <div class="jqGrid_wrapper">
                            <table id="table_list_1"></table>
                            <div id="pager_list_1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/plugins/peity/jquery.peity.min.js"></script>
    <script src="js/plugins/jqgrid/i18n/grid.locale-cnffe4.js?0820"></script>
    <script src="js/plugins/jqgrid/jquery.jqGrid.minffe4.js?0820"></script>
    <script src="js/content.min.js?v=1.0.0"></script>
    <script src="js/plugins/jqgrid/json2.js"></script>
    <script src="js/jDialog/jquery.dialog.js"></script>
    <script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>


    <script>
        $(document).ready(function(){
            datePick = function(elem)
            {
                jQuery(elem).datepicker({ dateFormat: 'yy-mm-dd' });
            }
            $.jgrid.defaults.styleUI="Bootstrap";
            $("#table_list_1").jqGrid({
                url:'/userorderdata.htm',
                datatype:"json",
                height:450,
                autowidth:true,
                shrinkToFit:true,
                rowNum:10,
                rowList:[10,20,30],
                colNames:["订单Id","日期","用户","订单类型","订单金额","开始期号","加倍","追加期数","注数","订单状态","状态","创建时间","修改时间","详情"],
                colModel:[
                    {name:"orderId",index:"userId",editable:false,width:60,sorttype:"int",search:true},
                    {name:"currentdate",index:"currentdate",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false},
                    {name:"loginAccount",index:"loginAccount",editable:true,width:100},
                    {name:"orderType",index:"orderType",editable:false,width:80,formatter: "select",editoptions:{value:"1:普通订单;2：组合彩"}},
                    {name:"orderMoney",index:"orderMoney",editable:true,width:100,formatter:"number",formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:4}},
                    {name:"beginLotteryDateNum",index:"beginLotteryDateNum",editable:true,width:100},
                    {name:"doubleNum",index:"doubleNum",editable:true,width:80},
                    {name:"moreNum",index:"moreNum",editable:true,width:80},
                    {name:"tatalNum",index:"tatalNum",editable:true,width:80},
                    {name:"orderState",index:"orderState",editable:false,width:80,formatter: "select",editoptions:{value:"1:待付款;2：已付款;2：已取消"}},
                    {name:"curState",index:"curState",editable:false,width:80,formatter: "select",editoptions:{value:"1:启用;2：禁用"}},
                    {name:"createTime",index:"createTime",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false,search:true,stype:'text',searchoptions: {dataInit:datePick ,attr:{title:'选择日期'}}},
                    {name:"updateTime",index:"updateTime",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false,search:false},

                   /* {name:'Modify',index:'id', align:'center',sortable:false,width:30}*/

                    {
                        label: '详情', name: '', index: 'operate', width: 50, align: 'center',search:false,
                        /*formatter: function (cellvalue, options, rowObject) {
                            return  "<a  onclick='btn_detail(\""+ rowObject.orderId + "\")'>详细</a>";

                        },*/
                        formatter: function (cellvalue, options, rowObject) {
                            return "<a href=\"#\" style=\"color:#f60\" onclick=\"Modify(" + rowObject.orderId + ")\">详细</a>" }
                    },
                ],
                pager:"#pager_list_1",
                viewrecords:true,
                gridComplete:function(){
                    var ids=$("#table_list_1").jqGrid('getDataIDs');
                    for(var i=0; i<ids.length; i++){
                        var id=ids[i];
                        modify ="<a href='#' class='ui-icon ui-icon-pencil hand setPosition' onclick='editGateway("+ "\"" + id + "\""+")'></a>";
                        $("#table_list_1").jqGrid('setRowData', ids[i], { Modify: modify});
                    }
                },
                caption:"投注记录",
                add:true,
                edit:true,
                addtext:"Add",
                edittext:"Edit",
                editurl: '/userorderedit',
                hidegrid:false});
            $("#table_list_1").setSelection(4,true);
            $("#table_list_1").jqGrid(
                    "navGrid",
                    "#pager_list_1",
                    {edit:false,add:false,del:false,search:true},
                    {//EDIT
//                        height:200,reloadAfterSubmit:true
                        closeOnEscape: true,//Closes the popup on pressing escape key
                        reloadAfterSubmit: true,
                        drag: true,
                        editData: {
                            userId: function () {
                                var sel_id = $('#table_list_1').jqGrid('getGridParam', 'selrow');
                                var value = $('#table_list_1').jqGrid('getCell', sel_id, 'userId');
                                return value;
                            }
                        }
                    },

                    {//ADD

                    },
                    {//DELETE
                        closeOnEscape: true,
                        closeAfterDelete: true,
                        reloadAfterSubmit: true,
                        closeOnEscape: true,
                        drag: true,
                        afterSubmit: function (response, postdata) {
                            if (response.responseText == "") {
                                $("#table_list_1").trigger("reloadGrid", [{ current: true }]);
                                return [false, response.responseText]
                            }
                            else {
                                $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')
                                return [true, response.responseText]
                            }
                        },
                        delData: {
                            userId: function () {
                                var sel_id = $('#table_list_1').jqGrid('getGridParam', 'selrow');
                                var value = $('#table_list_1').jqGrid('getCell', sel_id, 'userId');
                                return value;
                            }
                        }

                    },
                    {//SEARCH

                    }
            );



            $(window).bind(
                    "resize",
                    function(){
                        var width=$(".jqGrid_wrapper").width();
                        $("#table_list_1").setGridWidth(width)}
            )});
        function Modify(id) {
           /* var KeyValue = GetJqGridRowValue("#table_list_1", "orderId");
            if (id!=null) {
                KeyValue=id;
            }
            if (IsChecked(KeyValue)) {*/
                /*var url = "/OrderDetail?orderId=" + id;
                Dialog(url, "Detail", "车辆详情", 750, 300, function (iframe) {
                    top.frames[iframe].AcceptClick();
                });*/
/*
            location.replace("/OrderDetail?orderId=" + id);
*/
            window.open('/userorderdetial?orderId='+id,'详情','height=710,width=940,resizable=no,location=no');
//            }
        }

    </script>
    <script type="text/javascript" src="js/stats.js" charset="UTF-8"></script>
</body>
</html>
