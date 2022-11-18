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
            int idDoctor = Integer.parseInt(doctorId);
            //TODO: update username and password as well once admin table is done
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            Statement stmt1 = con.createStatement();

            if (doctorId.isEmpty()) {
              out.write("Please put your doctor id in the field.<a href='doctorUpdate.html'>Update</a>");
              return;
            }

            ResultSet doctors = stmt1.executeQuery("SELECT * " +
              "FROM Doctor " + 
              "WHERE idDoctor = '" + idDoctor + "'");

            doctors.next();
            if (newDoctorFirstName.isEmpty()) {
              newDoctorFirstName =  doctors.getString("firstName");
            }

            if (newDoctorLastName.isEmpty()) {
              newDoctorLastName = doctors.getString("lastName");
            }

            if (newSpecialization.isEmpty()) {
              newSpecialization = doctors.getString("specialization");
            }

            int res = stmt.executeUpdate("UPDATE Doctor " + 
              "SET firstName = '" + newDoctorFirstName + "', lastName = '" + newDoctorLastName + "', specialization = '" + newSpecialization + "'" + 
              "WHERE idDoctor = '" + idDoctor + "'");

            out.write("<h1>Update Successful</h1><br>");
            out.write("Please login again to display your new information.<a href='doctorLogin.html'>Login</a>");
            
            stmt.close();
            stmt1.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>