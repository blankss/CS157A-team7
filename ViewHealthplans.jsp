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
            ResultSet rs = stmt.executeQuery("SELECT * FROM hospibase.Healthplans");
            out.write("<table border=\"1\">");

            out.write("<tr>");
                out.write("<th>patient_id</th>");
                out.write("<th>insurance</th>");
                out.write("<th>deductible</th>");
                out.write("<th>allowable cost</th>");
            out.write("<tr>");

            while (rs.next()) {
                int patient_id = rs.getInt(1);
                String insurance = rs.getString(2);
                double deductible = rs.getDouble(3);
                double allowable_cost = rs.getDouble(4);

                out.write("<tr>");
                  out.write("<td>" + patient_id + "</td>");
                  out.write("<td>" + insurance + "</td>");
                  out.write("<td>" + deductible + "</td>");
                  out.write("<td>" + allowable_cost + "</td>");
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
