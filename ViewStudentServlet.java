package com.simple.servlet;

import java.io.IOException;
import java.util.List;

import com.simple.model.Student;
import com.simple.util.HibernateUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.hibernate.Session;

@WebServlet("/view")
public class ViewStudentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        Session session = HibernateUtil.getFactory().openSession();

        List<Student> students =
                session.createQuery("from Student", Student.class).getResultList();

        session.close();

        request.setAttribute("students", students);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("view.jsp");

        dispatcher.forward(request, response);
    }
}