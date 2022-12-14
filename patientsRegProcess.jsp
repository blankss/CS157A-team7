<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Patient Registration</title>
    </head>
  <body>
    <h1>Registration Form</h1>
    
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
          user = "root";
        String passwordDB = "root";
        try {
            String firstNameParam = request.getParameter("firstName");
            String lastNameParam = request.getParameter("lastName");
            String usernameParam = request.getParameter("username");
            String passwordParam = request.getParameter("password");
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            //redirect to patient registration HTML form again if username exists already
            ResultSet setUsernameEmpty = stmt.executeQuery("SELECT username " +
              "FROM Patient " +
              "WHERE username = '" + usernameParam + "'");
            if (setUsernameEmpty.isBeforeFirst()) {
              out.write("<html><body><script>alert('Username Taken Already')</script></body></html>");
              out.write("Username Taken, please register again: <a href='patientReg.html'>Register</a>");
              return;
            }
            setUsernameEmpty.close();
            //automatically assign to doctor that has the least number of patients
            ResultSet setDoctor = stmt.executeQuery("SELECT idDoctor" +
              " FROM Patient" + 
              " GROUP BY idDoctor" +
              " HAVING COUNT(idDoctor) <= ALL(" +
                "SELECT COUNT(idDoctor)" + 
                " FROM Patient" + 
                " GROUP BY idDoctor)");
            setDoctor.next();
            // we get the doctor id that was least used
            int doctorID = setDoctor.getInt("idDoctor");

            //int doctorID = setDoctor.getInt("doctorID");
            //don't forget that VALUES you need single quotes to denote variable name
            int res = stmt.executeUpdate("INSERT INTO Patient(firstName,lastName,username,password, idDoctor) VALUES('" + firstNameParam + "','" + lastNameParam + "','" + usernameParam + "','" + passwordParam + "','" + doctorID + "')");
            out.println("Successful registration, please login at: <a href='patientLogin.html'>Login</a>");
            setDoctor.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>