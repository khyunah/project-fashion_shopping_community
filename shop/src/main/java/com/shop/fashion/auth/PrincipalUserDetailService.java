package com.shop.fashion.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.shop.fashion.model.User;
import com.shop.fashion.repository.UserRepository;

@Service
public class PrincipalUserDetailService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findByUsername(username).orElseThrow(() -> {
			return new UsernameNotFoundException("해당 유저를 찾을 수 없습니다.");
		});
		return new PrincipalUserDetail(user);
	}

}
