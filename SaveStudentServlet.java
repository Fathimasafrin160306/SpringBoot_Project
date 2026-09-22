package com.simple.servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.simple.model.Student;
import com.simple.util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/save")
public class SaveStudentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");

        Session session = HibernateUtil
                .getFactory()
                .openSession();

        Transaction tx = session.beginTransaction();

        Student student = new Student(name, email);

        session.persist(student);

        tx.commit();

        session.close();

        response.sendRedirect("view");
    }
}