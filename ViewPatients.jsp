<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>AllPatients</title>
    </head>
  <body>
    <h1>Patients Database View</h1>
    
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "root";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            out.println("Initial entries in table \"Patients\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM hospibase.Patients");
            out.write("<table border=\"1\">");

            out.write("<tr>");
              out.write("<th>Patient ID</th>");
              out.write("<th>First Name</th>");
              out.write("<th>Last Name</th>");
              out.write("<th>Medical History</th>");
              out.write("<th>Prescriptions</th>");
              out.write("<th>Doctor</th>");
              out.write("<th>Room</th>");
              out.write("<th>Insurance</th>");
              out.write("<th>Fee Charges (USD)</th>");
            out.write("<tr>");

            while (rs.next()) {
                int id = rs.getInt(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String medicalHistory = rs.getString(4);
                String prescriptions = rs.getString(5);
                int doctor = rs.getInt(6);
                int room = rs.getInt(7);
                String insurance = rs.getString(8);
                double fee = rs.getDouble(9);

                out.write("<tr>");
                  out.write("<td>" + id + "</td>");
                  out.write("<td>" + firstName + "</td>");
                  out.write("<td>" + lastName + "</td>");
                  out.write("<td>" + medicalHistory + "</td>");
                  out.write("<td>" + prescriptions + "</td>");
                  out.write("<td>" + doctor + "</td>");

                  if (room == 0) {
                    out.write("<td>No room</td>");
                  }
                  else {
                    out.write("<td>" + room + "</td>");
                  }

                  if (insurance == null) {
                    out.write("<td>No insurance</td>");
                  }
                  else {
                    out.write("<td>" + insurance + "</td>");
                  }
                  out.write("<td>" + fee + "</td>");
                out.write("</tr>");
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
