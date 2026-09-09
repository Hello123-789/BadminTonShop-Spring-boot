<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
    <div class="p-5 mb-4 bg-light rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">Cửa hàng cầu lông chính hãng</h1>
            <p class="col-md-8 fs-4">Chào mừng đến với BadMinTonShop.</p>
            <div class="d-flex gap-3 mt-4">
                <a href="<c:url value='/admin/categories' />" class="btn btn-primary btn-lg">
                    <i class="fas fa-layer-group me-2"></i> Quản lý Category
                </a>
                <a href="<c:url value='/admin/users' />" class="btn btn-success btn-lg">
                    <i class="fas fa-users me-2"></i> Quản lý User
                </a>
            </div>
        </div>
    </div>
</body>
</html>
