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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.entity.User;
import com.example.model.UserModel;
import com.example.services.IUserService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("admin/users")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping("")
    public String list(ModelMap model, @RequestParam(name = "keyword", required = false) String keyword) {
        List<User> list;
        if (keyword != null && !keyword.trim().isEmpty()) {
            list = userService.search(keyword.trim());
            model.addAttribute("keyword", keyword.trim());
        } else {
            list = userService.findAll();
        }
        model.addAttribute("users", list);
        return "admin/users/list";
    }

    @GetMapping("add")
    public String add(ModelMap model) {
        UserModel userModel = new UserModel();
        userModel.setIsEdit(false);
        userModel.setActive(true);
        userModel.setRole("USER");
        model.addAttribute("user", userModel);
        return "admin/users/addOrEdit";
    }

    @PostMapping("saveOrUpdate")
    public ModelAndView saveOrUpdate(ModelMap model,
            @Valid @ModelAttribute("user") UserModel userModel,
            BindingResult result,
            RedirectAttributes redirectAttributes) {

        boolean isEdit = Boolean.TRUE.equals(userModel.getIsEdit());

        if (!isEdit && (userModel.getPassword() == null || userModel.getPassword().trim().isEmpty())) {
            result.rejectValue("password", "NotEmpty", "Mật khẩu không được để trống khi tạo mới");
        }

        if (!isEdit && userService.existsByUsername(userModel.getUsername())) {
            result.rejectValue("username", "Duplicate", "Tên đăng nhập đã tồn tại trong hệ thống");
        }

        if (result.hasErrors()) {
            return new ModelAndView("admin/users/addOrEdit");
        }

        User entity = new User();
        if (isEdit) {
            Optional<User> optUser = userService.findById(userModel.getUserId());
            if (optUser.isPresent()) {
                User existing = optUser.get();
                BeanUtils.copyProperties(userModel, entity);
                if (userModel.getPassword() == null || userModel.getPassword().trim().isEmpty()) {
                    entity.setPassword(existing.getPassword());
                }
            } else {
                BeanUtils.copyProperties(userModel, entity);
            }
        } else {
            BeanUtils.copyProperties(userModel, entity);
        }

        userService.save(entity);

        String message = isEdit ? "Cập nhật User thành công!" : "Thêm mới User thành công!";
        redirectAttributes.addFlashAttribute("message", message);

        return new ModelAndView("redirect:/admin/users");
    }

    @GetMapping("edit/{id}")
    public ModelAndView edit(ModelMap model, @PathVariable("id") int id, RedirectAttributes redirectAttributes) {
        Optional<User> optUser = userService.findById(id);
        if (optUser.isPresent()) {
            UserModel userModel = new UserModel();
            BeanUtils.copyProperties(optUser.get(), userModel);
            userModel.setIsEdit(true);
            userModel.setPassword("");
            model.addAttribute("user", userModel);
            return new ModelAndView("admin/users/addOrEdit", model);
        }

        redirectAttributes.addFlashAttribute("message", "User không tồn tại trong hệ thống!");
        return new ModelAndView("redirect:/admin/users");
    }

    @GetMapping("delete/{id}")
    public ModelAndView delete(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
        Optional<User> optUser = userService.findById(id);
        if (optUser.isPresent()) {
            userService.deleteById(id);
            redirectAttributes.addFlashAttribute("message", "Xóa User thành công!");
        } else {
            redirectAttributes.addFlashAttribute("message", "Không tìm thấy User để xóa!");
        }
        return new ModelAndView("redirect:/admin/users");
    }
}
