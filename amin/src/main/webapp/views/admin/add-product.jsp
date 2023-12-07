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
                <form class="form-horizontal" action="<c:url value="/admin-product-create"/>" method="post"
                      enctype="multipart/form-data">
                    <fieldset>
                        <!-- Form Name -->
                        <legend>ADD NEW PRODUCT</legend>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_name">PRODUCT NAME</label>
                            <div class="col-md-4">
                                <input id="product_name"  name="productName" class="form-control input-md" required="" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_type">PRODUCT TYPE</label>
                            <div class="col-md-4">
                                <input id="product_type" name="productStyle" class="form-control input-md" required="" type="text">
                            </div>
                        </div>
                        <!-- Select Basic -->



                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_categories">PRODUCT CATEGORY</label>
                            <div class="col-md-4">
                                <select id="product_categories" name="categoryId"  class="form-control">
                                    <option value = "null">-SELECT-</option>
                                    <c:forEach var= "category" items="${categories}">
                                    <option value = "${category.categoryId}">${category.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_colors">PRODUCT COLOR</label>
                            <div class="col-md-4">
                                <select id="product_colors" name="colorId"  class="form-control">
                                    <option value = "null">-SELECT-</option>
                                    <c:forEach var= "color" items="${colors}">
                                        <option value = "${color.colorId}">${color.colorName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="product_sizes">PRODUCT SIZE</label>
                            <div class="col-md-4">
                                <select id="product_sizes" name="sizeId"  class="form-control">
                                    <option value = "null">-SELECT-</option>
                                    <c:forEach var= "size" items="${sizes}">
                                        <option value = "${size.sizeId}">${size.sizeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="description">PRODUCT DESCRIPTION</label>
                            <div class="col-md-4">
                                <input id="description" name="productDesc" class="form-control input-md" required="" type="text">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="available_quantity">AVAILABLE QUANTITY</label>
                            <div class="col-md-4">
                                <input id="available_quantity" name="productInventory" class="form-control input-md" required="" type="text">
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="price">PRICE</label>
                            <div class="col-md-4">
                                <input id="price" name="productPrice" class="form-control input-md" required="" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4">
                                <!-- File Button -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="image1">PRODUCT IMAGE 1</label>
                                    <div class="col-md-4">
                                        <input id="image1" name="ImageFile1" class="input-file" type="file">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4">
                                <!-- File Button -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="image2">PRODUCT IMAGE 1</label>
                                    <div class="col-md-4">
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