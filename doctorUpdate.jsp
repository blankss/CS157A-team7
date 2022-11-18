<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<html>
  <head>
    <title>Doctor Login</title>
    </head>
  <body>
    <h1>Doctor Page</h1>
    
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String passwordDB = "root";
        try {
            String newDoctorFirstName = request.getParameter("doctorFirstName");
            String newDoctorLastName = request.getParameter("doctorLastName");
            String newSpecialization = request.getParameter("specialization");
            String doctorId = request.getParameter("doctorId");
            int id = Integer.parseInt(doctorId);
            //TODO: update username and password as well once admin table is done
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();

            int res = stmt.executeUpdate("UPDATE Doctor " + 
              "SET firstName = '" + newDoctorFirstName + "', lastName = '" + newDoctorLastName + "', specialization = '" + newSpecialization + "'" + 
              "WHERE idDoctor = '" + id + "'");

            out.write("<h1>Update Successful</h1>");
            
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>