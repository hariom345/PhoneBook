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

@WebServlet("/register")
public class RegisterServelet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Getting Data from Register page
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		// sending data to user
		User user = new User();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);

		// Creating Dao ouject
		UserDao userDao = new UserDao(DbConnect.getConnection());
		Boolean f = userDao.userRegister(user);
		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("successmsg", "Registeration Successfully");
			resp.sendRedirect("register.jsp");
		} else {
			session.setAttribute("errormsg", "something went wrong");
			resp.sendRedirect("register.jsp");

		}

	}
}
