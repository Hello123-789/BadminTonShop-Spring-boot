<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">
            <form:form action="/admin/users/saveOrUpdate" method="POST" modelAttribute="user" class="card shadow-sm">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                    <h4 class="mb-0">
                        <i class="fas  me-2"></i>
                        
                    </h4>
                </div>

                <div class="card-body p-4">
                    <form:hidden path="isEdit" />

                    <c:if test="">
                        <div class="mb-3">
                            <label for="userId" class="form-label fw-semibold">User ID:</label>
                            <form:input path="userId" readonly="true" class="form-control bg-light" />
                        </div>
                    </c:if>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="username" class="form-label fw-semibold">Tên đăng nhập (Username): <span class="text-danger">*</span></label>
                            <form:input path="username" class="form-control" readonly="" placeholder="Nhập username..." />
                            <form:errors path="username" class="text-danger small mt-1 d-block" />
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="password" class="form-label fw-semibold">
                                Mật khẩu: 
                                <c:if test=""><span class="text-danger">*</span></c:if>
                                <c:if test=""><span class="text-muted small">(Để trống nếu không đổi)</span></c:if>
                            </label>
                            <form:password path="password" class="form-control" placeholder="Nhập mật khẩu..." />
                            <form:errors path="password" class="text-danger small mt-1 d-block" />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="fullName" class="form-label fw-semibold">Họ và tên: <span class="text-danger">*</span></label>
                        <form:input path="fullName" class="form-control" placeholder="Nhập họ và tên..." />
                        <form:errors path="fullName" class="text-danger small mt-1 d-block" />
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="email" class="form-label fw-semibold">Email:</label>
                            <form:input path="email" type="email" class="form-control" placeholder="example@email.com" />
                            <form:errors path="email" class="text-danger small mt-1 d-block" />
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="phone" class="form-label fw-semibold">Số điện thoại:</label>
                            <form:input path="phone" class="form-control" placeholder="0123456789" />
                            <form:errors path="phone" class="text-danger small mt-1 d-block" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="role" class="form-label fw-semibold">Vai trò (Role):</label>
                            <form:select path="role" class="form-select">
                                <form:option value="USER">USER (Khách hàng / Thành viên)</form:option>
                                <form:option value="ADMIN">ADMIN (Quản trị viên)</form:option>
                            </form:select>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="active" class="form-label fw-semibold">Trạng thái hoạt động:</label>
                            <form:select path="active" class="form-select">
                                <form:option value="true">Hoạt động</form:option>
                                <form:option value="false">Khóa tài khoản</form:option>
                            </form:select>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="images" class="form-label fw-semibold">Đường dẫn ảnh đại diện (Image URL):</label>
                        <form:input path="images" class="form-control" placeholder="images/user.png" />
                    </div>
                </div>

                <div class="card-footer bg-light d-flex justify-content-between p-3">
                    <a href="<c:url value='/admin/users' />" class="btn btn-secondary">
                        <i class="fas fa-arrow-left me-1"></i> Quay lại danh sách
                    </a>
                    <div class="d-flex gap-2">
                        <c:if test="">
                            <button type="reset" class="btn btn-outline-secondary">
                                <i class="fas fa-redo me-1"></i> Làm mới
                            </button>
                        </c:if>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save me-1"></i>
                            <c:choose>
                                <c:when test="">Cập nhật</c:when>
                                <c:otherwise>Lưu người dùng</c:otherwise>
                            </c:choose>
                        </button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>

</body>
</html>
