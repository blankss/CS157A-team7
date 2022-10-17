<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>AllDoctors</title>
    </head>
  <body>
    <h1>Doctors Database View</h1>
    
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String passwordDB = "root";
        try {
            String firstNameParam = request.getParameter("firstName");
            String lastNameParam = request.getParameter("lastName");
            String usernameParam = request.getParameter("username");
            String passwordParam = request.getParameter("password");
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("INSERT INTO UserAccounts(firstName,lastName,username,password) VALUES('" + firstNameParam + "','" + lastNameParam + "','" + usernameParam + "','" + passwordParam + "')");
            out.println("Successful registration");
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
