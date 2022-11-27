<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Admin Registration</title>
    </head>
  <body>
    <h1>Admin Registration Form</h1>
    
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String passwordDB = "root";
        try {
            String nameParam = request.getParameter("adminName");
            String usernameParam = request.getParameter("username");
            String passwordParam = request.getParameter("password");
            String doctorBool = request.getParameter("doctorPosition");
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            Statement stmt1 = con.createStatement();

            //redirect to patient registration HTML form again if username exists already
            ResultSet setUsernameEmpty = stmt.executeQuery("SELECT username " +
              "FROM hospitaladministrators " +
              "WHERE username = '" + usernameParam + "'");

            if (setUsernameEmpty.isBeforeFirst()) {
              out.write("<html><body><script>alert('Username Taken Already')</script></body></html>");
              out.write("Username Taken, please register again: <a href='adminRegister.html'>Register</a>");
              return;
            }

            if (nameParam.isEmpty() || usernameParam.isEmpty() || passwordParam.isEmpty()) {
              out.write("<html><body><script>alert('Invalid Field Value')</script></body></html>");
              out.write("Empty or Invalid Input. Please try again: <a href='adminRegister.html'>Register</a>");
              return;
            }
            setUsernameEmpty.close();

            //don't forget that VALUES you need single quotes to denote variable name
            int res = stmt.executeUpdate("INSERT INTO hospitaladministrators(adminName,username,password, loggedin) VALUES('" + nameParam + "','" + usernameParam + "','" + passwordParam + "','" + 1 + "')");
            out.println("Successful registration, please login at: <a href='adminLogin.html'>Login</a>");

            if (doctorBool.equals("True")) {
              out.write("<br>");
              int doctorRes = stmt1.executeUpdate("INSERT INTO Doctor(firstName) VALUES('" + nameParam + "')");
              out.write("Doctor name added. Please input your information when you go update. <a href='doctorUpdate.html'>Doctor Update</a>");
            }

            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
