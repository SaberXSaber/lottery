<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <%--<div class="ibox-content">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                            添加用户
                        </button>
                        <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content animated bounceInRight">
                                    <div class="form-group">
                                        <div class="col-sm-9">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">用户名：</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="" class="form-control" placeholder="请输入用户名"> <span class="help-block m-b-none"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">登录名：</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="" class="form-control" placeholder="请输入登录名"> <span class="help-block m-b-none"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">密码：</label>
                                            <div class="col-sm-9">
                                                <input type="password" name="" class="form-control" placeholder="请输入密码"> <span class="help-block m-b-none"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">角色：</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="">
                                                    <c:forEach var="list" items="${roleList}">
                                                        <option value="${list.roleId}" selected>${list.roleName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                        <button type="button" class="btn btn-primary">保存</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>--%>
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
                url:'/userdata.htm',
                datatype:"json",
                height:450,
                autowidth:true,
                shrinkToFit:true,
                rowNum:10,
                rowList:[10,20,30],
                colNames:["用户Id","用户名","登录名","用户角色","状态","创建时间"],
                colModel:[
                    {name:"userId",index:"userId",editable:false,width:60,sorttype:"int",search:true},
                    {name:"userName",index:"userName",editable:true,width:100},
                    {name:"loginName",index:"loginName",editable:true,width:80},
//                    {name:"roleName",index:"roleName",editable:true,width:90,edittype:"select",editoptions:{value:gettypes()}},/*dataUrl:"http://localhost:8080/roles.htm"*/
                    {name:"roleId",index:"roleId",editable:true,width:90,formatter: "select",edittype:"select",editoptions:{value:gettypes()}},
                    {name:"curState",index:"curState",editable:false,width:80,formatter: "select",editoptions:{value:"1:启用;2：禁用"}},
                    {name:"createTime",index:"createTime",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false}],
                pager:"#pager_list_1",
                viewrecords:true,
                caption:"用户列表",
                add:true,
                edit:true,
                addtext:"Add",
                edittext:"Edit",
                editurl: '/useredit.htm',
                hidegrid:false});
            $("#table_list_1").setSelection(4,true);
            $("#table_list_1").jqGrid(
                    "navGrid",
                    "#pager_list_1",
                    {edit:true,add:true,del:true,search:true},
                    {//EDIT
//                        height:200,reloadAfterSubmit:true
                        closeOnEscape: true,//Closes the popup on pressing escape key
                        reloadAfterSubmit: true,
                        drag: true,
                       /* afterSubmit: function (response, postdata) {
                            if (response.responseText == "") {
                                $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid');//Reloads the grid after edit
                                return [true, response.responseText]
                            }
                            else {
                                $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid'); //Reloads the grid after edit
                                return [false, response.responseText]//Captures and displays the response text on th Edit window
                            }
                        },*/
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
