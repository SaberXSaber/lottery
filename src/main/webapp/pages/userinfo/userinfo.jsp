<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>lottery管理后台 - 用户管理</title>

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
                        <h5>用户管理</h5>
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
    <script src="js/ajaxfileupload.js"></script>
    <script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>


    <script>

        //生成控件，用个hidden来隐藏得到的上传地址，也可以直接获取Img的Src
        function myelem(value, editOptions) {
            var span = $("<span>");
            var hiddenValue = $("<input>", { type: "hidden", val: value, name: "fileName", id: "fileName" });
            var image = $("<img>", { name: "uploadimage", id: "uploadimage",style:"display:none; width:150px; height:80px" });
            var el = document.createElement("input");
            el.type = "file"
            el.id = "imgFile";
            el.name = "imgFile";
            el.onchange = UploadFile;
            span.append(el).append(hiddenValue ).append(image);
            return span;
        }

        function UploadFile(){
            $.ajaxFileUpload
            ({
                url: '/fileUpload',
                secureuri: false,
                fileElementId: 'imgFile',
                dataType: 'json',
                success: function(data, status) {
                    var obj=   JSON.parse(data)
                    console.info(obj);
                    if (obj.code == 200) {
                        $("#fileName").val(obj.imgFile);
                        $("#uploadimage").attr("src", + obj.imgFile);
                        $("#uploadimage").show();
                        $("#imgFile").hide();
                    }else{
                        alert(obj.msg);
                    }
                    /*alert(obj.imgFile);
                    if (typeof (data.error) != 'undefined') {
                        if (data.error != '') {
                            alert(data.error);
                        } else {
                            $("#fileName").val(data.msg);
                            $("#uploadimage").attr("src", + data.msg);
                            $("#uploadimage").show();
                            $("#imgFile").hide();
                        }
                    }*/
                },
                error: function(data, status, e) {
                    alert(e);
                }
            })

            return false;
        }
        function myvalue(elem, sg, value) {
            return $(elem).find("#fileName").val();
        }

        function alarmFormatter(cellvalue, options, rowdata)
        {
                return '<img class="alarmimg" src='+rowdata.logoUrl+' alt="' + cellvalue + '" />';
        }

        $(document).ready(function(){
            datePick = function(elem)
            {
                jQuery(elem).datepicker({ dateFormat: 'yy-mm-dd' });
            }
            $.jgrid.defaults.styleUI="Bootstrap";
            $("#table_list_1").jqGrid({
                url:'/userinfodata.htm',
                datatype:"json",
                height:450,
                autowidth:true,
                shrinkToFit:true,
                rowNum:10,
                rowList:[10,20,30],
                colNames:["用户Id","用户昵称","登录名","电话","头像","状态","创建时间","修改时间"],
                colModel:[
                    {name:"userId",index:"userId",editable:false,width:60,sorttype:"int",search:true},
                    {name:"nickName",index:"nickName",editable:true,width:100},
                    {name:"loginAccount",index:"loginAccount",editable:true,width:80},
                    {name:"mobilePhone",index:"mobilePhone",editable:true,width:80},
                    {name:"logoUrl",index:"logoUrl",editable:true,width:80,formatter: alarmFormatter/*,edittype: 'custom',editoptions: {custom_element: myelem, custom_value:myvalue}*/},
                    {name:"curState",index:"curState",editable:false,width:80,formatter: "select",editoptions:{value:"1:启用;2：禁用"}},
                    {name:"createTime",index:"createTime",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false,search:true,stype:'text',searchoptions: {dataInit:datePick ,attr:{title:'选择日期'}}},
                    {name:"updateTime",index:"updateTime",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false,search:false}],
                pager:"#pager_list_1",
                viewrecords:true,
                caption:"用户列表",
                add:true,
                edit:true,
                addtext:"Add",
                edittext:"Edit",
                editurl: '/userinfoedit.htm',
                hidegrid:false});
            $("#table_list_1").setSelection(4,true);
            $("#table_list_1").jqGrid(
                    "navGrid",
                    "#pager_list_1",
                    {edit:true,add:false,del:false,search:true},
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

    </script>
    <script type="text/javascript" src="js/stats.js" charset="UTF-8"></script>
</body>
</html>
