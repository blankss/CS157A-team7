<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Room Adding</title>
    </head>
  <body>
    <h1>Add Room</h1>
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String passwordDB = "root";
        try {
            String roomCostParam = request.getParameter("roomCost");
            String roomConditionParam = request.getParameter("roomCondition");
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            
            // if either cost or room condition aren't inputted
            if (roomCostParam.isEmpty() || roomConditionParam.isEmpty()) {
                out.write("Empty or Invalid Input. Please try again: <a href='addRoom.html'>Add Room</a>");
                return;
            }
            // auto-increment still increments even for an unsuccessful attempt so increment based on the
            // max in the table
            int res = stmt.executeUpdate("INSERT INTO HospitalRooms (roomNumber, roomCost, roomCondition)"+ 
            "SELECT MAX(roomNumber) + 1,'"+roomCostParam+"','"+roomConditionParam +"' FROM  HospitalRooms");
            
            out.println("Room added successfully. To add another room or go back click <a href='addRoom.html'>here</a>");
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>