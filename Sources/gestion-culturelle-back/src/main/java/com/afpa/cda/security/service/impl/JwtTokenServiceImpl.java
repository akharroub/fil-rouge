package com.afpa.cda.security.service.impl;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.afpa.cda.security.model.JwtTokens;
import com.afpa.cda.security.model.UserSecDto;
import com.afpa.cda.security.service.JwtTokenService;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtParser;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.impl.DefaultClaims;

@Service
public class JwtTokenServiceImpl implements JwtTokenService {

    private static final String USER_SECRET = "userSecret";

    @Value("${cda.security.token.secret}")
    private String secret;

    @Autowired
    private UserDetailsService userService;

    @Override
    public JwtTokens createTokens(Authentication authentication) {

        String token;
        String refreshToken;

        UserSecDto user = (UserSecDto) authentication.getPrincipal();

        token = createToken(user);
        refreshToken = createRefreshToken(user);

        return new JwtTokens(token, refreshToken);
    }

    @Override
    public String createToken(UserSecDto user) {

        return Jwts.builder()
                .signWith(SignatureAlgorithm.HS512, secret)
                .setClaims(buildUserClaims(user))
                .setExpiration(getTokenExpirationDate(false))
                .setIssuedAt(new Date())
                .compact();
    }

    @Override
    public String createRefreshToken(UserSecDto user) {

        return Jwts.builder()
                .signWith(SignatureAlgorithm.HS512, secret)
                .setClaims(buildUserClaims(user))
                .setExpiration(getTokenExpirationDate(true))
                .setIssuedAt(new Date())
                .compact();
    }

    @Override
    public Jws<Claims> validateJwtToken(String token) {
        return Jwts.parser().setSigningKey(secret).parseClaimsJws(token);
    }

    @Override
    public JwtTokens refreshJwtToken(String refreshToken) {
        Jws<Claims> claims = validateJwtRefreshToken(refreshToken);
        String newToken = createTokenFromClaims(claims);
        return new JwtTokens(newToken, refreshToken);
    }

    private String createTokenFromClaims(Jws<Claims> jws) {

        return Jwts.builder()
                .setClaims(jws.getBody())
                .signWith(SignatureAlgorithm.HS512, secret)
                .setExpiration(getTokenExpirationDate(false))
                .setIssuedAt(new Date())
                .compact();
    }

    private Jws<Claims> validateJwtRefreshToken(String token) {
        JwtParser parser = Jwts.parser().setSigningKey(secret);
        Jws<Claims> claims = parser.parseClaimsJws(token);

        UserSecDto user = (UserSecDto) userService.loadUserByUsername(claims.getBody().getSubject());

//        return parser.require(USER_SECRET, user.getUserSecret()).parseClaimsJws(token);
        return parser.require(USER_SECRET, user.getTokenSecret()).parseClaimsJws(token);
    }

    private Date getTokenExpirationDate(boolean refreshToken) {
        Calendar calendar = Calendar.getInstance();

        if(refreshToken) {
            calendar.add(Calendar.MONTH, 1);
        } else {
            calendar.add(Calendar.MINUTE, 60);
        }

        return calendar.getTime();
    }

    private Claims buildUserClaims(UserSecDto user) {
        Claims claims = new DefaultClaims();

        claims.setSubject(String.valueOf(user.getId()));
        claims.put("username", user.getUsername());
//        claims.put("email", user.getEmail());
        claims.put("roles", String.join(",", AuthorityUtils.authorityListToSet(user.getAuthorities())));
//        claims.put(USER_SECRET, user.getUserSecret());
        claims.put(USER_SECRET, user.getTokenSecret());

        return claims;
    }
}
