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
                <title>User Detail ${id} - Admin</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                                    <li class="breadcrumb-item active">User Detail</li>
                                </ol>
                                <div class="mt-5 mb-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>User Detail with ID: ${id}</h3>
                                            </div>
                                            <hr>
                                            <div class="card" style="width: 60%;">
                                                <div class="card-header">
                                                    User Infomation
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item">ID: ${id}</li>
                                                    <li class="list-group-item">Email: ${user.email}</li>
                                                    <li class="list-group-item">Fullname: ${user.fullName}</li>
                                                    <li class="list-group-item">Address: ${user.address}</li>
                                                </ul>
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