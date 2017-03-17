<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - jqGird</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

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
                        <h5>页面管理</h5>
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
    <script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>

    <script>
        $(document).ready(function(){
            datePick = function(elem)
            {
                jQuery(elem).datepicker({ dateFormat: 'yy-mm-dd' });
            }
            $.jgrid.defaults.styleUI="Bootstrap";
            $("#table_list_1").jqGrid({
                url:'/datereportdata.htm',
                datatype:"json",
                height:450,
                autowidth:true,
                shrinkToFit:true,
                rowNum:10,
                rowList:[10,20,30],
                colNames:["日期","新注册用户","投注成功用户","投注成功订单","投注未付款用户","投注未付款订单"],
                colModel:[
                    {name:"createTime",index:"createTime",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false,search:true,stype:'text',searchoptions: {dataInit:datePick ,attr:{title:'选择日期'}}},
                    {name:"regUserCount",index:"regUserCount",editable:true,width:90},
                    {name:"betUserCount",index:"betUserCount",editable:true,width:90},
                    {name:"betOrderCount",index:"betOrderCount",editable:true,width:90},
                    {name:"unbetUserCount",index:"unbetUserCount",editable:true,width:90},
                    {name:"unbetOrderCount",index:"unbetOrderCount",editable:true,width:90},
                ],
                pager:"#pager_list_1",
                viewrecords:true,
                caption:"日期报表",
                add:true,
                edit:true,
                addtext:"Add",
                edittext:"Edit",
                editurl: '',
                hidegrid:false});
            $("#table_list_1").setSelection(4,true);
            $("#table_list_1").jqGrid(
                    "navGrid",
                    "#pager_list_1",
                    {edit:false,add:false,del:false,search:true},
                    {
                    },
                    {//ADD
                    },
                    {
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

    </script>
    <script type="text/javascript" src="js/stats.js" charset="UTF-8"></script>
</body>
</html>
