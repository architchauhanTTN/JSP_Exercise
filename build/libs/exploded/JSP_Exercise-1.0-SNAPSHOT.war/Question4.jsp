<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>

<html>
<head>
    <title>Login</title>
</head>
<body>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Trying to insert the values");
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");



        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp" , "root" , "ttn");
        PreparedStatement stmt = connection.prepareStatement("SELECT * from users where name = ? and pass = ?");
        stmt.setString(1 , user);
        stmt.setString(2 , pass);

        ResultSet rs = stmt.executeQuery();
        boolean ch = false;
        while(rs.next()) {
            ch = true;

        }
        if(ch == false) {
            response.sendRedirect("login.html");
        }
        System.out.println("Good Login");
        PrintWriter pw = response.getWriter();
        RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
        request.setAttribute("user" , user);
        rd.forward(request , response);
        connection.close();
    }
    catch (SQLException e) {
        e.printStackTrace();
    }
    catch (ClassNotFoundException e) {
        System.out.println("Class not found Exception");
        e.printStackTrace();
    }

%>
</body>
</html>