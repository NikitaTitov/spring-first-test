package app.controllers;

import app.model.Role;
import app.service.RoleService;
import app.service.UserService;
import app.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class TableController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/")
    public String loginPage(Model model) {
        return "login";
    }

    @RequestMapping(value = "/admin")
    public String adminPage(Model model) {
        model.addAttribute("listUsers", userService.getAllUsers());
        model.addAttribute("roles",roleService.getAllRoles());
        model.addAttribute("person", new User());
        return "admin/adminDashBoard";
    }

    @RequestMapping(value = "/user")
    public String userPage(Model model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("userName", auth.getName());
        return "user/mainPage";
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/admin/listUsers")
    public String mainPage(Model model) {
        model.addAttribute("listUsers", userService.getAllUsers());
        model.addAttribute("roles",roleService.getAllRoles());
        return "admin/list/listUsers";
    }

    @RequestMapping(value = "/admin/update", method = RequestMethod.POST)
    public String saveUpdatePage(@RequestParam(value = "id")String id,
                                 @RequestParam(value = "login")String login,
                                 @RequestParam(value = "password")String password,
                                 @RequestParam(value = "roles")String roles) {
        Long numberID = Long.parseLong(id);
        Set<Role> role = roleService.getSetOfRoles(roles);
        User user = userService.getUserById(numberID);
        user.setLogin(login);
        user.setPassword(password);
        user.setRoles(role);
        roleService.addRole(role);

        userService.updateUser(user);
        return "redirect:/admin";
    }


    @RequestMapping(value = "/admin/create", method = RequestMethod.POST)
    public String saveCreatedUserPage(@RequestParam(value = "login")String login,
                                      @RequestParam(value = "password")String password,
                                      @RequestParam(value = "roles")String roles) {
        Set<Role> role = roleService.getSetOfRoles(roles);
        User newUser = new User(login, password);
        newUser.setRoles(role);

        boolean hasPersonInDB = userService.addUser(newUser);
        roleService.addRole(role);
        return "redirect:/admin/adminDashBoard";
    }
}
