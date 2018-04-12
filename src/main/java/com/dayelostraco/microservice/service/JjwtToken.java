/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.service;


import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import org.springframework.stereotype.Service;

/**
 *
 * @author leo
 */@Service("jwtService")

public class JjwtToken implements Ijwt {

    @Override
    public String encodeToken(String id) throws UnsupportedEncodingException {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, 1);
        String jwt = Jwts.builder()
                .setSubject("users/TzMUocMF4p").setExpiration(cal.getTime())
                .claim("id", id)
                .signWith(
                        SignatureAlgorithm.HS256,
                        "secret".getBytes("UTF-8")
                )
                .compact();
        return jwt;
    }

    @Override
    public String decodeToken(String token) throws UnsupportedEncodingException {
        Jws<Claims> claims = Jwts.parser().setSigningKey("secret".getBytes("UTF-8")).parseClaimsJws(token);
        String id = (String) claims.getBody().get("id");
        return id;
    }
}
