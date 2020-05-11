package com.afpa.cda.security.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
		authenticationManagerBuilder.userDetailsService(userDetailsService);
	}

	@Override
	@Bean
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Bean
	public JwtAuthenticationTokenFilter authenticationTokenFilterBean() {
		return new JwtAuthenticationTokenFilter();
	}

	@SuppressWarnings("deprecation")
	@Bean
	public static NoOpPasswordEncoder passwordEncoder() {
		return (NoOpPasswordEncoder) NoOpPasswordEncoder.getInstance();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		String[] swaggerUrls = {
				"/v2/api-docs",
				"/swagger-resources", "/swagger-resources/**", "/configuration/ui",
				"/configuration/security", "/swagger-ui.html", "/webjars/**", "/error"
		};

		String[] RespUrls = { "/admin","/role*" , "/typesalle"};

		String[] AdminUrls = { "/salle","/vip","/animateur","/client","/users","/manifestation","/invitation"};

		String[] ClientUrls = {"/panier"};

		String[] AnimUrls = {"/animation"};

		String [] VipUrls = {"/invitation"} ;

		String[] AllUrls = {"/commande","/newusers","/role","/public/inscription", "/public/login","public/profil",
				"/public/animation","/public/manifestation","/public/salle","/public" };

		http.csrf().disable();

		http.headers().frameOptions().disable();
		//        http.headers().frameOptions().sameOrigin();

		http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and().authorizeRequests()
		.antMatchers(HttpMethod.OPTIONS).permitAll()

//		.antMatchers("/**").permitAll()
//		.antMatchers("/*").permitAll()
		.antMatchers(AllUrls).permitAll()
		.antMatchers(ClientUrls).hasAnyAuthority(new String[]{"CLIENT","ADMIN","RESP"})
		.antMatchers(AdminUrls).hasAnyAuthority(new String[]{"ADMIN","RESP"})
		.antMatchers(VipUrls).hasAnyAuthority(new String[]{"VIP"})
		.antMatchers(AnimUrls).hasAnyAuthority(new String[]{"ANIM"})
		.antMatchers(RespUrls).hasAnyAuthority(new String[]{"RESP"})

		.antMatchers(swaggerUrls).permitAll()
		.antMatchers("/h2-console/**").permitAll()
		.anyRequest().authenticated();

		http.addFilterBefore(authenticationTokenFilterBean(), UsernamePasswordAuthenticationFilter.class);

	}

}