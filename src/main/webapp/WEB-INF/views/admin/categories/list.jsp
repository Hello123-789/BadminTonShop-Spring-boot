<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách Category</title>
</head>
<body>

    <!-- Hiện thông báo -->
    <c:if test="${message != null}">
        <div class="alert alert-primary" role="alert">
            <i>${message}</i>
        </div>
    </c:if>
    <!-- Hết thông báo -->

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Quản lý Category</h2>
        <a href="<c:url value='/admin/categories/add' />" class="btn btn-primary"><i class="fas fa-plus"></i> Thêm mới</a>
    </div>

    <!-- Thanh tìm kiếm -->
    <div class="card mb-4 shadow-sm">
        <div class="card-body">
            <form action="<c:url value='/admin/categories' />" method="GET" class="row g-2 align-items-center">
                <div class="col-md-8 col-sm-12">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                        <input type="text" name="keyword" class="form-control" placeholder="Tìm kiếm theo tên Category..." value="${keyword}">
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 d-flex gap-2">
                    <button type="submit" class="btn btn-outline-primary"><i class="fas fa-search"></i> Tìm kiếm</button>
                    <c:if test="${not empty keyword}">
                        <a href="<c:url value='/admin/categories' />" class="btn btn-outline-secondary"><i class="fas fa-times"></i> Xóa lọc</a>
                    </c:if>
                </div>
            </form>
        </div>
    </div>

    <table class="table table-striped table-responsive table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Category ID</th>
                <th>Category Name</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${categories}" var="category">
                <tr>
                    <td scope="row">${category.categoryId}</td>
                    <td>${category.categoryname}</td>
                    <td>
                        <c:choose>
                            <c:when test="${category.status == 1}"><span class="badge bg-success">Hoạt động</span></c:when>
                            <c:otherwise><span class="badge bg-secondary">Khóa</span></c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="<c:url value='/admin/categories/edit/${category.categoryId}' />" class="btn btn-outline-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                        <a href="<c:url value='/admin/categories/delete/${category.categoryId}' />" class="btn btn-outline-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"><i class="fas fa-trash"></i> Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
