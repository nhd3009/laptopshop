<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <c:set var="scheme" value="${pageContext.request.scheme}" />
                <c:set var="serverName" value="${pageContext.request.serverName}" />
                <c:set var="serverPort" value="${pageContext.request.serverPort}" />
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

                    <title>Order History</title>
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">
                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->


                    <!-- Navbar start -->
                    <jsp:include page="../layout/header.jsp" />
                    <!-- Navbar End -->

                    <!-- Single Page Header start -->
                    <div class="container-fluid pt-5">
                        <div class="container pt-5">
                            <div class="mb-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                                        <li class="breadcrumb-item active">Order History</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                    </div>
                    <!-- Single Page Header End -->

                    <!-- Checkout Page Start-->
                    <div class="container-fluid py-5">
                        <div class="container py-5">

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Product</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${ empty orders}">
                                            <tr>
                                                <td colspan="6">
                                                    There is nothing here
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td colspan="5">
                                                    <strong>Order: ${order.id}</strong>
                                                </td>
                                                <td colspan="1">
                                                    ${order.status}
                                                </td>
                                            </tr>
                                            <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="d-flex align-items-center">
                                                            <img src="/images/product/${orderDetail.product.image}"
                                                                class="img-fluid me-5 rounded-circle"
                                                                style="width: 80px; height: 80px;" alt="">
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
                                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                                            <input type="text"
                                                                class="form-control form-control-sm text-center border-0"
                                                                value="${orderDetail.quantity}">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                            <fmt:formatNumber type="currency"
                                                                value="${orderDetail.price * orderDetail.quantity}" />
                                                        </p>
                                                    </td>
                                                    <td></td>

                                                </tr>
                                            </c:forEach>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!-- Checkout Page End-->

                    <!-- Footer Start -->
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- Footer End -->

                    <!-- Copyright Start -->
                    <div class="container-fluid copyright bg-dark py-4">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                                    <span class="text-light"><a href="#"><i
                                                class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All
                                        right
                                        reserved.</span>
                                </div>
                                <div class="col-md-6 my-auto text-center text-md-end text-white">
                                    <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                                    <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                                    <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                                    Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                                    Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Copyright End -->



                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>


                    <div id="lightboxOverlay" tabindex="-1" class="lightboxOverlay" style="display: none;"></div>
                    <div id="lightbox" tabindex="-1" class="lightbox" style="display: none;">
                        <div class="lb-outerContainer">
                            <div class="lb-container"><img class="lb-image"
                                    src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                    alt="">
                                <div class="lb-nav"><a class="lb-prev" role="button" tabindex="0"
                                        aria-label="Previous image" href=""></a><a class="lb-next" role="button"
                                        tabindex="0" aria-label="Next image" href=""></a></div>
                                <div class="lb-loader"><a class="lb-cancel" role="button" tabindex="0"></a></div>
                            </div>
                        </div>
                        <div class="lb-dataContainer">
                            <div class="lb-data">
                                <div class="lb-details"><span class="lb-caption"></span><span class="lb-number"></span>
                                </div>
                                <div class="lb-closeContainer"><a class="lb-close" role="button" tabindex="0"></a></div>
                            </div>
                        </div>
                    </div>
                </body>

                </html>