<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>lottery管理后台 - 权限管理</title>

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
                        <h5>权限管理</h5>
                    </div>
                    <div class="ibox-content">

                       <%-- <h4 class="m-t">高级用法</h4>--%>

                           <div class="ibox-content">
                               <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                   批量添加权限
                               </button>
                               <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
                                   <div class="modal-dialog">
                                       <div class="modal-content animated bounceInRight">
                                           <div class="ibox-title">
                                               <h5>元素</h5>
                                           </div>
                                           <div class="ibox-content">
                                               <form role="form" class="form-horizontal m-t">
                                                   <div class="form-group draggabledraggable">
                                                       <label class="col-sm-3 control-label">角色：</label>
                                                       <div class="col-sm-9">
                                                           <select class="form-control" name="" id="selectRoleId">
                                                               <c:forEach items="${roleLists}" var="roleList">
                                                                   <option value=${roleList.roleId}>${roleList.roleName}</option>
                                                               </c:forEach>
                                                           </select>
                                                       </div>
                                                   </div>
                                                   <div class="form-group draggable">
                                                       <label class="col-sm-3 control-label">权限：</label>
                                                       <div class="col-sm-9">
                                                           <c:forEach items="${pageLists}" var="pageList">
                                                               <label class="checkbox-inline">
                                                                   <input name="pageNamecheck"  type="checkbox" value="${pageList.pageId}" >${pageList.pageName}(${pageList.pagePath})</label>
                                                           </c:forEach>
                                                       </div>
                                                   </div>

                                                   <div class="form-group draggable">
                                                       <div class="col-sm-12 col-sm-offset-3">
                                                           <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                                           <button type="button" class="btn btn-primary" onclick="addBatchRight()">保存</button>
                                                       </div>
                                                   </div>
                                                  <%-- <div class="form-group draggable">
                                                       <div class="modal-footer">
                                                           <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                                           <button type="button" class="btn btn-primary" onclick="addBatchRight()">保存</button>
                                                       </div>
                                                   </div>--%>

                                               </form>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>


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
    <script>
        $(document).ready(function(){
            $.jgrid.defaults.styleUI="Bootstrap";
            $("#table_list_1").jqGrid({
                url:'/rolePagedata.htm',
                datatype:"json",
                height:450,
                autowidth:true,
                shrinkToFit:true,
                rowNum:10,
                rowList:[10,20,30],
                colNames:["序号","角色","页面","状态","创建时间","修改时间"],
                colModel:[
                    {name:"id",index:"id",editable:false,width:60,sorttype:"int",search:true},
                    {name:"roleId",index:"roleId",editable:true,width:90,formatter: "select",edittype:"select",editoptions:{value:getroletypes()}},
                    {name:"pageId",index:"pageId",editable:true,width:90,formatter: "select",edittype:"select",editoptions:{value:getpagetypes()}},
                    {name:"curState",index:"curState",editable:false,width:80,align:"right",formatter:"select",editoptions:{value:"1:启用;2：禁用"}},
                    {name:"createTime",index:"createTime",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false,search:false},
                    {name:"updateTime",index:"updateTime",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false,search:false}],
                pager:"#pager_list_1",
                viewrecords:true,
                caption:"权限列表",
                add:true,
                edit:true,
                addtext:"Add",
                edittext:"Edit",
                editurl: '/rolePageedit.htm',
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
                            id: function () {
                                var sel_id = $('#table_list_1').jqGrid('getGridParam', 'selrow');
                                var value = $('#table_list_1').jqGrid('getCell', sel_id, 'id');
                                return value;
                            }
                        }
                    },

                    {//ADD
                        closeOnEscape: true,//Closes the popup on pressing escape key
                        reloadAfterSubmit: true,
                        drag: true,
                        editData: {
                            id: function () {
                                return 0;
                            }
                        }
                    },
                    {//DELETE
                        closeOnEscape: true,
                        closeAfterDelete: true,
                        reloadAfterSubmit: true,
                        closeOnEscape: true,
                        drag: true,
                        afterSubmit: function (response, postdata) {
                            if (response.responseText == "") {
                                $("#jQGridDemo").trigger("reloadGrid", [{ current: true }]);
                                return [false, response.responseText]
                            }
                            else {
                                $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')
                                return [true, response.responseText]
                            }
                        },
                        delData: {
                            id: function () {
                                var sel_id = $('#table_list_1').jqGrid('getGridParam', 'selrow');
                                var value = $('#table_list_1').jqGrid('getCell', sel_id, 'id');
                                return value;
                            }
                        }

                    },
                    {//SEARCH

                    }
            );


            function getroletypes(){
                var str="";
                $.ajax({
                    type:"post",
                    async:false,
                    url:"roles.htm",
                    success:function(data){
                        if (data != null) {
                            var obj = JSON.parse(data)
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
            function getpagetypes(){
                var str="";
                $.ajax({
                    type:"post",
                    async:false,
                    url:"pages.htm",
                    success:function(data){
                        if (data != null) {
                            var obj = JSON.parse(data)
                            for(var i=0; i<obj.length; i++) {
                                if(i!=obj.length-1){
                                    str+=obj[i].pageId+":"+obj[i].pageName+";";
                                }else{
                                    str+=obj[i].pageId+":"+obj[i].pageName;// 这里是option里面的 value:label
                                }
                            }
                        }
                    }
                });
                return str;
            };

            $(window).bind(
                    "resize",
                    function(){
                        var width=$(".jqGrid_wrapper").width();
                        $("#table_list_1").setGridWidth(width)}
            )
        });
        function addBatchRight(){
            var roleId=$("#selectRoleId option:selected").val();
            var obj=document.getElementsByName('pageNamecheck');
            var s='';
            for(var i=0; i<obj.length; i++){
                if(obj[i].checked) s+=obj[i].value+','; //如果选中，将value添加到变量s中
            }
            $.ajax({
                type: "POST",
               // async:false,
                url: "addbatchright.htm",
                data:{'roleId':roleId,'pages':s},
                success: function (result) {
                    alert(result);
                    document.getElementById("myModal").style.display = 'none';
                     history.go(0)
                },
                error: function(result) {
                    alert(result);
                    history.go(0)
                }
            });
        }

        $("#table_list_1").jqGrid('navGrid','#pager_list_2');

    </script>
    <script type="text/javascript" src="js/stats.js" charset="UTF-8"></script>
</body>
</html>
