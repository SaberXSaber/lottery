<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>lottery管理后台 - 用户金钱明细</title>

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <!-- jqgrid-->
    <link href="css/plugins/jqgrid/ui.jqgridffe4.css?0820" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">

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
                        <h5>账户金钱流水明细</h5>
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

    <script>
        $(document).ready(function(){
            $.jgrid.defaults.styleUI="Bootstrap";
            $("#table_list_1").jqGrid({
                url:'/usermoneydetaildata.htm',
                datatype:"json",
                height:450,
                autowidth:true,
                shrinkToFit:true,
                rowNum:10,
                rowList:[10,20,30],
                colNames:["Id","日期","用户","收支类型","类型详细","收支金额","收支金额","备注信息","创建时间","修改时间"],
                colModel:[
                    {name:"detailId",index:"detailId",editable:false,width:60,sorttype:"int",search:true},
                    {name:"currentdate",index:"currentdate",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false},
                    {name:"loginAccount",index:"loginAccount",editable:true,width:100},
                    {name:"typeId",index:"typeId",editable:false,width:80,formatter: "select",editoptions:{value:"1:收入;2：支出"}},
                    {name:"typeDetailId",index:"typeDetailId",editable:false,width:80,formatter: "select",editoptions:{value:"1:充值;2：提现;3：冻结;4：中奖"}},
                    {name:"money",index:"money",editable:true,width:100,formatter:"number",formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:4}},
                    {name:"remark",index:"remark",editable:true,width:80},
                    {name:"curState",index:"curState",editable:false,width:80,formatter: "select",editoptions:{value:"1:启用;2：禁用"}},
                    {name:"createTime",index:"createTime",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false},
                    {name:"updateTime",index:"updateTime",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false}],
                pager:"#pager_list_1",
                viewrecords:true,
                caption:"账户金钱流水明细",
                add:true,
                edit:true,
                addtext:"Add",
                edittext:"Edit",
                editurl: '/usermoneydetailedit.htm',
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

            /*jQuery("#table_list_1").jqGrid('navButtonAdd','#pager_list_1',{
                caption: "",
                // buttonicon:"ui-icon-print",
                title: "选择要的列",
                onClickButton : function (){
                    jQuery("#table_list_1").jqGrid('columnChooser');
                }

            }).navSeparatorAdd("#pager_list_1",{sepclass : "ui-separator",sepcontent: ''}).navButtonAdd('#pager_list_1',{
                caption:"",
                title:"导出数据",
                buttonicon:"ui-icon-disk",
                onClickButton: function(){
                    jAlert("您没有选择一行，将导出所有数据");
                },
                position:"last"
            });*/

            $(window).bind(
                    "resize",
                    function(){
                        var width=$(".jqGrid_wrapper").width();
                        $("#table_list_1").setGridWidth(width)}
            )});

        $("#table_list_1").jqGrid('navGrid','#pager_list_2');

    </script>
    <script type="text/javascript" src="js/stats.js" charset="UTF-8"></script>
</body>
</html>
