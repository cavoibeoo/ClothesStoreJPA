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
            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <form class="form-horizontal" action="<c:url value="/admin-product-update"><c:param name='productId' value='${product.productId}'/></c:url>" method="post"
                      enctype="multipart/form-data">
                    <fieldset>
                        <!-- Form Name -->
                        <legend>UPDATE PRODUCT</legend>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_name">PRODUCT NAME</label>
                            <div class="col-md-4">
                                <input id="product_name"  name="productName" class="form-control input-md" required="" type="text" value="${product.productName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_type">PRODUCT STYLE</label>
                            <div class="col-md-4">
                                <input id="product_type" name="productStyle" class="form-control input-md" required="" type="text" value="${product.productStyle}">
                            </div>
                        </div>
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_categories">PRODUCT CATEGORY</label>
                            <div class="col-md-4">
                                <select id="product_categories" name="categoryId" class="form-control">
                                    <option value = "null">-SELECT-</option>
                                    <c:forEach var= "category" items="${categories}">
                                        <option value = "${category.categoryId}"
                                                <c:if test="${category.categoryId == product.category.categoryId}">selected</c:if>>${category.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_colors">PRODUCT COLOR</label>
                            <div class="col-md-4">
                                <select id="product_colors" name="colorId" class="form-control">
                                    <option value = "null">-SELECT-</option>
                                    <c:forEach var= "color" items="${colors}">
                                        <option value = "${color.colorId}"
                                                <c:if test="${color.colorId == product.color.colorId}">selected</c:if>>${color.colorName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_sizes">PRODUCT SIZE</label>
                            <div class="col-md-4">
                                <select id="product_sizes" name="colorId" class="form-control">
                                    <option value = "null">-SELECT-</option>
                                    <c:forEach var= "size" items="${sizes}">
                                        <option value = "${size.sizeId}"
                                                <c:if test="${size.sizeId == product.size.sizeId}">selected</c:if>>${size.sizeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="description">PRODUCT DESCRIPTION</label>
                            <div class="col-md-4">
                                <input id="description" name="productDesc" class="form-control input-md" required="" type="text" value="${product.productDesc}">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="available_quantity">AVAILABLE QUANTITY</label>
                            <div class="col-md-4">
                                <input id="available_quantity" name="productInventory" class="form-control input-md" required="" type="text" value="${product.productInventory}">
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="price">PRICE</label>
                            <div class="col-md-4">
                                <input id="price" name="productPrice" class="form-control input-md" required="" type="text" value="${product.productPrice}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4">
                                <!-- File Button -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="image1">PRODUCT IMAGE 1</label>
                                    <div class="col-md-4">
                                        <img class = "my-product-image" style="height: 50px; width: 50px;" alt="" src="data:image/jpeg;base64,${product.images[0].productImage}">
                                        <input id="image1" name="ImageFile1" class="input-file" type="file">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4">
                                <!-- File Button -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="image2">PRODUCT IMAGE 2</label>
                                    <div class="col-md-4">
                                        <img class = "my-product-image" style="height: 50px; width: 50px;" alt="" src="data:image/jpeg;base64,${product.images[1].productImage}">
                                        <input id="image2" name="ImageFile2" class="input-file" type="file">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button style="margin-left:0.75rem" type="submit" class="btn btn-primary">Save</button>
                    </fieldset>
                </form>
            </div>
        </div>
        <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->

<!-- Bootstrap core JavaScript-->
<%@ include file="/views/admin/includes/script.jsp" %>

</body>

</html>