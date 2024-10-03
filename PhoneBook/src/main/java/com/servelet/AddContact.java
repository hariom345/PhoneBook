package com.servelet;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.ContactDao;
import com.entity.Contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addcontact")
public class AddContact extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userid = Integer.parseInt(req.getParameter("userid"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String about = req.getParameter("about");

		Contact c = new Contact(name, email, phone, about, userid);
		ContactDao cdao = new ContactDao(DbConnect.getConnection());
		boolean f = cdao.saveContact(c);
		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("successmsg", "Your Contact is Saved");
			resp.sendRedirect("addcontact.jsp");
		} else {
			session.setAttribute("failmsg", "Something Went wrong");
			resp.sendRedirect("addcontact.jsp");
		}

	}
}
