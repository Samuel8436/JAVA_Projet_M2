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