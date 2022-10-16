<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>AllDoctors</title>
    </head>
  <body>
    <h1>Doctors Database View</h1>
    
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "root";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            out.println("Initial entries in table \"Doctors\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM hospibase.Doctors");
            out.write("<table border=\"1\">");

            out.write("<tr>");
              out.write("<th>Doctor ID</th>");
              out.write("<th>First Name</th>");
              out.write("<th>Last Name</th>");
              out.write("<th>Patient ID's</th>");
              out.write("<th>Salary</th>");
            out.write("<tr>");

            while (rs.next()) {
                int id = rs.getInt(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String patientId = rs.getString(4);
                double salary = rs.getDouble(5);

                out.write("<tr>");
                  out.write("<td>" + id + "</td>");
                  out.write("<td>" + firstName + "</td>");
                  out.write("<td>" + lastName + "</td>");
                  out.write("<td>" + patientId + "</td>");
                  out.write("<td>" + salary + "</td>");
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
