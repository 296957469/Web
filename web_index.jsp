<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.sql.*" %> 
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<html>
<head><title>�ɼ���ѯϵͳ</title>
<script type="text/javascript">
function duihua()
{
alert("��������ǶԻ���")
}
function queren()
{
var se=confirm("ȷ�ϵ�¼��");
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
<h1  align="center" >���ݴ�ѧѧ���ɼ���ѯϵͳ</h1>
<br/>
<form action="login.jsp" method="post">
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
			<td colspan="3">
				<input type="submit"  value="ѧ����¼" >
				<input type="button" onclick="queren2()" value="��ʦ��¼">
                                <input type="button" onclick="queren2()" value="�û�ע��">
			</td>
		</tr>
	</table>
</form>


</body>
</html>
