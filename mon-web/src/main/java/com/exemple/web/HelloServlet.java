package com.exemple.web;

import com.exemple.ejb.HelloService;
import jakarta.ejb.EJB;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class HelloServlet extends HttpServlet {

    @EJB
    private HelloService helloService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = helloService.direBonjour("Étudiant");
        resp.setContentType("text/plain");
        resp.getWriter().write(message);
    }
}
