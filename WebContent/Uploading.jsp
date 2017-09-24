<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ibm.dao.CABDAO" %>
<% String email="abc@gmail.com"; %>
<% String saveFile=""; %>
<% String file1=""; %>
<% String date1=""; %>
<% int count=1; %>
<% String name=""; %>
<% String description=""; %>
<!DOCTYPE HTML>
<!--
	Interphase by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Generic - Interphase by TEMPLATED</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-xlarge.css" />
		</noscript>
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<h1><a href="ADMINHOME.jsp">Back To Admin Home</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="register.jsp">Admin Register</a></li>
						<li><a href="login.jsp">Admin Login</a></li>
						
						
					</ul>
				</nav>
			</header>

<html>
	<head>
		<title>GPS Bus Tracking System</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="subpage">

	
	
<!-- Main -->
			<div id="main">

				<!-- Section -->
					<section class="wrapper">
						<div class="inner">
							<header class="align-center">
								<h1>Bus Information</h1>
								<p>All rourtes covered</p>
							</header>
						</div>
					</section>

			<!-- Section --></div>
	  <%
//++++++++++++++++++++++++++++=Task1

File file = new File("G:\\pic");
if (!file.exists()) {
	if (file.mkdir()) {
		out.println("Directory is created!");
	} else {
		System.out.println("Failed to create directory!");
	}
}

//++++++++++++++++++++++++++=Task2



String contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
          DataInputStream in = new DataInputStream(request.getInputStream());
          
          int formDataLength = request.getContentLength();
          byte dataBytes[] = new byte[formDataLength];
          int byteRead = 0;
          int totalBytesRead = 0;
          while (totalBytesRead < formDataLength) {
                  byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                  totalBytesRead += byteRead;
                  }
          String filex = new String(dataBytes);
         
          saveFile = filex.substring(filex.indexOf("filename=\"") + 10);
          saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
          saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
          int lastIndex = contentType.lastIndexOf("=");
          String boundary = contentType.substring(lastIndex + 1,contentType.length());
          int pos;
          pos = filex.indexOf("filename=\"");
          pos = filex.indexOf("\n", pos) + 1;
          pos = filex.indexOf("\n", pos) + 1;
          pos = filex.indexOf("\n", pos) + 1;
          int boundaryLocation = filex.indexOf(boundary, pos) - 4;
          int startPos = ((filex.substring(0, pos)).getBytes()).length;
          int endPos = ((filex.substring(0, boundaryLocation))
.getBytes()).length;
       
          FileOutputStream fileOut = new FileOutputStream("G:\\pic\\"+saveFile); 
          fileOut.write(dataBytes, startPos, (endPos - startPos));
          fileOut.flush();
          fileOut.close();
          

          }


//+++++++++++++++++++++++++++++++++++TASK3

        String path="G:/pic/common.txt";
	String  strLine="";
		FileInputStream fstream = new FileInputStream(path);
		DataInputStream in = new DataInputStream(fstream);
		BufferedReader br = new BufferedReader(new InputStreamReader(in));

try
	{		
	   out.println("<h2>List Updated successfull </h2>");
	   Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cab","root","dina"); 
	   Statement st=con.createStatement();
		int c=1;
		
		ArrayList A=new ArrayList();
		ArrayList B=new ArrayList();
		ArrayList C=new ArrayList();
		ArrayList D=new ArrayList();
		ArrayList E=new ArrayList();
		ArrayList F=new ArrayList();
		ArrayList G=new ArrayList();
		
		
		while((strLine=br.readLine())!=null)
		{
			
			 
			 
			 StringTokenizer tokenizer = new StringTokenizer(strLine," ");
				while(tokenizer.hasMoreTokens())
				{
					A.add(tokenizer.nextToken());
					B.add(tokenizer.nextToken());
					C.add(tokenizer.nextToken());
					D.add(tokenizer.nextToken());
					E.add(tokenizer.nextToken());
					F.add(tokenizer.nextToken());
					G.add(tokenizer.nextToken());
					
				}
			 
			 }
		
		 for(int i=0;i<A.size();i++)
	        {
				String a=A.get(i).toString();
				String b=B.get(i).toString();
				String c1=C.get(i).toString();
				String d=D.get(i).toString();
				String e=E.get(i).toString();
				String f=F.get(i).toString();
				String g=G.get(i).toString();
				
				st.executeUpdate("insert into BusInfo values('"+a+"','"+b+"','"+c1+"','"+d+"','"+e+"','"+f+"','"+g+"')");
          }
		 
		 
		 ResultSet rs=st.executeQuery("select * from BusInfo");
		 out.println("<table border='0'>");
		 out.println("<tr><th>BUSSERVICE</th><th>SEQNO</th><th>STATION</th><th>LATITUDE</th><th>LONGITUDE</th><th>CURLOCATION</th><th>DESTINATION</th></tr>");
		 while(rs.next())
		 {
		 out.println("<tr>");
		 out.println("<td>"+rs.getString(1)+"</td>");
		 out.println("<td>"+rs.getString(2)+"</td>");
		 out.println("<td>"+rs.getString(3)+"</td>");
		 out.println("<td>"+rs.getString(4)+"</td>");
		 out.println("<td>"+rs.getString(5)+"</td>");
		 out.println("<td>"+rs.getString(6)+"</td>");
		 out.println("<td>"+rs.getString(7)+"</td>");
		 out.println("</tr>");
		 }
		 out.println("</table>");
		 

      out.println("<br><br><br><a href='UploadDataAdmin.jsp' style='color:blue;''>back</a>");
//++++++++++++++++++++++++++++++++Task4
}
catch(Exception e)
{
	out.println(e);
}	
%>
   	  
	 
		

	</body>
</html>
