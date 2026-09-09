<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${category.isEdit ? 'Edit Category' : 'Add New Category'}</title>
</head>
<body>

    <form action="<c:url value='/admin/categories/saveOrUpdate' />" method="POST" enctype="multipart/form-data">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">${category.isEdit ? 'Edit Category' : 'Add New Category'}</h4>
            </div>

            <div class="card-body">
                <input type="hidden" name="isEdit" value="${category.isEdit}" />

                <div class="mb-3">
                    <label for="categoryId" class="form-label">Category ID:</label>
                    <input type="text" readonly="readonly" class="form-control" 
                           id="categoryId" name="categoryId" value="${category.categoryId}" 
                           placeholder="Category Id (Tự động sinh khi tạo mới)" />
                </div>

                <div class="mb-3">
                    <label for="categoryname" class="form-label">Category Name:</label>
                    <input type="text" class="form-control" id="categoryname" name="categoryname" 
                           value="${category.categoryname}" placeholder="Nhập tên Category" required="required" />
                </div>

                <div class="mb-3">
                    <label for="status" class="form-label">Status:</label>
                    <select class="form-select" id="status" name="status">
                        <option value="1" ${category.status == 1 ? 'selected' : ''}>Hoạt động</option>
                        <option value="0" ${category.status == 0 ? 'selected' : ''}>Khóa</option>
                    </select>
                </div>
            </div>

            <div class="card-footer d-flex gap-2">
                <a href="<c:url value='/admin/categories/add' />" class="btn btn-secondary">
                    <i class="fas fa-redo"></i> Reset
                </a>
                <a href="<c:url value='/admin/categories' />" class="btn btn-success">
                    <i class="fas fa-list"></i> Danh sách
                </a>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i>
                    <c:choose>
                        <c:when test="${category.isEdit}"><span>Update</span></c:when>
                        <c:otherwise><span>Save</span></c:otherwise>
                    </c:choose>
                </button>
            </div>
        </div>
    </form>

</body>
</html>
