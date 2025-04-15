<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>*
<!DOCTYPE html>
<html>
    <script src="bootstrap/Chart.min.js"></script>
<link href="StylText.css" rel="stylesheet" type="text/css"/>
<style>
   #echel{
    width: 25Spx;
    height: 13px;
   }
   #overflowTest {        
    color: white;
    padding: 15px;
    width: 40%;
    height: 20%px;
    overflow: scroll;
    border: 1px solid #ccc;
    }
</style>
<body>
    <%@include file="navBar.jsp" %>
    <%@include file="RequetteTatitra.jsp" %>
    <%@include file="Securite_page.jsp" %>
    <p><h2><center>COURBE DE REPRESENTATION PAR ANS</center></h2></p>
<center>
    <p>
        <canvas id="echel" style="background-color: red"></canvas> <Samp>Revenu</Samp>
        <canvas id="echel" style="background-color: green"></canvas> <Samp>Dépense</Samp>
    </p>
    <div id="overflowTest">
        <div>
            <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
        </div>
    </div>
</center>
    <script>
    // anne scolaire
    const xValues = [
        <%
            rs1=st.executeQuery(Miditraisataona);
            while (rs1.next()){
                out.print(rs1.getString("taona")+", "); 
                }out.print("0");
        %>
    ];

    new Chart("myChart", {
    type: "line",
    data: {
            labels: xValues,
            datasets: [{ 
            data: [
                <%
                rs2=st.executeQuery(Miditraisataona);
                while (rs2.next()){
                    out.print(rs2.getString("totalmiditraparAns")+", "); 
                }out.print("0");
              %>
            ],
            borderColor: "red",
            fill: false
        }, 
        { 
            data: [
                <%
                rs=st.executeQuery(Mivoakaisataona);
                while (rs.next()){
                    out.print(rs.getString("totalmivoakaparAns")+", "); 
                }out.print("0");
              %>
            ],
            borderColor: "green",
            fill: false
        },
        
    ]
    },
    options: {
        legend: {display: false}
    }
    });
    </script>
</body>
