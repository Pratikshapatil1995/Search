<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<html lang="en">
<head>


  <title>Bank Search Application</title>
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
    
    * {
  box-sizing: border-box;
}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
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
  <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
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
       <li><a href="index.html">Home</a></li>
       
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
    
    <div class="col-sm-8text-left"> 

<h2>Search Bank Here</h2>
<input id="myInput" type="text" placeholder="Search..">
<br><br>



<div class="table-responsive-x1 table-responsive-sm table-responsive-md table-responsive-1g">
<select>
<option value="select" selected>Select</option>
  <option value="bangalore">Bangalore</option>
  <option value="mumbai">Mumbai</option>
  <option value="pune">Pune</option>
  <option value="delhi">Delhi</option>
  <option value="mysore">Mysore</option>
</select>

	<table class="table table-bordered">
	
	<thead>
		<tr>
		<tbody id="myTable">
			<th class="th-sm"> IFSC </th>
			<th class="th-sm"> Bank ID </th>
			<th class="th-sm"> Branch </th>
			<th class="th-sm"> City </th>
			<th class="th-sm"> District </th>
			<th class="th-sm"> State </th>
			<th class="th-sm"> Bank Name </th>
			
			
			
		</tr>
		</thead>
		
			<%
				try {
					/* String user=null;
					String pass=null; */
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql://127.0.0.1:3307/bank_search","root","root");
					System.out.println("DB Connected...!!!!");
					
					String sql = "Select *from select_bank1" ;
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next()) {
					%>
					<tbody>
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
						<td ><a href="mark1.jsp?id=<%=rs.getInt(1) %>"> Mark As favourite </td>	
					</tbody>
					<%
					}

				} catch (Exception e) {
					System.out.println("Exception :" + e);
				}
			%>
		
	</table>
	 <ul class="pagination">
	 <li ><a href="bank.jsp">1</a></li>
    <li class="active"><a href="bank1.jsp">2</a></li>
    <li><a href="bank2.jsp">3</a></li>
    <li><a href="bank3.jsp">4</a></li>
    
  </ul>
	</div>
	</div>
	</div>
	</div>
</body>
</html>

