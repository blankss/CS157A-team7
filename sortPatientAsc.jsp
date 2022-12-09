<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>AllPatients</title>
    </head>
  <body>
    <h1>Patients Database View</h1>
    <%@ include file="patientSearch.html" %>
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "root";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, password);
            
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM hospibase.Patient ORDER BY firstName");
            out.write("<table border=\"1\">");

            out.write("<tr>");
              out.write("<th>Patient ID</a></th>");
              out.write("<th><a href='sortPatientDesc.jsp'>First Name</a></th>");
              out.write("<th>Last Name</th>");
              out.write("<th>Phone Number</th>");
              out.write("<th>Date of Birth</th>");
              out.write("<th>Username</th>");
              out.write("<th>Password</th>");
              out.write("<th>Doctor</th>");
              out.write("<th>Health Plan</th>");
              out.write("<th>Medication</th>");
              out.write("<th>Medical History</th>");
            out.write("<tr>");

            while (rs.next()) {
                int id = rs.getInt(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String phoneNumber = rs.getString(4);
                String dateOfBirth = rs.getString(5);
                String username = rs.getString(6);
                String userPassword = rs.getString(7);
                String doctor = rs.getString(8);
                String healthPlan = rs.getString(9);
                String medication = rs.getString(10);
                String medicalHistory = rs.getString(11);

                out.write("<tr>");
                  out.write("<td>" + id + "</a></td>");
                  out.write("<td>" + firstName + "</td>");
                  out.write("<td>" + lastName + "</td>");
                  out.write("<td>" + phoneNumber + "</td>");
                  out.write("<td>" + dateOfBirth + "</td>");
                  out.write("<td>" + username + "</td>");
                  out.write("<td>" + userPassword + "</td>");
                  out.write("<td>" + doctor + "</td>");
                  out.write("<td>" + healthPlan + "</td>");
                  out.write("<td>" + medication + "</td>");
                  out.write("<td>" + medicalHistory + "</td>");
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
