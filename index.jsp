<%@page import="javax.sql.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>

<html>
<head><title>showTable.jsp</title></head>
<body>

<%
    InitialContext initCon = new InitialContext(); //(1)
    DataSource ds
        = (DataSource)initCon.lookup("java:comp/env/jdbc/MySQL"); //(2)
    Connection con = ds.getConnection(); //(3)JNDI���\�[�X�ւ̃R�l�N�g
    Statement stmt = con.createStatement(); //(4)
    ResultSet result
        = stmt.executeQuery("select * from OFFLINE_USER_SESSION;"); //(5)SQL���̎��s
%>

<table border="1">
    <tr>
        <th>Country</th>
        <th>Capital</th>
    </tr>

    //(6)�f�[�^�̕\��
    <%
        while (result.next()) {
    %>

    <tr>
        <td> <%= result.getInt(1) %></td>
        <!-- <td> <%= result.getString(2) %></td> -->
    </tr>

    <%
        }
        //(7)�R�l�N�g�̃N���[�Y
        con.close();
        initCon.close();
    %>
</table>

</body>
</html>