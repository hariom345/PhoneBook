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
		<div class="row mt-5 d-flex justify-content-center">
			<div class="col-8 card p-5">
				<h2 class="text-center text-success">Registration Page</h2>
				<%    String success= (String)session.getAttribute("successmsg");
                      String erro= (String)session.getAttribute("failmsg");
                      if(success!=null){
                    	  %>
				<p class="text-center text-primary">
					<%=success %>
				</p>
				<%
                session.removeAttribute("successmsg");
                 }
                      if(erro!=null){
                 %>
				<p class="text-center text-danger">
					<%=erro %>
				</p>
				<%
                     session.removeAttribute("failmsg");
                      }
                     %>


				<form action=" register" method="post">
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Enter
							Your Name</label> <input type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp">
					</div>
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Email
							address</label> <input type="email" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp">
					</div>

					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password</label>
						<input type="password" class="form-control"
							id="exampleInputPassword1">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary ">Register</button>
					</div>


				</form>
			</div>


		</div>


	</div>

	<%@include file="component/footer.jsp"%>

</body>
</html>