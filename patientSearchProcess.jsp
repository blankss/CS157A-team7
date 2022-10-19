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


            if (patientID == null || patientID.isEmpty())
            {
              pst = con.prepareStatement("SELECT * FROM Patients");
              rs = pst.executeQuery();

              while(rs.next())
              {
                out.print("<Table>");
                out.print("<TR>");
                out.print("<TD>" + rs.getString("patientID") + "<TD>");
                out.print("<TD>" + rs.getString("firstName") + "<TD>");
                out.print("<TD>" + rs.getString("lastName") + "<TD>");
                out.print("<TD>" + rs.getString("medicalHistory") + "<TD>");
                out.print("<TD>" + rs.getString("prescriptions") + "<TD>");
                out.print("<TD>" + rs.getString("doctorID") + "<TD>");
                out.print("<TD>" + rs.getString("roomNumber") + "<TD>");
                out.print("<TD>" + rs.getString("insurance") + "<TD>");
                out.print("<TD>" + rs.getString("hospitalFee") + "<TD>");
                out.print("</TR>");
                out.print("</Table>");
              }

            }
            

            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>
  </body>
</html>
