package com.aaron.babebasket.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.aaron.babebasket.repositories.UsersRepository;
import com.aaron.babebasket.services.CustomUserDetailsService;

@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableWebSecurity
@EnableMongoRepositories(basePackageClasses = UsersRepository.class)
@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
	
	
	 @Autowired
	    private CustomUserDetailsService userDetailsService;

	    @Override
	    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

	        auth.userDetailsService(userDetailsService)
	        .passwordEncoder(getPasswordEncoder());
	    }


	    @Override
	    protected void configure(HttpSecurity http) throws Exception {

	        http.csrf().disable();
	        http.authorizeRequests()
	        		.antMatchers("/webapp/resources/**").permitAll() 
	        		//.antMatchers("/profile").permitAll() 
	                .antMatchers("**/secured/**").authenticated()
	                .anyRequest().permitAll()
	                .and()
	                .formLogin()
	                .loginPage("/login")
	                .failureUrl("/login?error")
	                .permitAll()
			        .and()
			        .logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login");
	    }

	    private PasswordEncoder getPasswordEncoder() {
	        return new PasswordEncoder() {
	            @Override
	            public String encode(CharSequence charSequence) {
	                return charSequence.toString();
	            }

	            @Override
	            public boolean matches(CharSequence charSequence, String s) {
	                return true;
	            }
	        };
	    }
	}
