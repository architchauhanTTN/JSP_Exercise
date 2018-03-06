<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>

<html>
<head>
    <title>SignUp</title>
</head>
<body>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Trying to insert the values");
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            String mail = request.getParameter("mail");
            System.out.println(user + " " + pass + "  " + mail);

            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp" , "root" , "ttn");
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO users VALUES (? , ? , ?)");
            stmt.setString(1 , user);
            stmt.setString(2 , pass);
            stmt.setString(3 , mail);
            stmt.executeUpdate();
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