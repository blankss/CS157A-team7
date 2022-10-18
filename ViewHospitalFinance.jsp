<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>HospitalFinance</title>
    </head>
  <body>
    <h1>HospitalFinance Database View</h1>
    
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
            
            out.println("Initial entries in table \"HospitalFinance\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM hospibase.HospitalFinance");
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
                int transaction = rs.getInt(1);
                int patient_id = rs.getInt(2);
                double patient_income = rs.getDouble(2);
                int equipment_id = rs.getInt(3);
                double equipment_expenditure = rs.getDouble(4);
                double maintenance_expenditure = rs.getDouble(5);
                double staff_expenditure = rs.getDouble(6);
                double government_income = rs.getDouble(7);
                double balance = rs.getDouble(8);

                out.write("<tr>");
                  out.write("<td>" + transaction + "</td>");
                  out.write("<td>" + patient_id + "</td>");
                  out.write("<td>" + patient_income + "</td>");
                  out.write("<td>" + equipment_id + "</td>");
                  out.write("<td>" + equipment_expenditure + "</td>");
                  out.write("<td>" + maintenance_expenditure + "</td>");
                  out.write("<td>" + staff_expenditure + "</td>");
                  out.write("<td>" + government_income + "</td>");
                  out.write("<td>" + balance + "</td>");
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
