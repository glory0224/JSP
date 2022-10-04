<style type="text/css">
	a {text-decoration: none; color:black;}
	ul {padding: 20px;}
	ul li {display: inline; padding: 15px;}
	.main_div{height:150px;}
</style>

<div align="center">
	<h1>CARE LAB</h1>
</div>

<div align="right">
	<hr>
	<ul>
		<li><a href="index.jsp">HOME</a></li>
		<% if(session.getAttribute("id") == null){%>
			<li><a href="register.jsp">Register</a></li>
			<li><a href="login.jsp">Login</a></li>
		<%}else{ %>
			<li><a href="memberInfo.jsp">MemberInfo</a></li>
			<li><a href="logout.jsp">Logout</a></li>
			<li><a href="boardForm.jsp">Board</a></li>
		<%} %>
	</ul>
	<hr>
</div>




