package com.example.controllers.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.entity.Category;
import com.example.model.CategoryModel;
import com.example.services.ICategoryService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("admin/categories")
public class CategoryController {

    @Autowired
    private ICategoryService categoryService;

    @RequestMapping("")
    public String list(ModelMap model, @RequestParam(name = "keyword", required = false) String keyword) {
        List<Category> list;
        if (keyword != null && !keyword.trim().isEmpty()) {
            list = categoryService.findByCategorynameContaining(keyword.trim());
            model.addAttribute("keyword", keyword.trim());
        } else {
            list = categoryService.findAll();
        }
        model.addAttribute("categories", list);
        return "admin/categories/list";
    }

    @GetMapping("add")
    public String add(ModelMap model) {
        CategoryModel cateModel = new CategoryModel();
        cateModel.setIsEdit(false);
        model.addAttribute("category", cateModel);
        return "admin/categories/addOrEdit";
    }

    @PostMapping("saveOrUpdate")
    public ModelAndView saveOrUpdate(ModelMap model,
            @Valid @ModelAttribute("category") CategoryModel cateModel,
            BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("admin/categories/addOrEdit");
        }

        Category entity = new Category();
        BeanUtils.copyProperties(cateModel, entity);

        categoryService.save(entity);

        String message = "";
        if (Boolean.TRUE.equals(cateModel.getIsEdit())) {
            message = "Cập nhật Category thành công!";
        } else {
            message = "Thêm mới Category thành công!";
        }
        model.addAttribute("message", message);

        return new ModelAndView("forward:/admin/categories", model);
    }

    @GetMapping("edit/{id}")
    public ModelAndView edit(ModelMap model, @PathVariable("id") int id) {
        Optional<Category> optCategory = categoryService.findById(id);
        CategoryModel cateModel = new CategoryModel();

        if (optCategory.isPresent()) {
            Category entity = optCategory.get();
            BeanUtils.copyProperties(entity, cateModel);
            cateModel.setIsEdit(true);

            model.addAttribute("category", cateModel);
            return new ModelAndView("admin/categories/addOrEdit", model);
        }

        model.addAttribute("message", "Category không tồn tại!");
        return new ModelAndView("forward:/admin/categories", model);
    }

    @GetMapping("delete/{id}")
    public ModelAndView delete(ModelMap model, @PathVariable("id") int id) {
        categoryService.deleteById(id);
        model.addAttribute("message", "Xóa Category thành công!");
        return new ModelAndView("redirect:/admin/categories", model);
    }
}
