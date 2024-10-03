package com.servelet;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.UserDao;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServelet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		User user = new User();

		// crrating UsreDao object
		UserDao userDao = new UserDao(DbConnect.getConnection());
		user = userDao.isRegisterUSer(email, password);
		HttpSession session = req.getSession();
		if (user != null) {
			session.setAttribute("user", user);
			resp.sendRedirect("index.jsp");
		} else {
			session.setAttribute("invalidmsg", "Invalid Email and Passowrd");
			resp.sendRedirect("login.jsp");
		}
	}
}
