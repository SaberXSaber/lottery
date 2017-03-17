<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>lottery管理后台 - 角色管理</title>

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
                        <h5>角色管理</h5>
                    </div>
                    <div class="ibox-content">

                       <%-- <h4 class="m-t">高级用法</h4>--%>

                           <%--<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
                               <div class="modal-dialog">
                                   <div class="modal-content animated bounceInRight">
                                       <div class="form-group">
                                           <div class="col-sm-9">
                                           </div>
                                       </div>
                                       <div class="col-md-12">
                                           <div class="form-group">
                                               <label class="col-sm-3 control-label" for="-NaN">复选框：</label>
                                               <div class="col-sm-9">

                                                   <c:forEach items="${}" var="">
                                                       <label class="checkbox-inline" for="-NaN">
                                                           <input type="checkbox" value="option1" id="-NaN">选项1</label>
                                                   </c:forEach>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="modal-footer">
                                           <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                           <button type="button" class="btn btn-primary">保存</button>
                                       </div>
                                   </div>
                               </div>
                           </div>--%>

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
                url:'/roledata.htm',
                datatype:"json",
                height:450,
                autowidth:true,
                shrinkToFit:true,
                rowNum:10,
                rowList:[10,20,30],
                colNames:["角色ID","角色名称","状态","创建时间","更新时间"/*,"权限"*/],
                colModel:[
                    {name:"roleId",index:"roleId",editable:false,width:60,sorttype:"int",search:true},
                    {name:"roleName",index:"roleName",editable:true,width:90},
                    {name:"curState",index:"curState",editable:false,width:80,align:"right",formatter:"select",editoptions:{value:"1:启用;2：禁用"}},
                    {name:"createTime",index:"createTime",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false,search:false},
                    {name:"updateTime",index:"updateTime",editable:false,width:100,sorttype:"date",formatter:"date",sortable:false,search:false}/*,
                    {
                        label: '权限', name: '', index: 'operate', width: 50, align: 'center',
                        formatter: function (cellvalue, options, rowObject) {
                            var detail="<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#myModal'>权限 </button>";
                            return detail;
                        },
                    }*/
                ],
                pager:"#pager_list_1",
                viewrecords:true,
                caption:"角色列表",
                add:true,
                edit:true,
                addtext:"Add",
                edittext:"Edit",
                editurl: '/roleedit.htm',
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
                            roleId: function () {
                                var sel_id = $('#table_list_1').jqGrid('getGridParam', 'selrow');
                                var value = $('#table_list_1').jqGrid('getCell', sel_id, 'roleId');
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
                                $("#jQGridDemo").trigger("reloadGrid", [{ current: true }]);
                                return [false, response.responseText]
                            }
                            else {
                                $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')
                                return [true, response.responseText]
                            }
                        },
                        delData: {
                            roleId: function () {
                                var sel_id = $('#table_list_1').jqGrid('getGridParam', 'selrow');
                                var value = $('#table_list_1').jqGrid('getCell', sel_id, 'roleId');
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

        $("#table_list_1").jqGrid('navGrid','#pager_list_2');

    </script>
    <script type="text/javascript" src="js/stats.js" charset="UTF-8"></script>
</body>
</html>
