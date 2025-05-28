package com.exemple.ejb;

import jakarta.ejb.Stateless;

@Stateless
public class HelloService {
    public String direBonjour(String nom) {
        return "Bonjour, " + nom + " !";
    }
}
