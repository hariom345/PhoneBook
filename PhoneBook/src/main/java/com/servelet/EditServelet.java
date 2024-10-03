package com.servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.ContactDao;
import com.entity.Contact;

/**
 * Servlet implementation class EditServelet
 */

@WebServlet("/edit")
public class EditServelet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String about = request.getParameter("about");

		Contact c = new Contact();
		c.setName(name);
		c.setEmail(email);
		c.setAbout(about);
		c.setPhono(phone);
		c.setId(id);
		ContactDao cdao = new ContactDao(DbConnect.getConnection());
		boolean f = cdao.editContact(c);

		HttpSession session = request.getSession();
		if (f) {
			session.setAttribute("successmsg", "Your Contact is Updated Successfully");
			response.sendRedirect("viewContact.jsp");
		} else {
			session.setAttribute("failmsg", "Something Went wrong");
			response.sendRedirect("edicontact.jsp");
		}

	}

}
