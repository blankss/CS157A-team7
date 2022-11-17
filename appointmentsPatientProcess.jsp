<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<html>
  <head>
    <title>Appointments</title>
    </head>
  <body>
    <h1>Appointments Page</h1>
    
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String passwordDB = "root";
        try {
            String patientParam = request.getParameter("patientName");
            String patientID = request.getParameter("patientID");
            String apptTimeParam = request.getParameter("appointmentDate");

            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            Statement stmt1 = con.createStatement();
            Statement insert = con.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * " +
              "FROM Appointment");

            int idPatient = Integer.parseInt(patientID);
            ResultSet doctors = stmt1.executeQuery("SELECT idDoctor " + 
              "FROM Patient " + 
              "WHERE '" + idPatient + "' = idPatient");


            if (!rs.isBeforeFirst()) {
              out.write("<html><body><script>alert('Date Incorrect')</script></body></html>");
              out.write("Username/Password incorrect, please try again: <a href='appointmentsPatient.html'>AppointmentsPage</a>");
              return;
            }

            apptTimeParam += ":00";
            out.write(apptTimeParam);

            LocalDateTime appt = LocalDateTime.parse(apptTimeParam);
            
            out.write("<h2>Hello, " + patientParam + "</h2><br>");
            doctors.next();
            int patientDoctor = doctors.getInt("idDoctor");
            while (rs.next()) {
              LocalDateTime tmp = rs.getTimestamp("appointmentDateTime").toLocalDateTime();
              int appointmentDoctor = rs.getInt("idAppointmentDoctor");

              if (tmp.plusMinutes(20).equals(appt) || tmp.equals(appt) || tmp.minusMinutes(20).equals(appt)
                && appointmentDoctor == patientDoctor) {
                out.write("Conflicting appointment time.<br>");
                out.write("Please try again.<br>");
                out.write("<a href='appointmentsPatient.html'>AppointmentsPage</a>");
                return;
              }

              if (LocalDateTime.now().isAfter(appt)) {
                out.write("Invalid appointment time, time already passed.<br>");
                out.write("Please try again.<br>");
                out.write("<a href='appointmentsPatient.html'>AppointmentsPage</a>");
                return;
              }

              if (appt.getHour() < 9 || appt.getHour() > 17) {
                out.write("Invalid appointment time, outside working hours.<br>");
                out.write("Please try again.<br>");
                out.write("<a href='appointmentsPatient.html'>AppointmentsPage</a>");
                return;
              }
            }
            
            //Primary key for appointment auto increments, so we do not need to insert
            int check = insert.executeUpdate("INSERT INTO Appointment(patientName,appointmentDateTime,idPatient,idAppointmentDoctor)values('"+patientParam+"','"+appt+"','"+idPatient+"','"+patientDoctor+"')");

            out.write("<h1>Appointment successfully booked: " + appt.toString() + "<br>");

            doctors.close();
            rs.close();
            stmt.close();
            stmt1.close();
            insert.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>