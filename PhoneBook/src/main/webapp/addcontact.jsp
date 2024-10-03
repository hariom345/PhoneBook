<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp" %>
</head>
<body style="background-color: #34ebe5;">
<%@include file="component/navbar.jsp" %>
<% if(user==null){
	
	session.setAttribute("invalidmsg", "Login Please...");
	response.sendRedirect("login.jsp");
}
	%>


    <div class="container">
        <div class="row mt-5 d-flex justify-content-center">
            <div class="col-8 card p-5">
                <h2 class="text-center text-success">Add Contact Page</h2>
                 <%    String success= (String)session.getAttribute("successmsg");
                      String erro= (String)session.getAttribute("errormsg");
                      if(success!=null){
                    	  %> 	  
                     <p class="text-center text-primary">  <%=success %>  </p>
                <%
                session.removeAttribute("successmsg");
                 }
                      if(erro!=null){
                 %>     
                   <p class="text-center text-danger">  <%=erro %>  </p>  
                     <%
                     session.removeAttribute("errormsg");
                      }
                     %>
                <form action="addcontact" method="post">
                <%
                if(user!=null){
                	%>
                	<input type="hidden" name="userid" value="<%=user.getId() %>">
                	
                	<%
                }
                	%>
                
                
                    <div class="mb-2 mt-3">
                        <label class="form-label">Enter Name</label>
                        <input type="text" class="form-control" id="uname" aria-describedby="emailHelp" name="name"  >
                     

                    </div>
                    <div class="mb-3 mt-3">
                        <label class="form-label">Email address</label>
                        <input type="email" class="form-control" id="email" aria-describedby="emailHelp " name="email" 
                            placeholder="name@gmail.com">
                            

                    </div>
                       <div class="mb-2 mt-3">
                        <label class="form-label">Phone No</label>
                        <input type="number" class="form-control" id="uname" aria-describedby="emailHelp" name="phone"  >
                     

                    </div>
                    
                     <div class="form-group">  
                            <label class="form-label">About</label>  
                           <textarea rows="3" class="form-control" id="about" name="about"  ></textarea>  
                      </div>


                    <div class="d-flex justify-content-center align-items-center self-align-between mb-2">
                        <button type="submit" class="btn btn-primary mx-2 " id="submit" >Add Contact</button>
                       
                    </div>
                     </div>
                      

                   
                  

                </form>
            </div>
           
            
        </div>
       

    

<%@include file="component/footer.jsp" %>

</body>
</html>