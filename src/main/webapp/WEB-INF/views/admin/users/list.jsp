<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách Người dùng (User Management)</title>
</head>
<body>

    <!-- Thông báo -->
    <c:if test="">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle me-1"></i> 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2><i class="fas fa-users-cog me-2"></i> Quản lý Người dùng</h2>
        <a href="<c:url value='/admin/users/add' />" class="btn btn-primary">
            <i class="fas fa-user-plus me-1"></i> Thêm mới Người dùng
        </a>
    </div>

    <!-- Thanh tìm kiếm -->
    <div class="card mb-4 shadow-sm">
        <div class="card-body">
            <form action="<c:url value='/admin/users' />" method="GET" class="row g-2 align-items-center">
                <div class="col-md-8 col-sm-12">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                        <input type="text" name="keyword" class="form-control" 
                               placeholder="Tìm kiếm theo username, họ tên, email, số điện thoại..." 
                               value="">
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 d-flex gap-2">
                    <button type="submit" class="btn btn-outline-primary">
                        <i class="fas fa-search me-1"></i> Tìm kiếm
                    </button>
                    <c:if test="">
                        <a href="<c:url value='/admin/users' />" class="btn btn-outline-secondary">
                            <i class="fas fa-times me-1"></i> Xóa lọc
                        </a>
                    </c:if>
                </div>
            </form>
        </div>
    </div>

    <!-- Bảng danh sách -->
    <div class="card shadow-sm">
        <div class="table-responsive">
            <table class="table table-hover table-striped table-bordered align-middle mb-0">
                <thead class="table-dark">
                    <tr>
                        <th style="width: 70px;">ID</th>
                        <th>Username</th>
                        <th>Họ và tên</th>
                        <th>Email</th>
                        <th>Điện thoại</th>
                        <th>Role</th>
                        <th>Trạng thái</th>
                        <th style="width: 170px;" class="text-center">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="">
                            <tr>
                                <td colspan="8" class="text-center text-muted py-4">
                                    <i class="fas fa-info-circle me-1"></i> Không tìm thấy người dùng nào!
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="" var="user">
                                <tr>
                                    <td class="text-center fw-bold"></td>
                                    <td>
                                        <span class="fw-semibold"></span>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="">
                                                <span class="badge bg-danger"><i class="fas fa-shield-alt me-1"></i> ADMIN</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-info text-dark"><i class="fas fa-user me-1"></i> USER</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="">
                                                <span class="badge bg-success"><i class="fas fa-check-circle me-1"></i> Hoạt động</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary"><i class="fas fa-ban me-1"></i> Khóa</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center">
                                        <a href="<c:url value='/admin/users/edit/' />" 
                                           class="btn btn-outline-warning btn-sm me-1" title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i> Sửa
                                        </a>
                                        <a href="<c:url value='/admin/users/delete/' />" 
                                           class="btn btn-outline-danger btn-sm" 
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa user: ?')" 
                                           title="Xóa">
                                            <i class="fas fa-trash"></i> Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
