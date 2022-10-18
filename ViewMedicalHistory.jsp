<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>MedicalHistories</title>
    </head>
  <body>
    <h1>MedicalHistory Database View</h1>
    
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
            
            out.println("Initial entries in table \"MedicalHistory\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM hospibase.MedicalHistory");
            out.write("<table border=\"1\">");

            out.write("<tr>");
                out.write("<th>patient_id</th>");
                out.write("<th>allergies</th>");
                out.write("<th>surgeries</th>");
                out.write("<th>family_history</th>");
                out.write("<th>medications</th>");
                out.write("<th>illnesses</th>");
            out.write("<tr>");

            while (rs.next()) {
                int patient_id = rs.getInt(1);
                String allergies = rs.getString(2);
                String surgeries = rs.getString(3);
                String family_history = rs.getString(4);
                String medications = rs.getString(5);
                String illnesses = rs.getString(6);

                out.write("<tr>");
                  out.write("<td>" + patient_id + "</td>");
                  out.write("<td>" + allergies + "</td>");
                  out.write("<td>" + surgeries + "</td>");
                  out.write("<td>" + family_history + "</td>");
                  out.write("<td>" + medications + "</td>");
                  out.write("<td>" + illnesses + "</td>");
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
