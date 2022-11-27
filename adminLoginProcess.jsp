<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Admin Login</title>
    </head>
  <body>
    <h1>Admin Login</h1>
    
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String passwordDB = "root";
        try {
            String usernameParam = request.getParameter("username");
            String passwordParam = request.getParameter("password");
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            Statement stmt1 = con.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * " +
              "FROM hospitaladministrators " + 
              "WHERE username = '" + usernameParam + "' AND password = '" + passwordParam + "'");

            if (!rs.isBeforeFirst()) {
              out.write("<html><body><script>alert('Username/Password incorrect')</script></body></html>");
              out.write("Username/Password incorrect, please try again: <a href='adminLogin.html'>Login</a>");
              return;
            }

            rs.next();
            if (rs.getString("username").equals(usernameParam) && rs.getString("password").equals(passwordParam)) {
              out.write("<h3>Admin logged in instance success. </h3>");
              out.write("Please choose an administrative action to do below.");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('updateEquipment.html') value='Update Hospital Equipment'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('updateMedication.html') value='Update Hospital Medication'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('updateRooms.html') value='Update Hospital Rooms'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('adminRegister.html') value='Register Additional Admin'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('removePatient.html') value='Remove Patient File'>");
              out.write("<br>");
              out.write("<br>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>