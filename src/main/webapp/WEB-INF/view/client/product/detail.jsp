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

                    <title>Product Detail Page</title>
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">
                    /client/
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
                    <div class="container-fluid page-header py-5">
                        <ol class="breadcrumb justify-content-center mb-0">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active text-white">Product Detail</li>
                        </ol>
                    </div>
                    <!-- Single Page Header End -->


                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">
                            <div class="row g-4 mb-5">
                                <div class="col-lg-8 col-xl-9">
                                    <div class="row g-4">
                                        <div class="col-lg-6">
                                            <div class="border rounded">
                                                <a href="#">
                                                    <img src="/images/product/${product.image}"
                                                        class="img-fluid rounded" alt="Image">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <h4 class="fw-bold mb-3">${product.name}</h4>
                                            <p class="mb-3">${product.factory}</p>
                                            <h5 class="fw-bold mb-3">
                                                <fmt:formatNumber value="${product.price}" type="currency" />
                                            </h5>
                                            <!-- <div class="d-flex mb-4">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div> -->
                                            <p class="mb-4">${product.shortDesc}</p>
                                            <p class="mb-4">Target: ${product.target}</p>
                                            <div class="input-group quantity mb-5" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text"
                                                    class="form-control form-control-sm text-center border-0" value="1">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                        <div class="col-lg-12">
                                            <nav>
                                                <div class="nav nav-tabs mb-3">
                                                    <button class="nav-link active border-white border-bottom-0"
                                                        type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                                        data-bs-target="#nav-about" aria-controls="nav-about"
                                                        aria-selected="true">Description</button>
                                                </div>
                                            </nav>
                                            <div class="tab-content mb-5">
                                                <div class="tab-pane active" id="nav-about" role="tabpanel"
                                                    aria-labelledby="nav-about-tab">
                                                    <p>${product.detailDesc}</p>
                                                    <!-- <div class="px-2">
                                                        <div class="row g-4">
                                                            <div class="col-6">
                                                                <div
                                                                    class="row bg-light align-items-center text-center justify-content-center py-2">
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Weight</p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <p class="mb-0">1 kg</p>
                                                                    </div>
                                                                </div>
                                                                <div
                                                                    class="row text-center align-items-center justify-content-center py-2">
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Country of Origin</p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Agro Farm</p>
                                                                    </div>
                                                                </div>
                                                                <div
                                                                    class="row bg-light text-center align-items-center justify-content-center py-2">
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Quality</p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Organic</p>
                                                                    </div>
                                                                </div>
                                                                <div
                                                                    class="row text-center align-items-center justify-content-center py-2">
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Сheck</p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Healthy</p>
                                                                    </div>
                                                                </div>
                                                                <div
                                                                    class="row bg-light text-center align-items-center justify-content-center py-2">
                                                                    <div class="col-6">
                                                                        <p class="mb-0">Min Weight</p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <p class="mb-0">250 Kg</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-xl-3">

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Single Product End -->


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