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
              out.print("<table>");
              out.print("<tr>");
              out.print("<td>" + rs.getString("idPatient") + "<td>");
              out.print("<td>" + rs.getString("firstName") + "<td>");
              out.print("<td>" + rs.getString("lastName") + "<td>");
              out.print("<td>" + rs.getString("phoneNumber") + "<td>");
              out.print("<td>" + rs.getString("dateOfBirth") + "<td>");
              out.print("<td>" + rs.getString("username") + "<td>");
              out.print("<td>" + rs.getString("password") + "<td>");
              out.print("<td>" + rs.getString("idDoctor") + "<td>");
              out.print("<td>" + rs.getString("idPlan") + "<td>");
              out.print("<td>" + rs.getString("idMedication") + "<td>");
              out.print("<td>" + rs.getString("idHistory") + "<td>");
              out.print("</tr>");
              out.print("</table>");
            }

            stmt.close();
            con.close();
          //}
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>
   

</html>
