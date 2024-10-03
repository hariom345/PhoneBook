package com.servelet;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.ContactDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteContact")
public class DeleteContact extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cid = Integer.parseInt(req.getParameter("cid"));
		ContactDao dao = new ContactDao(DbConnect.getConnection());
		boolean f = dao.deleteContactById(cid);
		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("successmsg", "Contact Deleted Successfully");
			resp.sendRedirect("viewContact.jsp");
		} else {
			session.setAttribute("failedmsg", "Something went wrong");
			resp.sendRedirect("viewContact.jsp");
		}

	}
}
