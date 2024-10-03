<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDao"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary	">
  <a class="navbar-brand" href="index.jsp">PhoneBook</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i>Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="addcontact.jsp"><i class="fa-solid fa-plus"></i>Add Phone NO</a>
      </li>
     

      <li class="nav-item active">
        <a class="nav-link " href="viewContact.jsp"><i class="fa-solid fa-magnifying-glass"></i>
        View Contact</a>
      </li>
    </ul>
    
    <%
    User user=(User)session.getAttribute("user");
    if(user==null){
    	 %>
    	<form class="form-inline my-2 my-lg-0">
    <a href="login.jsp" class="btn btn-warning "><i class="fa-solid fa-user"></i>Login</a>
    <a href="register.jsp" class="btn btn-success ml-2"><i class="fa-sharp fa-solid fa-user-plus"></i>Register</a>
    </form> 
    	 
    	 <%
          }else{
    	 %>
    	 
    	 <button class="btn btn-success"><%=user.getName() %></button>
    	 <a    data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-warning ml-2 text-white" >Logout</a>
    	 <%} %>
   
    
    
  </div>
  <!-- Logout popup -->
  <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <h5>Do you want to logout</h5>
      
      </div>
      <div class="modal-footer">
        <a   href="logout" class="btn btn-secondary" data-dismiss="modal">Close</a>
        <a href="logout" class="btn btn-primary ">Yes</a>
      </div>
    </div>
  </div>
</div>
  <!-- Logout popup -->
</nav>