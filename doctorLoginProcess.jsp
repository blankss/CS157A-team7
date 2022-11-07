<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
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

            ResultSet rs = stmt.executeQuery("SELECT * " +
              "FROM Doctor " + 
              "WHERE username = '" + usernameParam + "' AND password = '" + passwordParam + "'");


            if (!rs.isBeforeFirst()) {
              out.write("<html><body><script>alert('Username/Password incorrect')</script></body></html>");
              out.write("Username/Password incorrect, please try again: <a href='doctorLogin.html'>Login</a>");
              return;
            }

            rs.next();
            if (rs.getString("username").equals(usernameParam) && rs.getString("password").equals(passwordParam)) {

              int idDoctor = rs.getInt("idDoctor");
              String doctorFirstName = rs.getString("firstName");
              String doctorLastName = rs.getString("lastName");
              String specialization = rs.getString("specialization");

              ResultSet patients = stmt.executeQuery("SELECT * " +
                "FROM Patient " + 
                "WHERE idPatientDoctor = '" + idDoctor + "'");

              // ArrayList<Integer> idPatientList = new ArrayList<Integer>();

              // while (patients.next()) {
              //   idPatientList.add(patients.getInt("idPatient"));
              // }

              out.write("<h2>Hello, Dr." + doctorFirstName + "</h2><br>");
              out.write("<h3>Your Information:</h3><br>");

              out.write("<table border=\"1\">");

              out.write("<tr>");
                out.write("<th>Doctor ID</th>");
                out.write("<th>First Name</th>");
                out.write("<th>Last Name</th>");
                out.write("<th>Specialization</th>");
              out.write("<tr>");

              out.write("<tr>");
                out.write("<td>" + idDoctor + "</td>");
                out.write("<td>" + doctorFirstName + "</td>");
                out.write("<td>" + doctorLastName + "</td>");
                out.write("<td>" + specialization + "</td>");
              out.write("</tr>");

              out.write("</table>");

              out.write("<table border=\"1\">");

              out.write("<tr>");
                out.write("<th>Patient's First Name</th>");
                out.write("<th>Patient's Last Name</th>");
                out.write("<th>Patient's Medication</th>");
                out.write("<th>Patient's Medical History</th>");
              out.write("</tr>");

              ResultSet histories = null;
              ResultSet medicalHistory = null;

              while (patients.next()) {
                out.write("<tr>");
                out.write("<td>" + patients.getString("firstName") + "</td>");
                out.write("<td>" + patients.getString("lastName") + "</td>");
                out.write("<td>" + patients.getInt("idMedication") + "</td>");

                int patientId = patients.getInt("idPatient");

                // out.write("<td>" + patientId + "</td>");

                histories = stmt.executeQuery("SELECT idMedicalHistory " + 
                  "FROM `has a` " + 
                  "WHERE idPatient = '" + patientId + "'");
                while (histories.next()) {
                  out.write("<td>" + histories.getInt("idMedicalHistory") + "</td>");
                  histories.close();
                }


                // medicalHistory = stmt.executeQuery("SELECT * " + 
                //   "FROM `Medical History`"  + 
                //   "WHERE idHistory = '" + histories.getInt("idMedicalHistory") + "'");
                // medicalHistory.next();

                // out.write("<td>");
                // out.write("<ul>");
                // out.write("<li>Medications: " + medicalHistory.getString("medications") + "</li>");
                // out.write("<li>Symptoms: " + medicalHistory.getString("symptoms") + "</li>");
                // out.write("<li>Surgeries: " + medicalHistory.getString("surgeries") + "</li>");
                // out.write("</ul>");
                // out.write("</td>");

                // out.write("</tr>");

                // histories.close();
              }
              out.write("</table>");
              histories.close();
              // medicalHistory.close();
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