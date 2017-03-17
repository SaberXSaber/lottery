<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>lottery管理后台 - 用户投注详情</title>

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <%--<div class="ibox-title">
                       &lt;%&ndash; <h5>基本 <small>分类，查找</small></h5>&ndash;%&gt;
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>--%>

                    <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>彩票类型</th>
                            <th>选择类型</th>
                            <th>彩票期号</th>
                            <th>投注号码</th>
                            <th>花费</th>
                            <th>彩票状态</th>
                            <th>状态</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${listUserOrderDetail}" var="userOrderDetail" >
                            <tr class="gradeX">
                                <td>${userOrderDetail.orderDetailId}</td>
                                <td>
                                        ${userOrderDetail.lotteryTypeName}
                                </td>
                                <c:choose>
                                    <c:when test="${userOrderDetail.detailType== '1'}">
                                        <td>人工</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>机选</td>
                                    </c:otherwise>
                                </c:choose>
                               <%-- <td>${userOrderDetail.detailType}</td>--%>
                                <td>${userOrderDetail.lotteryDateNum}</td>
                                <td>${userOrderDetail.lotteryString}</td>
                                <td>${userOrderDetail.costMoney}</td>

                                <c:choose>
                                    <c:when test="${userOrderDetail.orderDetailState== '0'}">
                                        <td>未付款</td>
                                    </c:when>
                                    <c:when test="${userOrderDetail.orderDetailState== '1'}">
                                        <td>待开奖</td>
                                    </c:when>
                                    <c:when test="${userOrderDetail.orderDetailState== '2'}">
                                        <td>已中奖</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>未中奖</td>
                                    </c:otherwise>
                                </c:choose>
                                <%--<td class="center">${userOrderDetail.orderDetailState}</td>--%>
                                <c:choose>
                                    <c:when test="${userOrderDetail.curState== '1'}">
                                        <td>有效</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>无效</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${userOrderDetail.createTime}</td>
                                <td>${userOrderDetail.updateTime}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="js/content.min.js?v=1.0.0"></script>

    <script>
        $(document).ready(function(){
            $(".dataTables-example").dataTable();
        });

    </script>
    <script type="text/javascript" src="js/stats.js" charset="UTF-8"></script>
</body>
</html>
