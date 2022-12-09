<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<html>
<head>
<style>
body {
    background-image: url("patientPay.jpg");
    background-size: cover;
    background-size: 100% 100%;
    background-repeat: no-repeat;
}
</style>
</head>
  <head>
    <title>Patient Payment</title>
    </head>
  <body>
    <h1>Patient Payment Form</h1>
    
    <% 

        String db = "hospibase";
        String user; // assumes database name is the same as username
        user = "root";
        String passwordDB = "root";
        class PatientBill
        {
          int idBill;
          int medicationCost;
          int roomCost;
          double total;

          public PatientBill(int idBill, int medicationCost, int roomCost, double total)
          {
            this.idBill = idBill;
            this.medicationCost = medicationCost;
            this.roomCost = roomCost;
            this.total = total;
          }

          public int getIdBill()
          {
            return idBill;
          }

          public int getMedicationCost()
          {
            return medicationCost;
          }

          public int getRoomCost()
          {
            return roomCost;
          }

          public double getTotal()
          {
            return total;
          }

          public void setMedicationCost(int medicationCost)
          {
            this.medicationCost = medicationCost;
          }

          public void setRoomCost(int roomCost)
          {
            this.roomCost = roomCost;
          }

          public void setTotal(double total)
          {
            this.total = total;
          }

          public String toString()
          {
            return "Patient Bill: " + idBill + " Medication Cost: " + medicationCost + " Room Cost: " + roomCost + " Total: " + total;
          }
        } 
  
        try {
            String patientIdParam = request.getParameter("patientId");
            String amountParam = request.getParameter("amount");
            //String fromInsurance = request.getParameter("fromInsurance");
            
            if (patientIdParam == null || amountParam == null)
            {
              out.write("<html><body><script>alert('Patient Not Found')</script></body></html>");
              out.write("Patient Not Found, please try again: <a href='patientPayment.html'>Payment</a>");
              return;
            }
            

            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospibase", user, passwordDB);
            Statement stmt = con.createStatement();
            
            //redirect to patient registration HTML form again if username is not found
            ResultSet exists = stmt.executeQuery("SELECT EXISTS(SELECT * FROM Patient " +
              "WHERE idPatient = " + patientIdParam + ");");
            boolean res = exists.next();
            if (res == false) {
              out.write("<html><body><script>alert('Patient Not Found')</script></body></html>");
              out.write("Patient Not Found, please try again: <a href='patientPayment.html'>Payment</a>");
              return;
            }

            //display patient bills
            ResultSet rs = stmt.executeQuery("SELECT * FROM hospibase.PatientBill WHERE idPatient = " + patientIdParam + ";");

              %>
              <style>
              table {
                width: 100%;
              }

              th, td {
                text-align: center;
                padding: 5px;
              }

              td:nth-child(odd){
                background-color: #CACEF9;
              }
              </style>
              <%
            out.write("<table border=\"1\" bgcolor=\"#939CF9\">");
            out.write("<tr>");
            out.write("<th>idBill</th>");
            out.write("<th>medicationCost</th>");
            out.write("<th>roomCost</th>");
            out.write("<th>Amount Owed</th>");
            out.write("<tr>");

            ArrayList<PatientBill> bills = new ArrayList<PatientBill>();

            while (rs.next()) {
                int id = rs.getInt(1);
                int medicationCost = rs.getInt(2);
                int roomCost = rs.getInt(3);
                int total = rs.getInt(4);
                PatientBill bill = new PatientBill(id, medicationCost, roomCost, total);
                bills.add(bill);
                //out.write(bill.toString());
                out.write("<tr>");
                  out.write("<td>" + id + "</td>");
                  out.write("<td>" + medicationCost + "</td>");
                  out.write("<td>" + roomCost + "</td>");
                  out.write("<td>" + total + "</td>");
                out.write("</tr>");
            }

            //update each bill
            double amount = Double.valueOf(amountParam);
            for (int i = 0; i < bills.size(); i++) {
              PatientBill bill = bills.get(i);
              amount = amount - bill.getTotal();
              bill.setTotal(Math.max(0, -amount));
              int updateCheck = stmt.executeUpdate("UPDATE hospibase.PatientBill " + 
              "SET total = " + bill.getTotal() + " WHERE idBill = " + bill.getIdBill() + ";");
              if (amount < 0) {
                break;
              }
            }
          
            //display patient bills
            rs = stmt.executeQuery("SELECT * FROM hospibase.PatientBill WHERE idPatient = " + patientIdParam + ";");
            out.write("</table>");
            out.write("<br>");
            out.write("<table border=\"1\" bgcolor=\"#939CF9\">");

            out.write("<tr>");
            out.write("<th>idBill</th>");
            out.write("<th>medicationCost</th>");
            out.write("<th>roomCost</th>");
            out.write("<th>New Amount Owed</th>");
            out.write("<tr>");

            bills = new ArrayList<PatientBill>();

            while (rs.next()) {
                int id = rs.getInt(1);
                int medicationCost = rs.getInt(2);
                int roomCost = rs.getInt(3);
                int total = rs.getInt(4);
                PatientBill bill = new PatientBill(id, medicationCost, roomCost, total);
                bills.add(bill);

                out.write("<tr>");
                  out.write("<td>" + id + "</td>");
                  out.write("<td>" + medicationCost + "</td>");
                  out.write("<td>" + roomCost + "</td>");
                  out.write("<td>" + total + "</td>");
                out.write("</tr>");
            }


            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
