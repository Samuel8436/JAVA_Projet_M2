<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>*
<%@include file="navBar.jsp" %>
<%@include file="RequetteTatitra.jsp" %>
<%@include file="Securite_page.jsp" %>
<link href="StylText.css" rel="stylesheet" type="text/css"/>
<p><h2><center>REVENU PAR ANS</center></h2></p>
<div>
    <canvas id="myChart" width="3"></canvas>
  </div>
  
  <script src="chart.js"></script>
  
  <script>
    const ctx = document.getElementById('myChart');
  
    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: [
            <%
                rs1=st.executeQuery(Miditraisataona);
                while (rs1.next()){
                    out.print(rs1.getString("taona")+", "); 
                    }out.print("0");
            %>
        ],
        datasets: [{
          label: 'Revenu',
          data: [
              <%
                rs2=st.executeQuery(Miditraisataona);
                while (rs2.next()){
                    out.print(rs2.getString("totalmiditraparAns")+", "); 
                }out.print("0");
              %>
          ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  </script><br>
                            