<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.sql.*" %> 
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<html>
<head><title>ע��ҳ��</title></head>
<body background="http://cn.bing.com/az/hprichbg/rb/HawaiiWave_ROW13509210419_1920x1080.jpg">
<br/>
<h1  align="center" >�û��˺�����</h1>
<br/>
<form action="sign.jsp" method="post">
	<table border="0"  height="30%" align="center" >
		<tr>
			<td>�˺ţ�</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>���룺</td>
			<td><input type="password" name="password"></td>
		</tr>

<tr><td></td><td></td></tr>
		<tr>
			<td colspan="1">
				<input type="submit" " value="ע��">
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
//���ݿ���Ϣ
String userName="root"; 
//���� 
String userPasswd="linyuQQ-961224"; 
//���ݿ��� 
String dbName="user"; 
//���� 
String tableName="information"; 
//�����ݿ���Ϣ�ַ������ӳ�Ϊһ��������url��Ҳ����ֱ��д��url���ֿ�д�����˿�ά����ǿ�� 

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
alert("ע��ɹ���")
window.location.href="index.jsp";
</script>
<%}
else {
%>
<script type="text/javascript">
alert("ע��ʧ�ܣ�")
</script>
<%}%>

</body>
