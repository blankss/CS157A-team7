<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>UpdatePatientInfo</title>
    </head>
  <body>
    <h1>Patient Database View</h1>
    
    <% 
     String db = "hospibase";
        String user; // assumes database name is the same as username
        user = "root";
        String password = "root";
        try {
          String idPatient = request.getParameter("idPatient");
          if(idPatient == "" || idPatient == null)
          {
            String redirectURL = "/updatePatient.html";
            response.sendRedirect(redirectURL);
          }
          String firstNameParam = request.getParameter("firstName") == "" ? null : request.getParameter("firstName");
          String lastNameParam = request.getParameter("lastName") == "" ? null : request.getParameter("lastName");
          String phoneNumberParam = request.getParameter("phoneNumber") == "" ? null : request.getParameter("phoneNumber");
          String dateOfBirthParam = request.getParameter("dateOfBirth") == "" ? null : request.getParameter("dateOfBirth");
          String usernameParam = request.getParameter("username") == "" ? null : request.getParameter("username");
          String passwordParam = request.getParameter("password") == "" ? null : request.getParameter("password");
          String idDoctor = request.getParameter("idDoctor") == "" ? null : request.getParameter("idDoctor");
          String idPlan = request.getParameter("idPlan") == "" ? null : request.getParameter("idPlan");
          String idMedication = request.getParameter("idMedication") == "" ? null : request.getParameter("idMedication");
          String idHistory = request.getParameter("idHistory") == "" ? null : request.getParameter("idHistory");

          java.sql.Connection con; 
          Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, password);
          if ((phoneNumberParam != null && phoneNumberParam.length() > 10) || (dateOfBirthParam != null && !dateOfBirthParam.matches("^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$")))
          {
              out.write("<html><body><script>alert('Recheck phone number or date of birth format')</script></body></html>");
              out.write("Incorrect format, please try again:<html><body><script>window.location.href = '/updatePatient.html';</script></body></html>");
          }

          out.println("Updating \"Patients\": <br/>");
          Statement stmt = con.createStatement();
          String query = "UPDATE hospibase.Patient " + 
          "SET firstName=COALESCE('"+firstNameParam+
          "',firstName), lastName=COALESCE('"+lastNameParam+
          "',lastName), phoneNumber=COALESCE('"+phoneNumberParam+ 
          "',phoneNumber), dateOfBirth=COALESCE('"+dateOfBirthParam+
          "',dateOfBirth), username=COALESCE('"+usernameParam+
          "',username), password=COALESCE('"+passwordParam+
          "',password), idDoctor=COALESCE("+idDoctor+
          ",idDoctor), idPlan=COALESCE("+idPlan+
          ",idPlan), idMedication=COALESCE("+idMedication+
          ",idMedication), idHistory=COALESCE("+idHistory+
          ", idHistory) WHERE idPatient="+idPatient+";";
          out.write(String.valueOf(query)); 
          int status = stmt.executeUpdate(query);
          
          String redirectURL = "/ViewPatients.jsp";
          if (status == 0) {
            out.println("Update failed, check your input");
            redirectURL = "/updatePatient.html";
          }
          else {
            out.println("Patient updated successfully!");
          }
          stmt.close();
          con.close();
          response.sendRedirect(redirectURL);
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
