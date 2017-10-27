<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.sql.*" %> 
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<html>
<head><title>注册页面</title></head>
<body background="http://cn.bing.com/az/hprichbg/rb/HawaiiWave_ROW13509210419_1920x1080.jpg">
<br/>
<h1  align="center" >用户账号申请</h1>
<br/>
<form action="sign.jsp" method="post">
	<table border="0"  height="30%" align="center" >
		<tr>
			<td>账号：</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" name="password"></td>
		</tr>

<tr><td></td><td></td></tr>
		<tr>
			<td colspan="1">
				<input type="submit" " value="注册">
			</td>
		</tr>
	</table>
</form>

<%
String id =request.getParameter("id") ;
String password =request.getParameter("password") ;
if(id!=null&&password!=null&&!id.equals("")&&!id.equals(""))
{
String driverName="com.mysql.jdbc.Driver"; 
//数据库信息
String userName="root"; 
//密码 
String userPasswd="linyuQQ-961224"; 
//数据库名 
String dbName="user"; 
//表名 
String tableName="information"; 
//将数据库信息字符串连接成为一个完整的url（也可以直接写成url，分开写是明了可维护性强） 

String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd; 
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn=DriverManager.getConnection(url); 
Statement stmt = conn.createStatement(); 
String sql="insert into information "+" values('"+id+"'"+","+"'"+password+"')"; 
stmt.executeUpdate(sql); 
%>
<%
	      	stmt.close();
	        conn.close();%>
<script type="text/javascript">
alert("注册成功！")
window.location.href="index.jsp";
</script>
<%}
else {
%>
<script type="text/javascript">
alert("注册失败！")
</script>
<%}%>

</body>
