<%@ include file="/views/admin/includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!--Sidebar-->
    <%@ include file="/views/admin/includes/sidebar.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@ include file="/views/admin/includes/navbar.jsp" %>
            <!-- End of Topbar -->
            <c:if test="${size == 0}">
                <p style="margin-left: 20px;font-size: 25px">No order</p>
            </c:if>
            <!-- Begin Page Content -->
            <c:if test="${not empty success}">
                <div class="text-center alert alert-success">
                    <p>${success}</p>
                </div>
            </c:if>
            <c:if test="${size>0}">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th scope="col">Date</th>
                    <th scope="col">DeliveryDate</th>
                    <th scope="col">Discount</th>
                    <th scope="col">Status</th>
                    <th scope="col">Total Price</th>
                    <th scope="col">Payment Method</th>
                    <th scope="col">Action</th>
                    <th scope="col">Complete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.orderDate}</td>
                    <td>${order.orderDeliveryDate}</td>
                    <td>${order.orderDiscount}</td>
                    <c:choose>
                        <c:when test="${order.orderStatus eq null}"> <td>Not confirmed</td> </c:when>
                        <c:otherwise> <td>${order.orderStatus}</td> </c:otherwise>
                    </c:choose>
                    <td>$+${order.orderTotal}</td>
                    <td>${order.orderPaymentMethod}</td>
                    <td>
<%--                        c:if outside is modified--%>
                            <c:choose>
                                <c:when test="${order.accepted==false and order.orderStatus ne 'Complete' and order.orderStatus ne 'Cancel'}">
                                    <a href="<c:url value='/admin-category-accept'><c:param name='orderId' value='${order.orderId}'/></c:url> " class="btn btn-primary">Accept</a>
                                </c:when>
                                <c:when test="${order.accepted==true and order.orderStatus ne 'Complete' and order.orderStatus ne 'Cancel'}">
<%--                                    <a href="<c:url value='/admin-category-delete'><c:param name='orderId' value='${order.orderId}'/></c:url>" class=" btn btn-danger">Delete</a>--%>
                                    <a href="<c:url value='/admin-category-delete'><c:param name='orderId' value='${order.orderId}'/></c:url>" class=" btn btn-danger">Cancel</a>
                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>
                    </td>

<%--                This column is modified--%>
                    <td>
                        <c:choose>
                            <c:when test="${order.accepted==true and order.orderStatus ne 'Complete' and order.orderStatus ne 'Cancel'}">
                                <a href="<c:url value='/admin-category-complete'><c:param name='orderId' value='${order.orderId}'/></c:url> " class="btn btn-primary">Complete</a>
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            </c:if>
            <!-- End of Main Content -->
            <!-- End of Content Wrapper -->
        </div>
    </div>
</div>
<!-- End of Page Wrapper -->
<!-- Bootstrap core JavaScript-->
<%@ include file="/views/admin/includes/script.jsp" %>
</body>

</html>