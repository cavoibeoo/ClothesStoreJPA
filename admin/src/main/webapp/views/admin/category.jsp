<%@ page import="model.CategoryEntity" %>
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

      <!-- Begin Page Content -->
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleAddCategoryModal"
              data-whatever="@mdo">Add new category
      </button>
      <c:if test="${size == 0}">
      <p >No category</p>
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
      <c:if test="${size >0}">
      <table class="table table-striped">
        <thead>
        <tr>
          <th scope="col">Category Index</th>
          <th scope="col">Category Name</th>
          <th scope="col">Update Name</th>
          <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="category" items="${categories}">
        <tr>
          <th scope="row" >${category.categoryId}</th>
          <td>${category.categoryName}</td>
          <td>
            <a id="editButton"
               href="<c:url value='/admin-category-edit'><c:param name='categoryId' value='${category.categoryId}'/></c:url>"
               class="btn btn-primary">Update
            </a>
          </td>
          <td>
            <c:choose>
            <c:when test="${category.activated==false}">
            <a href="<c:url value='/admin-category-enable'><c:param name='categoryId' value='${category.categoryId}'/></c:url> " class="btn btn-primary">Enable</a>
            </c:when>
            <c:otherwise>
            <a href="<c:url value='/admin-category-disable'><c:param name='categoryId' value='${category.categoryId}'/></c:url>" class=" btn btn-danger">Disable</a>
            </c:otherwise>
            </c:choose>
          </td>
        </tr>
        </c:forEach>
        </tbody>
      </table>
      </c:if>
      <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->
  </div>
</div>
<!-- End of Page Wrapper -->

<!--Add Categories Modal-->
<div class="modal fade" id="exampleAddCategoryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <form action="<c:url value="/admin-category-create"/>" method="post">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">New Category</h5>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Name:</label>
            <input type="text" class="form-control" placeholder="Enter name" name="categoryName" id="recipient-name">
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Save</button>
        </div>
      </div>
    </div>
  </form>
</div>

<!--End-->

<!-- Edit Category Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalExample" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit category</h5>
      </div>
      <div class="modal-body">
        <form action="<c:url value="/admin-category-update"/>" method="post">
          <input type="hidden" name="_form" value="put">
          <div class="form-group">
            <label for="idEdit" class="col-form-label">ID</label>
            <input type="text" class="form-control" id="idEdit" name="categoryId" readonly>
          </div>
          <div class="form-group">
            <label for="nameEdit" class="col-form-label">Category Name</label>
            <input type="text" class="form-control" id="nameEdit" name="categoryName">
          </div>
          <button type="submit" class="btn btn-primary">Save</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- End -->
<!-- Bootstrap core JavaScript-->
<%@ include file="/views/admin/includes/script.jsp" %>
<% int Id = (int) request.getAttribute("categoryId");%>
<% String Name = (String)request.getAttribute("categoryName");%>
<script>
  // Embed the data directly into the JSP as a script
  var categoryId = <%=Id%>;
  var categoryName = '<%=Name%>';
  $(document).ready(function () {
    $('#editButton').on('click', function (event) {
      event.preventDefault();
          // Parse JSON if categoryEdit is a string
          $('#idEdit').val(categoryId)
          $('#nameEdit').val(categoryName);
          $('#editModal').modal();

    });
  });

</script>

</body>
</html>