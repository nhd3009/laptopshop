<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Order Detail ${id} - Admin</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
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
                                    <h1 class="mt-4">Manage Order</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Order Detail</li>
                                    </ol>
                                    <div class="mt-5 mb-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Order detail with id = ${id}</h3>
                                                </div>

                                                <hr />

                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">Product</th>
                                                                <th scope="col">Name</th>
                                                                <th scope="col">Price</th>
                                                                <th scope="col">Quantity</th>
                                                                <th scope="col">Total</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:if test="${ empty orderDetails}">
                                                                <tr>
                                                                    <td colspan="6">
                                                                        Nothing in here
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                            <c:forEach var="orderDetail" items="${orderDetails}">

                                                                <tr>
                                                                    <th scope="row">
                                                                        <div class="d-flex align-items-center">
                                                                            <img src="/images/product/${orderDetail.product.image}"
                                                                                class="img-fluid me-5 rounded-circle"
                                                                                style="width: 80px; height: 80px;"
                                                                                alt="">
                                                                        </div>
                                                                    </th>
                                                                    <td>
                                                                        <p class="mb-0 mt-4">
                                                                            <a href="/product/${orderDetail.product.id}"
                                                                                target="_blank">
                                                                                ${orderDetail.product.name}
                                                                            </a>
                                                                        </p>
                                                                    </td>
                                                                    <td>
                                                                        <p class="mb-0 mt-4">
                                                                            <fmt:formatNumber type="currency"
                                                                                value="${orderDetail.price}" />
                                                                        </p>
                                                                    </td>
                                                                    <td>
                                                                        <div class="input-group quantity mt-4"
                                                                            style="width: 100px;">
                                                                            <input type="text"
                                                                                class="form-control form-control-sm text-center border-0"
                                                                                value="${orderDetail.quantity}">
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <p class="mb-0 mt-4"
                                                                            data-cart-detail-id="${orderDetail.id}">
                                                                            <fmt:formatNumber type="currency"
                                                                                value="${orderDetail.price * orderDetail.quantity}" />
                                                                        </p>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>

                                                        </tbody>
                                                    </table>
                                                </div>
                                                <a href="/admin/order" class="btn btn-success mt-3">Back</a>

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