<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Update User - Admin</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarPreview = $("#avatarPreview");
                        const avatarFile = $("#avatarFile");

                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            avatarPreview.attr("src", imgURL);
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">

                <!-- Header -->
                <jsp:include page="../layout/header.jsp" />
                <!-- End of Header -->

                <div id="layoutSidenav">

                    <!-- Sidebar -->
                    <jsp:include page="../layout/sidebar.jsp" />
                    <!-- End of sidebar -->

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Update User</li>
                                </ol>
                                <div class="mt-5 mb-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update a user</h3>
                                            <hr>
                                            <form:form method="post" enctype="multipart/form-data"
                                                action="/admin/user/update" modelAttribute="updateUser">
                                                <div class="mb-3" style="display: none;">
                                                    <label class="form-label">ID</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Email address</label>
                                                    <form:input type="email" class="form-control" path="email"
                                                        disabled="true" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Phone number:</label>
                                                    <form:input type="text" class="form-control" path="phone" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label col-12 col-md-6">Full Name:</label>
                                                    <form:input type="text" class="form-control" path="fullName" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Address:</label>
                                                    <form:input type="text" class="form-control" path="address" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Role:</label>
                                                    <form:select class="form-select" path="role.name"
                                                        aria-label="Default select example">
                                                        <form:option value="ADMIN">ADMIN</form:option>
                                                        <form:option value="USER">USER</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Avatar:</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        name="avatarFile" accept=".png, .jpg, .jpeg" />
                                                </div>
                                                <div class="mb-3">
                                                    <img style="max-height: 250px;" alt="avatar preview"
                                                        id="avatarPreview" src="/images/avatar/${updateUser.avatar}" />
                                                </div>
                                                <button type="submit" class="btn btn-warning">Submit</button>
                                            </form:form>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </main>

                        <!-- Footer -->
                        <jsp:include page="../layout/footer.jsp" />
                        <!-- End of Footer -->

                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>