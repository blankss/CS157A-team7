<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Doctor Search</title>
    </head>
  <body>
    <h1>Doctor Search</h1>
    <%@ include file="searchDoctor.html" %>
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
            String doctorName = request.getParameter("doctorName");


               out.print("<h3>Doctor Details</h3>");
            Statement stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM hospibase.Doctor WHERE firstName = '" + doctorName + "' OR idDoctor = '" + doctorID + "' xor (firstName = '" + doctorName + "' AND idDoctor = '" + doctorID + "')");


            out.write("<table border=\"1\">");
              out.write("<tr>");
                out.write("<th>Doctor ID</th>");
                out.write("<th>First Name</th>");
                out.write("<th>Last Name</th>");
                out.write("<th>Specialization</th>");
                out.write("<th>Username</th>");
                out.write("<th>Password</th>");
              out.write("<tr>");

            while(rs.next())
           {
            int id = rs.getInt(1);
            String firstName = rs.getString(2);
            String lastName = rs.getString(3);
            String specialization = rs.getString(4);
            String username = rs.getString(5);
            String userPassword = rs.getString(6);
            
            out.write("<tr>");
              out.write("<td>" + id + "</a></td>");
              out.write("<td>" + firstName + "</td>");
              out.write("<td>" + lastName + "</td>");
              out.write("<td>" + specialization + "</td>");
              out.write("<td>" + username + "</td>");
              out.write("<td>" + userPassword + "</td>");
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
