<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Admin Update</title>
    </head>
  <body>
    <h1>Admin Update Page</h1>
    
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String passwordDB = "root";
        try {
            String newAdminName = request.getParameter("adminName");
            String newAdminUsername = request.getParameter("adminUsername");
            String password = request.getParameter("password");
            String idAdmin = request.getParameter("idAdmin");
            int adminID = Integer.parseInt(idAdmin);
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            Statement stmt1 = con.createStatement();

            if (idAdmin.isEmpty()) {
              out.write("Please put your admin id in the field.<a href='updateAdmin.html'>Update Admin</a>");
              return;
            }

            ResultSet admins = stmt.executeQuery("SELECT * " +
              "FROM hospitaladministrators " + 
              "WHERE idAdmin = '" + adminID + "'");

            admins.next();
            if (newAdminName.isEmpty()) {
              newAdminName =  admins.getString("adminName");
            }

            if (newAdminUsername.isEmpty()) {
              newAdminUsername = admins.getString("username");
            }

            if (password.isEmpty()) {
              password = admins.getString("password");
            }

            int res = stmt.executeUpdate("UPDATE hospitaladministrators " + 
              "SET adminName = '" + newAdminName + "', username = '" + newAdminUsername + "', password = '" + password + "'" + 
              "WHERE idAdmin = '" + adminID + "'");

            out.write("<h1>Update Successful</h1><br>");
            out.write("Please login again to display your new information.<a href='adminLogin.html'>Login</a>");
            
            stmt1.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>