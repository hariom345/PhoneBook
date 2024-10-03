<%@page import="com.entity.Contact"%>
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
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container">
		<div class="row mt-5 d-flex justify-content-center">
			<div class="col-8 card p-5">
				<h2 class="text-center text-success">Update Contact</h2>
				<%
				String success = (String) session.getAttribute("successmsg");
				String erro = (String) session.getAttribute("errormsg");
				if (success != null) {
				%>
				<p class="text-center text-primary">
					<%=success%>
				</p>
				<%
				session.removeAttribute("successmsg");
				}
				if (erro != null) {
				%>
				<p class="text-center text-danger">
					<%=erro%>
				</p>
				<%
				session.removeAttribute("errormsg");
				}
				%>
				<form action="edit" method="post">
					<%
					int cid;
					Contact c = null;
					if (user != null) {
						cid = Integer.parseInt(request.getParameter("cid"));
						ContactDao dao = new ContactDao(DbConnect.getConnection());
						c = dao.getDetailByID(cid);
						String nama = c.getName();

					}
					%>

					<input type="hidden" id="id" name="id" value="<%=c.getId()%>">
					<div class="mb-2 mt-3">
						<label class="form-label">Enter Name</label> <input type="text"
							class="form-control" id="uname" aria-describedby="emailHelp"
							name="name" value="<%=c.getName()%>">


					</div>
					<div class="mb-3 mt-3">
						<label class="form-label">Email address</label> <input
							type="email" class="form-control" id="email"
							aria-describedby="emailHelp " name="email"
							value="<%=c.getEmail()%>" placeholder="name@gmail.com">


					</div>
					<div class="mb-2 mt-3">
						<label class="form-label">Phone No</label> <input type="number"
							class="form-control" id="uname" aria-describedby="emailHelp"
							name="phone" value="<%=c.getPhono()%>">


					</div>

					<div class="form-group">
						<label class="form-label">About</label>
						<textarea rows="3" class="form-control" id="about" name="about"><%=c.getAbout()%></textarea>
					</div>


					<div
						class="d-flex justify-content-center align-items-center self-align-between mb-2">
						<button type="submit" class="btn btn-primary mx-2 " id="submit">Update</button>

					</div>
			</div>





			</form>
		</div>


	</div>




	<%@include file="component/footer.jsp"%>

</body>
</html>