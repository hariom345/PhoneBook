<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
</head>
<body style="background-color: #34ebe5;">
	<%@include file="component/navbar.jsp"%>

	<div class="container">
		<div class="row mt-5 d-flex justify-content-center min-vh-100">
			<div class="col-8 card p-5">
				<h2 class="text-center text-success">Login Page</h2>
				<%
                String invalidmsg=(String)session.getAttribute("invalidmsg");
                if(invalidmsg!=null){
                %>
				<p class="text-center text-danger"><%=invalidmsg %></p>
				<%
                session.removeAttribute("invalidmsg");
                } %>

				<%
                String logoutmsg=(String)session.getAttribute("logoutmsg");
                
                if(logoutmsg != null) {
                	session.removeAttribute("logoutmsg");
                } %>
				<form action="login" method="post">

					<div class="mb-3 mt-3">
						<label class="form-label">Email address</label> <input
							type="email" class="form-control" id="email"
							aria-describedby="emailHelp " name="email"
							placeholder="name@gmail.com">


					</div>

					<div class="mb-2 mt-3">
						<label class="form-label">Password</label> <input type="password"
							class="form-control" id="password" name="password" placeholder="">

					</div>

					<div
						class="d-flex justify-content-center align-items-center self-align-between mt-3">
						<button type="submit" class="btn btn-primary mx-2 " id="submit">Login</button>

					</div>

				</form>
			</div>


		</div>


	</div>

	<%@include file="component/footer.jsp"%>

</body>
</html>