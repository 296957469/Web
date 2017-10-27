<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.sql.*" %> 
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<html>
<head><title>成绩查询系统</title>
<script type="text/javascript">
function duihua()
{
alert("这个窗口是对话框！")
}
function queren()
{
var se=confirm("确认登录？");
if (se==true)
  {
  window.location.href="login_conf.jsp";
  }
else
  {

  }
}
function queren2()
{
  window.location.href="sign.jsp";
}
</script></head>
<body background="http://cn.bing.com/az/hprichbg/rb/HawaiiWave_ROW13509210419_1920x1080.jpg" >
<br/>
<h1  align="center" >广州大学学生成绩查询系统</h1>
<br/>
<form action="login.jsp" method="post">
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
			<td colspan="3">
				<input type="submit"  value="学生登录" >
				<input type="button" onclick="queren2()" value="教师登录">
                                <input type="button" onclick="queren2()" value="用户注册">
			</td>
		</tr>
	</table>
</form>


</body>
</html>
