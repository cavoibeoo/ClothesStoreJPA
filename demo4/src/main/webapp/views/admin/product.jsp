<%@ include file="/views/admin/includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@ include file="/views/admin/includes/sidebar.jsp" %>
    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@ include file="/views/admin/includes/navbar.jsp" %>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <div class="input-group" style="width: 30%; margin-bottom: 20px;">
                    <form action="<c:url value="/admin-product-search"><c:param name='index' value='0'/></c:url>" method = "get">
                        <input type="text" class="form-control rounded" placeholder="Search" name ="keyword" aria-label="Search"
                               aria-describedby="search-addon" />
                        <button type="submit" class="btn btn-outline-primary">Search</button>
                    </form>
                </div>
                <a href="<c:url value="/admin-product-create"/>" class = "btn btn-primary">Add Product</a>
                <c:if test="${size==0}">
                <p>No Products</p>
                </c:if>
                <c:if test="${not empty success}">
                    <div class="text-center alert alert-success">
                        <p>${success}</p>
                    </div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="text-center alert alert-danger">
                        <p>${error}</p>
                    </div>
                </c:if>
                <c:if test="${size>0}">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Type</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Color</th>
                        <th scope="col">Size</th>
                        <th scope="col">Image</th>
                        <th scope="col">Update</th>
                        <th scope="col">Delete</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${products}">
                    <tr>
                        <th scope="row">${product.productName}</th>
                        <td>${product.productStyle}</td>
                        <td>${product.category.categoryName}</td>
                        <td>${product.productPrice}</td>
                        <td>${product.productInventory}</td>
                        <td>${product.color.colorName}</td>
                        <td>${product.size.sizeName}</td>
                        <td>
                            <img class = "my-product-image" style="height: 80px; width: 80px;" alt=""
                                 src="data:image/jpeg;base64,${product.images[0].productImage}">
                        </td>
                        <td><a href="<c:url value="/admin-product-edit"><c:param name='productId' value='${product.productId}'/></c:url>" class="btn btn-primary">Edit</a></td>
                        <td><a href="<c:url value="/admin-product-delete"><c:param name='productId' value='${product.productId}'/></c:url>" class="btn btn-primary">Delete</a></td>
                        <td>
                            <c:choose>
                                <c:when test="${product.activated==false}">
                                    <a href="<c:url value='/admin-product-enable'><c:param name='productId' value='${product.productId}'/></c:url> " class="btn btn-primary">Enable</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/admin-product-disable'><c:param name='productId' value='${product.productId}'/></c:url>" class=" btn btn-danger">Disable</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                </c:if>
                <!--Pagination  -->
                <nav aria-label="...">
                    <ul class="pagination" >
                        <c:if test="${index>1}">
                        <li class="page-item ">
                            <a href = "<c:url value="/admin-product"><c:param name='index' value='${index-1}'/></c:url>" class="page-link">Previous</a>
                        </li >
                        </c:if>
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <c:set var="isActive" value="${index == i - 1 ? 'active' : ''}" />
                                <li class="page-item ${isActive}">
                            <a href="<c:url value="/admin-product"><c:param name='index' value='${i-1}'/></c:url>" class="page-link">
				     <span>${i}</span></a>
                            </c:forEach></li>
                        <c:if test="${index+1==endPage}">
                        <li class="page-item">
                            <a href= "<c:url value="/admin-product"><c:param name='index' value='${index+1}'/></c:url>" class="page-link">Next</a>
                        </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <!-- /.container-fluid -->
        </div>
    </div>
    <!-- End of Content Wrapper -->
</div>

<!-- Bootstrap core JavaScript-->
<%@ include file="/views/admin/includes/script.jsp" %>
</body>

</html>