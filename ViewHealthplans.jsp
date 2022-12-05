<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Healthplans</title>
    </head>
  <body>
    <h1>Healthplans Database View</h1>
    
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
            
            out.println("Initial entries in table \"Healthplans\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM hospibase.`Health Plan`");
            out.write("<table border=\"1\">");

            out.write("<tr>");
                out.write("<th>idPlan</th>");
                out.write("<th>planname</th>");
                out.write("<th>planCost</th>");
            out.write("<tr>");

            while (rs.next()) {
                int idPlan = rs.getInt(1);
                String planname = rs.getString(2);
                double planCost = rs.getDouble(3);

                out.write("<tr>");
                  out.write("<td>" + idPlan + "</td>");
                  out.write("<td>" + planname + "</td>");
                  out.write("<td>" + planCost + "</td>");
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
