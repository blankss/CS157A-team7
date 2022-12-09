<%@ page import="java.sql.*"%>
<html>
<head>
<style>
body {
    background-image: url("adminLogin.jpg");
    background-size: cover;
    background-size: 100% 100%;
    background-repeat: no-repeat;
}
</style>
</head>
  <head>
    <title>Admin Login</title>
    </head>
  <body>
    <h1>Admin Login</h1>
    
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String passwordDB = "root";
        try {
            String usernameParam = request.getParameter("username");
            String passwordParam = request.getParameter("password");
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            Statement stmt1 = con.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * " +
              "FROM hospitaladministrators " + 
              "WHERE username = '" + usernameParam + "' AND password = '" + passwordParam + "'");

            if (!rs.isBeforeFirst()) {
              out.write("<html><body><script>alert('Username/Password incorrect')</script></body></html>");
              out.write("Username/Password incorrect, please try again: <a href='adminLogin.html'>Login</a>");
              return;
            }

            rs.next();
            if (rs.getString("username").equals(usernameParam) && rs.getString("password").equals(passwordParam)) {

              int res = stmt1.executeUpdate("UPDATE hospitaladministrators SET loggedin = 1 WHERE idAdmin = '" + rs.getInt("idAdmin") + "'");

              out.write("<h3>Admin logged in instance success. </h3>");
              out.write("Please choose an administrative action to do below.");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('updateAdmin.html') value='Update Admin Information'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('adminRegister.html') value='Register Additional Admin'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('patientSearchProcess.jsp') value='Search For Patient File'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('searchDoctor.jsp') value='Search For Doctor'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('patientFilter.jsp') value='Filter For Patient File'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('addMedication.html') value='Add Medication to Inventory'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('addRoom.html') value='Add Hospital Rooms'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('addEquipment.html') value='Add Equipment to Inventory'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('updatePatient.html') value='Update Patient Page'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('ViewMedicalHistory.jsp') value='View Medical History'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('ViewHealthplans.jsp') value='View Available Health plans'>");
              out.write("<br>");
              out.write("<br>");
              out.write("<input type=button onClick=parent.open('removeUser.html') value='Remove A User'>");
              out.write("<br>");
              out.write("<br>");
            %>
            <button onclick="window.location.href=('landingPage.html')"> Logout to Landing Page</button>
            <%
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