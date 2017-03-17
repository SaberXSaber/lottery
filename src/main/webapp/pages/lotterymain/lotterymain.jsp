<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>Lottery Admin</title>
    <meta name="keywords" content="彩票管理">
    <meta name="description" content="彩票管理">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
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
                    <h5>彩票管理</h5>
                </div>
                <div class="ibox-content">
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
    $(document).ready(function () {
        $.jgrid.defaults.styleUI = "Bootstrap";

        function myelem (value, options) {
            var el = document.createElement("input");
            el.type="text";
            if(value.indexOf("img")>=0){
                value = value.replace("<img src=\"","").replace("width=","").replace("height=","").replace("50","").replace("50","").replace(">","").replace("\"\"","").replace("\"\"","").replace("\"","").replace(" ","");
            }
            el.value = value;
            el.class = "FormElement form-control";
            //<input type="text" id="parentName" name="parentName" rowid="1" role="textbox" class="FormElement form-control">
            return el;
        }

        //获取值
        function myvalue(elem) {
            return $(elem).val();
        }
         $("#table_list_1").jqGrid({
         url:'/lytdata.htm',
         datatype:"json",
         height:450,
         autowidth:true,
         shrinkToFit:true,
         rowNum:10,
         rowList:[10,20,30],
         colNames:["彩票ID","排序","彩票名称","宣传语","所属彩种","Logo","单价","当前状态"],
         colModel:[
             {name:"typeId",index:"typeId",editable:false,width:60,sorttype:"int",search:true}
             ,{name:"seqNum",index:"seqNum",editable:true,hidedlg:true}
             ,{name:"typeName",index:"typeName",editable:true}
             ,{name:"tips",index:"tips",editable:true}
             ,{name:"parentName",index:"parentName",editable:true, edittype : "select",   editoptions:{value:"高频彩种:高频彩种;体育彩票:体育彩票;福利彩票:福利彩票"}}
             ,{name:"logoUrl",index:"logoUrl",editable:true,edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue},formatter:function(cellvalue, options, row){
                     return "<img src=\""+cellvalue+"\" width='50' height='50'/>";}}
             ,{name:"price",index:"price",editable:true}
             ,{name:"curState",index:"curState",editable:true, edittype : "select",   editoptions:{value:"1:待销售;0:未发布;2:销售中"}
                 ,formatter:function(cellvalue, options, row){
                 if(cellvalue==1){
                 return "待销售";
                 }else if(cellvalue==2){
                     return "销售中";
                 }
                 else{
                  return "未发布";
                 }}}
         ],
         pager:"#pager_list_1",
         viewrecords:true,
         caption:"彩票列表",
         add:true,
         edit:true,
         addtext:"Add",
         edittext:"Edit",
         editurl: '/lyedit.htm',
         hidegrid:false});
         $("#table_list_1").setSelection(4,true);
         $("#table_list_1").jqGrid(
         "navGrid",
         "#pager_list_1",
         {edit:true,add:true,search:true},
         {
         closeOnEscape: true,
         reloadAfterSubmit: true,
         drag: true,
         editData: {
             typeId: function () {
         var sel_id = $('#table_list_1').jqGrid('getGridParam', 'selrow');
         var value = $('#table_list_1').jqGrid('getCell', sel_id, 'typeId');
         return value;
         }
         }
         },
         {

         },
         {
         //DELETE
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
         var value = $('#table_list_1').jqGrid('getCell', sel_id, 'seqNum');
         return value;
         }
         }

         },
         {//SEARCH

         }
         );
         function gettypes(){
         var str="";
         $.ajax({
         type:"post",
         async:false,
         url:"roles.htm",
         success:function(data){
         if (data != null) {
         console.info(data);
         var obj=   JSON.parse(data)
         for(var i=0; i<obj.length; i++) {
         if(i!=obj.length-1){
         str+=obj[i].roleId+":"+obj[i].roleName+";";
         }else{
         str+=obj[i].roleId+":"+obj[i].roleName;// 这里是option里面的 value:label
         }
         }
         }
         }
         });
         return str;
         }
         $(window).bind(
         "resize",
         function(){
         var width=$(".jqGrid_wrapper").width();
         $("#table_list_1").setGridWidth(width)}
         )
    });
    /*
     $("#table_list_1").jqGrid('navGrid','#pager_list_2');
     */
</script>
<script type="text/javascript" src="js/stats.js" charset="UTF-8"></script>
</body>
</html>
