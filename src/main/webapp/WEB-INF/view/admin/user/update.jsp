<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update User ${updateUser.id}</title>

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                    crossorigin="anonymous"></script>

                <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
            </head>

            <body>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h1>Update a user</h1>
                            <hr>
                            <form:form method="post" action="/admin/user/update" modelAttribute="updateUser">
                                <div class="mb-3" style="display: none;">
                                    <label class="form-label">ID</label>
                                    <form:input type="text" class="form-control" path="id" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Email address</label>
                                    <form:input type="email" class="form-control" path="email" disabled="true" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Phone number:</label>
                                    <form:input type="text" class="form-control" path="phone" />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Full Name:</label>
                                    <form:input type="text" class="form-control" path="fullName" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Address:</label>
                                    <form:input type="text" class="form-control" path="address" />
                                </div>
                                <button type="submit" class="btn btn-warning">Submit</button>
                            </form:form>
                        </div>
                    </div>

                </div>

            </body>

            </html>