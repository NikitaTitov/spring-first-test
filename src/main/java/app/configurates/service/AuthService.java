package app.configurates.service;


import app.model.Role;
import app.service.RoleService;
import app.service.UserService;
import app.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;
@Service
public class AuthService implements UserDetailsService {

    @Autowired
    UserService userService;

    @Override
    public UserDetails loadUserByUsername(String userLogin) throws UsernameNotFoundException {
        User user = userService.getUserByName(userLogin);

        return user;
    }
}
