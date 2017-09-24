<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ibm.dao.*" %>
<% response.setIntHeader("REFRESH",30); %>
<!DOCTYPE HTML>



<form action="waypoints.jsp" method="post">
<tr><input type="submit" name="Route" value="Get Route"></tr>

</form>

    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
      #panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
    </style>
    
		<!-- Main -->
			<div id="main">

				<!-- Section -->
					<section class="wrapper">
						<div class="inner">
							<header class="align-center">
							  <h1>Route</h1>
</header>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBULpEsxdpuwi1TABZC9I7GGqRdpT1KCTs&callback=initMap"></script>
    <script>
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;

function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var chicago = new google.maps.LatLng(21.0000, 78.0000);
  var mapOptions = {
    zoom: 6,
    center: chicago
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  directionsDisplay.setMap(map);
  calcRoute();
}

function calcRoute() {

  var start = document.getElementById('start').value;
  var end = document.getElementById('end').value;
  var waypoint=document.getElementById('waypoints').value;
  
  var waypts = [];
  var checkboxArray = document.getElementById('waypoints');
  
 
      waypts.push({
          location:waypoint,
          stopover:true});
  

  var request = {
      origin: start,
      destination: end,
      waypoints: waypts,
      optimizeWaypoints: true,
      travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
      var route = response.routes[0];
      var summaryPanel = document.getElementById('directions_panel');
      summaryPanel.innerHTML = '';
      // For each route, display summary information.
      for (var i = 0; i < route.legs.length; i++) {
        var routeSegment = i + 1;
        summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment + '</b><br>';
        summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
        summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
        summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
      }
    }
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body style="background-color:#;">
    <div id="map-canvas" style="float:left;width:70%;height:100%;"></div>
    <div id="control_panel" style="float:right;width:30%;text-align:left;padding-top:20px; background-color:#D3D3D3;">
    <div style="margin:20px;border-width:2px;">
	<h1>State Road Transport Corporation</h1>
    <b>Bus Service Number</b>
    <%
         Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cab","root","dina"); 
	
          Statement st=con.createStatement();	
	 Statement st1=con.createStatement();
     
        
        ResultSet rs=st.executeQuery("select * from businfo");
        
        out.println("<form method='post' action='waypointjsp.jsp'>");
        out.println("<table border='0'><tr><td>");
        out.println("<select name='busservice'>");
        while(rs.next())
        {
        out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
        }
        out.println("</select></td><td>");
        out.println("<input type='submit' value='view'>");
        out.println("</td></tr></table>");
        out.println("</form>");
        String BUSSERVICE=request.getParameter("BUSSERVICE");
        ResultSet rs1=st1.executeQuery("select * from businfo where BUSSERVICE='"+BUSSERVICE+"'");
        //out.println("<form method='post' action='UpdateData'>");
        out.println("<table border='0'>");
        while(rs1.next())
        {
        
        out.println("<tr><td><b>BUSSERVICE</td><td>"+rs1.getString(1)+"<input type='hidden' name='service' value='"+rs1.getString(1)+"'/></td></tr>");
        out.println("<tr><td><b>SEQ</td><td>"+rs1.getString(2)+"</td></tr>");
        out.println("<tr><td><b>STATION</td><td>"+rs1.getString(3)+"<input type='hidden'  name='station' value='"+rs1.getString(3)+"'></td></tr>");
        out.println("<tr><td><b>LATITUDE</td><td>"+rs1.getString(4)+"<input type='hidden' name='lati' value='"+rs1.getString(4)+"'></td></tr>");
        out.println("<tr><td><b>LONGITUDE</td><td>"+rs1.getString(5)+"<input type='hidden' name='longi' value='"+rs1.getString(5)+"'></td></tr>");
        out.println("<tr><td><b>CURRENT LOCATION</td><td>"+rs1.getString(6)+"<input type='hidden'  name='curl' value='"+rs1.getString(6)+"'></td></tr>");
        out.println("<tr><td><b>DESTINATION</td><td>"+rs1.getString(7)+"<input type='hidden'  name='des' value='"+rs1.getString(7)+"'></td></tr>");
        
        session.setAttribute("bus",rs1.getString(1));
        session.setAttribute("start",rs1.getString(3));
        session.setAttribute("end",rs1.getString(7));
        session.setAttribute("waypoints",rs1.getString(6));
        
        }
        out.println("</table><br>");
        
        if(session.getAttribute("bus")!=null)
        {
        String Bus=(String)session.getAttribute("bus");
        String A=(String)session.getAttribute("start");
        String B=(String)session.getAttribute("end");
        String C=(String)session.getAttribute("waypoints");
        out.println("<font color='green'><b>Bus Service:    "+Bus+"<input type='hidden'  name='station' value='"+Bus+"'><br>");
        out.println("<font color='green'><b>Start:    "+A+"<input type='hidden' id='start' name='station' value='"+A+"'><br>");
        out.println("<font color='green'><b>End:    "+B+"<input type='hidden' id='end' name='station' value='"+B+"'><br>");
        out.println("<font color='green'><b>Current Loaction:    "+C+"<input type='hidden' id='waypoints' name='station' value='"+C+"'><br>");
        }
       // out.println("<input type='submit' onclick='calcRoute();'>");
       // out.println("</form>");
        
       
        
        
    
    %>
  

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>