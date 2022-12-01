<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Patient Search</title>
    </head>
  <body>
    <h1>Search Bar</h1>
    <%@ include file="patientSearch.html" %>
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
            pst = con.prepareStatement("SELECT * FROM hospibase.Patients WHERE firstName = ? OR idPatient = ? xor (firstName = ? AND idPatient = ? )");
            pst.setString(1, patientName);
            pst.setString(2, patientID);
            pst.setString(3, patientName);
            pst.setString(4, patientID);
            rs = pst.executeQuery();
            while(rs.next())
           {
              out.print("<table border=\"1\">");
              out.print("<tr>");
              out.print("<td>"+rs.getString("idPatient")+"<td>");
              out.print("<td>"+rs.getString("firstName")+"<td>");
              out.print("<td>"+rs.getString("lastName")+"<td>");
              out.print("<td>"+rs.getString("phoneNumber")+"<td>");
              out.print("<td>"+rs.getString("dateOfBirth")+"<td>");
              out.print("<td>"+rs.getString("username")+"<td>");
              out.print("<td>"+rs.getString("password")+"<td>");
              out.print("<td>"+rs.getString("idDoctor")+"<td>");
              out.print("<td>"+rs.getString("idPlan")+"<td>");
              out.print("<td>"+rs.getString("idMedication")+"<td>");
              out.print("<td>"+rs.getString("idHistory")+"<td>");
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
