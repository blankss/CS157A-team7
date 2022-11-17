<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Patient Search</title>
    </head>
  <body>
    <h1>Search Bar</h1>

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
            

               out.print("<h3>Patient Details</h3>");
            Statement stmt = con.createStatement();

            // shows entire table
            /*if (patientID == null || patientID.isEmpty() )
            {
              pst = con.prepareStatement("SELECT * FROM hospibase.Patient");
              rs = pst.executeQuery();

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
                out.print("<td>" + rs.getString("idPatientDoctor") + "<td>");
                out.print("<td>" + rs.getString("idPlan") + "<td>");
                out.print("<td>" + rs.getString("idMedication") + "<td>");
                out.print("<td>" + rs.getString("idHistory") + "<td>");

                out.print("</tr>");
                out.print("</table>");
              }

            }
            else {*/
                // compares user input to id of patients
                pst = con.prepareStatement("SELECT * FROM hospibase.Patient WHERE idPatient = ?");
                pst.setString(1, patientID);
                rs = pst.executeQuery();
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
                      out.print("<td>" + rs.getString("idPatientDoctor") + "<td>");
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
