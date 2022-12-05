<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Patient Filter</title>
    </head>
  <body>
    <h1>Filter by</h1>
    <%@ include file="patientFilter.html" %>
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
            String doctorID = request.getParameter("doctorID");
            

               out.print("<h3>Patient Details</h3>");
            Statement stmt = con.createStatement();

           
                // compares user input to id of patients
                pst = con.prepareStatement("SELECT * FROM hospibase.Patients WHERE idDoctor = ?");
                pst.setString(1, doctorID);
                rs = pst.executeQuery();
                 while(rs.next())
                 {
                    out.print("<table style = 'border: 1px solid black; table-layout: fixed; width: 1100px; margin: 20px; padding-left: 10px'>");
                    out.print("<tr >");
                      out.print("<td >" + rs.getString("idPatient") + "<td>");
                      out.print("<td >" + rs.getString("firstName") + "<td>");
                      out.print("<td>" + rs.getString("lastName") + "<td>");
                      out.print("<td>" + rs.getString("phoneNumber") + "<td>");
                      out.print("<td style = 'width: 140px'>" + rs.getString("dateOfBirth") + "<td>");
                      out.print("<td>" + rs.getString("username") + "<td>");
                      out.print("<td>" + rs.getString("password") + "<td>");
                      out.print("<td>" + rs.getString("idDoctor") + "<td>");
                      out.print("<td>" + rs.getString("idPlan") + "<td>");
                      out.print("<td>" + rs.getString("idMedication") + "<td>");
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
