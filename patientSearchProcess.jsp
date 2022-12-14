<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
    background-color: lightblue;
}
</style>
</head>
  <head>
    <title>Patient Search</title>
    </head>
  <body>
    <h1>Search Bar</h1>
    <body>
      
      <form id="form" method="post" action="patientSearchProcess.jsp" >
        <div class="form-group col-md-6">
            <label>Patient ID</label>
            <input type="text" name="patientID" idPatient="patientID" placeholder="Patient ID"></center>
            <input type="text" name="patientName" firstName="Patient Name" placeholder="Name"></center>
            <input type="submit">
        </div>
      </form>
    </body>

    <%
        String db = "hospibase";
        String user; // assumes database name is the same as username
        user = "root";
        String passwordDB = "root";
        try {
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            String patientID = request.getParameter("patientID");
            String patientName = request.getParameter("patientName");


               out.print("<h3>Patient Details</h3>");
            Statement stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM hospibase.Patient WHERE firstName = '" + patientName + "' OR idPatient = '" + patientID + "' xor (firstName = '" + patientName + "' AND idPatient = '" + patientID + "')");

            out.write("<table border=\"1\">");
              out.write("<tr>");
                out.write("<th>Patient ID</th>");
                out.write("<th>First Name</th>");
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
            
            // compares user input to id of patients
            pst = con.prepareStatement("SELECT * FROM hospibase.Patient WHERE firstName = ? OR idPatient = ? xor (firstName = ? AND idPatient = ? )");
            pst.setString(1, patientName);
            pst.setString(2, patientID);
            pst.setString(3, patientName);
            pst.setString(4, patientID);
            rs = pst.executeQuery();
            %>
              <style>
              table {
                width: 100%;
              }

              th, td {
                text-align: center;
                padding: 5px;
              }
              </style>
              <%
              
            while(rs.next())
           {
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
          //}
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>
   

</html>
