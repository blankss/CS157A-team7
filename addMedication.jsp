<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Add Medication</title>
    </head>
  <body>
    <h1>Add Medcation Login</h1>
    
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String passwordDB = "root";
        try {
            String manuf = request.getParameter("manuf");
            int quantity = Integer.parseInt(request.getParameter("quant"));
            double cost = Double.parseDouble(request.getParameter("cost"));
            int admin = Integer.parseInt(request.getParameter("idAdmin"));
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            Statement stmt1 = con.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * " +
              "FROM hospitaladministrators " + 
              "WHERE idAdmin = '" + admin + "' AND loggedin = 1");

            if (!rs.isBeforeFirst()) {
              out.write("<html><body><script>alert('Admin specified was not logged in')</script></body></html>");
              out.write("Login here: <a href='adminLogin.html'>Login</a>");
              return;
            }

            rs.next();
            
            int res = stmt1.executeUpdate("INSERT INTO Medication(medicationCost, quantity, manufacturer) VALUES('" + cost + "','" + quantity + "','" + manuf + "')");

            out.write("<h2>Successfully added.</h2>");

            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>