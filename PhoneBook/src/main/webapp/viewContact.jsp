<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
.card-ho:hover {
	background-color: #d5d5d5;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	transform: translateY(-2px);
	transition: 0.3s;
}
</style>
</head>
<body style="background-color: #34ebe5;">
	<%@include file="component/navbar.jsp"%>

	<% if(user==null){
	
	session.setAttribute("invalidmsg", "Login Please...");
	response.sendRedirect("login.jsp");
}
	%>
	<%
	String success=(String)session.getAttribute("successmsg");
	String failedmsg=(String)session.getAttribute("failedmsg"); 
	if(success!=null){%>

	<div class="alert alert-success" role="alert"><%=success %></div>

	<%
	session.removeAttribute("successmsg");
	} 
    if(failedmsg!=null){
        %>
	<p class="text-center text-danger">
		<%=failedmsg %>
	</p>
	<%
            session.removeAttribute("failedmsg");
             }
            %>

	<div class="container">
		<div class="row p-4 ">


			<%
	if(user!=null){
	ContactDao dao=new ContactDao(DbConnect.getConnection());
    List<Contact> l=dao.getAllContact(user.getId());
    for(Contact c:l){ %>
			<div class="col-md-3">
				<div class="card card-ho			">
					<div class="card-body ">
						<h5>
							Name:
							<%=c.getName() %></h5>
						<p>
							Email :
							<%=c.getEmail() %></p>
						<p>
							Phone :
							<%=c.getPhono() %></p>
						<p>
							About :
							<%=c.getAbout() %></p>
						<div class="d-flex justify-content-start">
							<a href="editcontact.jsp?cid=<%=c.getId() %>"
								class="btn btn-success text-white btn-sm ">Edit</a> <a
								href="DeleteContact?cid=<%=c.getId() %>"
								class="btn btn-danger text-white btn-sm ml-2">Delete</a>
						</div>
					</div>
				</div>
			</div>



			<% } }%>





		</div>
	</div>

</body>
</html>