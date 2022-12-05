<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Equipment Adding</title>
    </head>
  <body>
    <h1>Add Equipment</h1>
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String passwordDB = "root";
        try {
            String quantityParam = request.getParameter("quantity");
            String conditionParam = request.getParameter("equipCondition");
            String adminIDParam = request.getParameter("idAdmin");
            //String equipmentID;
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            //Statement stmt1 = con.createStatement();

            if (quantityParam.isEmpty() || conditionParam.isEmpty() || adminIDParam.isEmpty()) {
                out.write("Empty or Invalid Input. Please try again: <a href='addEquipment.html'>Add Equipment</a>");
                return;
            }


            // auto-increment still increments even for an unsuccessful attempt so increment based on the
            // max in the table
            int res = stmt.executeUpdate("INSERT INTO Equipment (idequipment, quantity, equipCondition, idadmin)"+ 
            "SELECT MAX(idequipment) + 1,'"+quantityParam+"','"+conditionParam +"','"+adminIDParam+"' FROM  Equipment");

            
            
            out.write("Add equipment successfully");
            out.write("<br>");
            out.write("<br>");
            out.write("<input type=button value='Back' onClick=history.back()>");



            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
