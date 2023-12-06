<%@ include file="/views/admin/includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                </div>
                                <c:if test="${not empty error}">
                                <div class="alert alert-danger">${error}</div>
                                </c:if>
                                <form class="user" action="<c:url value="/admin-login"/>" method="post">
                                    <div class="form-group">
                                        <input type="text" name="username" class="form-control form-control-user"
                                               id="username" placeholder="Enter Username...">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" id="password" class="form-control form-control-user"
                                               placeholder="Password">
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-user btn-block">Login
                                    </button>
                                    <hr>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/views/admin/includes/script.jsp" %>
</body>
</html>