<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
  
<%
String user=(String) session.getAttribute("user");
String sid=request.getParameter("id");
int id = Integer.parseInt(sid);
System.out.println("IDIn...!!!!"+id);
  %> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2
}
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Bank Search Application</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
       
      
       
      </ul>
      <ul class="nav navbar-nav navbar-right">
       
      </ul>
    </div>
  </div>
</nav>
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-1 ">
    <!--   <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p> -->
    </div>
    <div class="col-sm-10 text-left"> 



<% 
/* 

String sid= request.getParameter("id");
int id =Integer.parseInt(sid);
 */
try{
	/* String user=null;
	String pass=null; */
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/bank_search","root","root");
	System.out.println("DB Connected...!!!!");
	String sql="Select * from select_bank2 where id="+id;
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(sql);
	while(rs.next()) {
	session.setAttribute("id",rs.getInt("id"));
	System.out.println("IDiot...!!!!"+id);
	%>




  <form method="post" action="bank.jsp" enctype="multipart/form-data">

  <table class="table table-bordered">
  <h1>Marked As Favourite Bank List</h1>
	
	<thead>
		<tr>
		<tbody id="myTable">
			<th> IFSC </th>
			<th> Bank ID </th>
			<th> Branch </th>
			<th> City </th>
			<th> District </th>
			<th > State </th>
			<th > Bank Name </th>
			
			
		</tr>
		</thead>
		
		<tr>
					<tbody id="myTable">
						<td> <%=rs.getString("ifsc") %> </td>
						<td> <%=rs.getString("bank_id") %> </td>
						<td> <%=rs.getString("branch") %> </td>
						<td> <%=rs.getString("city") %> </td>
						<td> <%=rs.getString("district") %> </td>
						<td> <%=rs.getString("state") %> </td>
						<td> <%=rs.getString("bank_name") %> </td>
						
						
						</tr>
						</tbody>
  </form> 

	<%
	}
	}
	catch(Exception e){
		System.out.println("Exception :"+e);
	}

	%>
	
	 </div>
    <div class="col-sm-1 ">
     <!--  <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div> -->
    </div>
  </div>
</div>

</body>
</html>	 

	
