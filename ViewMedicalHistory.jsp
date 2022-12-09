<%@ page import="java.sql.*"%>
<html>
<head>
<style>
body {
  background-image: url("doctorLoggedin.jpg");
  background-size: cover;
  background-size: 100% 100%;
  background-repeat: no-repeat;
}
</style>
</head>
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
            
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM hospibase.`Medical History`");
            out.write("<table border=\"1\">");

            out.write("<tr>");
                out.write("<th>patient_id</th>");
                out.write("<th>symptoms</th>");
                out.write("<th>surgeries</th>");
                out.write("<th>medications</th>");
            out.write("<tr>");

            %>
              <style>
              table {
                width: 100%;
              }

              th, td {
                text-align: center;
                padding: 5px;
              }

              tr:nth-child(even) {
                background-color: aliceblue;
            }
              tr:nth-child(odd) {
                background-color: lightblue;
              }
              </style>
              <%
            while (rs.next()) {
                int patient_id = rs.getInt(1);
                String symptoms = rs.getString(2);
                String surgeries = rs.getString(3);
                String medications = rs.getString(4);

                out.write("<tr>");
                  out.write("<td>" + patient_id + "</td>");
                  out.write("<td>" + symptoms + "</td>");
                  out.write("<td>" + surgeries + "</td>");
                  out.write("<td>" + medications + "</td>");
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
