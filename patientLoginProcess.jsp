<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Patient Login</title>
    </head>
  <body>
    <h1>Patient Login</h1>
    
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
              "FROM Patient " + 
              "WHERE username = '" + usernameParam + "' AND password = '" + passwordParam + "'");


            if (!rs.isBeforeFirst()) {
              out.write("<html><body><script>alert('Username/Password incorrect')</script></body></html>");
              out.write("Username/Password incorrect, please try again: <a href='patientLogin.html'>Login</a>");
              return;
            }

            rs.next();
            if (rs.getString("username").equals(usernameParam) && rs.getString("password").equals(passwordParam)) {
              int id = rs.getInt("idPatient");
              String firstName = rs.getString("firstName");
              String lastName = rs.getString("lastName");
              String phone = rs.getString("phoneNumber");
              String dob = rs.getString("dateOfBirth");
              int doctor = rs.getInt("idDoctor");
              String insurance = rs.getString("idPlan");
              int medicationId = rs.getInt("idMedication");

              ResultSet doctorRS = stmt.executeQuery("SELECT firstName, lastName " +
                "FROM Doctor " + 
                "WHERE idDoctor = '" + doctor + "'"
                );

              ResultSet appointments = stmt1.executeQuery("SELECT * " + 
                "FROM Appointment " + 
                "WHERE idPatient = '" + id + "'");

              doctorRS.next();
              String doctorFirstName = doctorRS.getString(1);
              String doctorLastName = doctorRS.getString(2);

              out.write("<h2>Hello, " + firstName + "</h2><br>");
              out.write("<input type=button onClick=parent.open('/patientPayment.html') value='Payment Page'>");
              out.write("<input type=button onClick=parent.open('patientAppointment.html') value='Make An Appointment'>");

              out.write("<table border=\"1\">");

              out.write("<tr>");
              out.write("<th>Patient ID</th>");
              out.write("<th>First Name</th>");
              out.write("<th>Last Name</th>");
              out.write("<th>Phone</th>");
              out.write("<th>Date Of Birth</th>");
              out.write("<th>Doctor</th>");
              out.write("<th>Insurance</th>");
              out.write("<th>Medication</th>");
              out.write("<th>Room</th>");
              out.write("<th>Appointments</th>");
              out.write("<tr>");

              out.write("<tr>");
              out.write("<td><center>" + id + "</center></td>");
              out.write("<td><center>" + firstName + "</center></td>");
              out.write("<td><center>" + lastName + "</center></td>");
              out.write("<td>" + phone + "</td>");
              out.write("<td>" + dob + "</td>");
              out.write("<td>" + doctorFirstName + " " + doctorLastName + "</td>");
              out.write("<td><center>" + insurance + "</center></td>");
              out.write("<td><center>" + medicationId + "</center></td>");
              out.write("<td>TBD</td>");
              out.write("<td>");
              out.write("<ul>");

              if (!appointments.isBeforeFirst()) {
                out.write("<center>No appointments scheduled.</center></td>");
              }
              else {
                while (appointments.next()) {
                  out.write("<li>" + appointments.getTimestamp("appointmentDateTime") + "</li><br>");
                }
                out.write("</ul>");
              }

              out.write("</tr>");
              doctorRS.close();
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