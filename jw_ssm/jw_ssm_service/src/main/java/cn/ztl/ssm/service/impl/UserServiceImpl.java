package cn.ztl.ssm.service.impl;

import cn.ztl.ssm.dao.IUserDao;
import cn.ztl.ssm.domain.Admin;
import cn.ztl.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao iUserDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Admin admin = null;
        try {
            admin = iUserDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //将我们从数据库拿到的数据 给 User
        User user = new User(admin.getUsername(), "{noop}" + admin.getPassword(), getAuthorities());
        return user;
    }

    private List<SimpleGrantedAuthority> getAuthorities() {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        list.add(new SimpleGrantedAuthority("ROLE_USER"));
        return list;
    }
}
