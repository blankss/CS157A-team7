<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Patient Registration</title>
    </head>
  <body>
    <h1>Registration Form</h1>
    
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

            //TODO redirect to patient registration HTML form again if username exists already

            //TODO automatically assign to doctor that has the least number of 

            //don't forget that VALUES you need single quotes to denote variable name
            int res = stmt.executeUpdate("INSERT INTO Patients(firstName,lastName,username,password) VALUES('" + firstNameParam + "','" + lastNameParam + "','" + usernameParam + "','" + passwordParam + "')");
            out.println("Successful registration");
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
