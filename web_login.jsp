<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.sql.*" %> 
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<html>
<head><title>ѧ���ɼ�</title></head>
<body background="http://cn.bing.com/az/hprichbg/rb/HawaiiWave_ROW13509210419_1920x1080.jpg"  >
<%
String id =request.getParameter("id") ;
String password =request.getParameter("password") ;
String userName="root"; 
String userPasswd="linyuQQ-961224"; 
String dbName1="user"; 
String tableName1="information"; 
String url1="jdbc:mysql://localhost/"+dbName1+"?user="+userName+"&password="+userPasswd; 
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn1=DriverManager.getConnection(url1); 
Statement stmt1 = conn1.createStatement(); 
String sql1="SELECT * FROM "+tableName1+"  where id="+"'"+id+"'"; 
ResultSet rs1 = stmt1.executeQuery(sql1); 
boolean bool =false;
if(rs1.next())//�û�����
{
bool=true;
}
String p;
if(bool)//�û����ڣ������ݿ��ȡ����
{
p=rs1.getString("password");
}
else p="NULL";//�û������ڣ�����Ϊ��
rs1.close();
stmt1.close();
conn1.close();
if( p.equals(password)&&bool )//�û����ڣ���������ȷ������û������ڣ��������NULLҲ������ȥ����ΪboolΪfalse
{
String dbName="school"; 
String tableName="student"; 
String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd; 
Connection conn=DriverManager.getConnection(url); 
Statement stmt = conn.createStatement(); 
String sql="SELECT * FROM "+tableName+"  where id="+"'"+id+"'"; 
ResultSet rs = stmt.executeQuery(sql); 
%>
<center>
<table border="1" width="60%" >
	<tr>
		<td>ѧ��</td>
		<td>����</td>
                <td>����</td>
		<td>��ѧ</td>
                <td>Ӣ��</td>
		<td>����</td>
                <td>����</td>
		<td>����</td>
                <td>��ѧ</td>
		<td>��ʷ</td>
                <td>����</td>
                <td>����</td>

	</tr>
<%
		   while(rs.next()){
		String id1 = rs.getString("id");
		String name1 = rs.getString("name");
	        String yuwen1 = rs.getString("yuwen");
		String shuxue1 = rs.getString("shuxue");
	        String yingyu1 = rs.getString("yingyu") ;
		String shengwu1 = rs.getString("shengwu") ;
	        String dili1 = rs.getString("dili") ;
		String wuli1 = rs.getString("wuli") ;
	        String huaxue1 = rs.getString("huaxue") ;
		String lishi1 = rs.getString("lishi") ;
	        String zhengzhi1 = rs.getString("zhengzhi") ;
		String tiyu1= rs.getString("tiyu") ;
%>
		<tr>
		<td><%=id1%></td>
		<td><%=name1%></td>
                <td><%=yuwen1%></td>
		<td><%=shuxue1%></td>
                <td><%=yingyu1%></td>
		<td><%=shengwu1%></td>
                <td><%=dili1%></td>
		<td><%=wuli1%></td>
                <td><%=huaxue1%></td>
		<td><%=lishi1%></td>
                <td><%=zhengzhi1%></td>
		<td><%=tiyu1%></td>

	</tr>	
	<%
	}
	%>
</table>
</center>
	    <%
	        rs.close();
	        stmt.close();
	        conn.close();
	        %>
<%
}%>
<% if(!bool)
{%>
<script type="text/javascript">
alert("�û������ڣ����������˺ţ�")
  window.location.href="index.jsp";
</script>
<%}
%>
<% if(bool&&!p.equals(password))
{%>
<script type="text/javascript">
alert("�������")
  window.location.href="index.jsp";
</script>
<%}
%>
</body>
</html>