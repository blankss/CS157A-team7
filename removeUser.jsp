<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<html>
  <head>
    <title>Remove User</title>
    </head>
  <body>
    <h1>Remove User</h1>
    
    <% 

        String db = "hospibase";
        String user; // assumes database name is the same as username
        user = "root";
        String passwordDB = "root";
  
        try {
            String userIdParam = request.getParameter("userId");
            String userTypeParam = request.getParameter("userType");
            //String fromInsurance = request.getParameter("fromInsurance");
            
            if (userIdParam == null || userTypeParam == null)
            {
              out.write("<html><body><script>alert('User not selected')</script></body></html>");
              out.write("User Not Selected, please try again: <a href='removeUser.html'>RemoveUser</a>");
              return;
            }
            

            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            String userType = "";
            if (userTypeParam.equals("Admin"))
            {
              userType = "hospitaladministrators";
            }
            else
            {
              userType = "Patient";
            }

            String query = "DELETE FROM " + userType + " WHERE id" + userTypeParam + " = " + userIdParam + ";";
            out.write(query);
            int deleteCheck = stmt.executeUpdate(query);

            if (deleteCheck == 1)
            {
              out.write("<html><body><script>alert('Success! User Deleted')</script></body></html>");
              out.write("User Deleted, success!: <html><body><script>window.location.href='removeUser.html'</script></body></html>");
            }
            else
            {
              out.write("<html><body><script>alert('User Not Found or Not Deleted')</script></body></html>");
              out.write("User Not Found or Not Deleted: <html><body><script>window.location.href='removeUser.html'</script></body></html>");
            }

            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
