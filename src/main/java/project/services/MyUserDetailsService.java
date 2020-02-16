package project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import project.entities.UserInfo;

import java.util.ArrayList;
import java.util.List;

@Service
public class MyUserDetailsService implements UserDetailsService {

    private MainAppService mainAppService;

    @Autowired
    public void setDao(MainAppService mainAppService) {
        this.mainAppService = mainAppService;
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = mainAppService.getUsersListByLogin(username).get(0);
        if (userInfo == null) {
            throw new UsernameNotFoundException("User " + username + " was not found in the database");
        }

        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
        GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + userInfo.getStatus().getStatus());
        grantList.add(authority);
        User user = new User(userInfo.getLogin(), userInfo.getPassword(), grantList);
        UserDetails userDetails = (UserDetails) new User(userInfo.getLogin(), "{noop}"+userInfo.getPassword(), grantList);
        return userDetails;
    }
}
