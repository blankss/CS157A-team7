<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Patient Filter</title>
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
            String doctorID = request.getParameter("doctorID");
            

               out.print("<h3>Patient Details</h3>");
            Statement stmt = con.createStatement();

            // shows entire table
            /*if (doctorID == null || doctorID.isEmpty() )
            {
              pst = con.prepareStatement("SELECT * FROM hospibase.Patient");
              rs = pst.executeQuery();

              while(rs.next())
              {
                out.print("<table>");
                out.print("<tr>");
                out.print("<td:nth-child(even) {background-color: #D6EEEE;}>" + rs.getString("idPatient") + "<td>");
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
                pst = con.prepareStatement("SELECT * FROM hospibase.Patient WHERE idPatientDoctor = ?");
                pst.setString(1, doctorID);
                rs = pst.executeQuery();
                 while(rs.next())
                 {
                   out.print("<table>");
                    out.print("<tr>");
                      out.print("<td background-color: #D6EEEE>" + rs.getString("idPatient") + "<td>");
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
