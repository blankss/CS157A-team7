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

            int res = stmt.executeUpdate("INSERT INTO equipment(quantity,equipCondition,idAdmin)" +
            "VALUES('"+quantityParam+"','"+conditionParam +"','"+adminidParam+"')");

            if (quantityParam.isEmpty() || conditionParam.isEmpty() || adminidParam.isEmpty()) {
                out.write("<html><body><script>alert('Invalid Field Value')</script></body></html>");
                out.write("Empty or Invalid Input. Please try again: <a href='addEquipment.html'>Add Equipment</a>");
                return;
            }
            
            out.println("Add equipment successfully");


            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
