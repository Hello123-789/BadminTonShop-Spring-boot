<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property="title">Admin Portal</sitemesh:write></title>
<!-- Bootstrap CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<sitemesh:write property="head"/>
</head>
<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div class="bg-dark text-white p-3" style="min-width: 250px; min-height: 100vh;">
            <h4>Admin Panel</h4>
            <hr class="text-white">
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item mb-1">
                    <a href="<c:url value='/' />" class="nav-link text-white"><i class="fas fa-home me-2"></i> Trang chủ</a>
                </li>
                <li class="nav-header text-uppercase text-secondary small fw-bold mt-3 mb-1">Quản lý Danh mục</li>
                <li class="nav-item mb-1">
                    <a href="<c:url value='/admin/categories' />" class="nav-link text-white"><i class="fas fa-layer-group me-2"></i> Danh sách Category</a>
                </li>
                <li class="nav-item mb-1">
                    <a href="<c:url value='/admin/categories/add' />" class="nav-link text-white"><i class="fas fa-plus-circle me-2"></i> Thêm mới Category</a>
                </li>
                <li class="nav-header text-uppercase text-secondary small fw-bold mt-3 mb-1">Quản lý Người dùng</li>
                <li class="nav-item mb-1">
                    <a href="<c:url value='/admin/users' />" class="nav-link text-white"><i class="fas fa-users-cog me-2"></i> Danh sách User</a>
                </li>
                <li class="nav-item mb-1">
                    <a href="<c:url value='/admin/users/add' />" class="nav-link text-white"><i class="fas fa-user-plus me-2"></i> Thêm mới User</a>
                </li>
            </ul>
        </div>

        <!-- Page Content -->
        <div class="container-fluid p-4">
            <sitemesh:write property="body"/>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
