<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.OutputStream" %> 
<%@ page import="java.io.PrintWriter" %> 
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%
String id =request.getParameter("id") ;
String password =request.getParameter("password") ;

String userName="root"; 
String userPasswd="linyuQQ-961224"; 
String dbName1="user"; 
String tableName1="information"; 

String url="jdbc:mysql://localhost/"+dbName1+"?user="+userName+"&password="+userPasswd; 
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn=DriverManager.getConnection(url); 
Statement stmt = conn.createStatement(); 
String sql="SELECT * FROM "+tableName1+"  where id="+"'"+id+"'"; 
ResultSet rs = stmt.executeQuery(sql); 

if(rs.next())//�û�����
{
   response.setHeader("content-type", "text/html;charset=UTF-8");
   OutputStream outputStream = response.getOutputStream();
   outputStream.write("exit".getBytes("UTF-8"));
}//����app�ͻ���exit״̬��ע��ʧ�ܣ��û�����
else                     //�û������ڣ���ע��
{
if(id!=null&&password!=null&&!id.equals("")&&!password.equals("")&&!id.equals("null")&!password.equals("null"))//ǰ�����˺ź�������������룬��������id��password��Ϊ����null������string���Ҷ�����Ϊ��
{
String sql1="insert into "+tableName1+"  values("+"'"+id+"'"+","+"'"+password+"')"; 
Statement stmt1= conn.createStatement(); 
stmt1.executeUpdate(sql1); 
stmt1.close();
 response.setHeader("content-type", "text/html;charset=UTF-8");
   OutputStream outputStream = response.getOutputStream();
   outputStream.write("ok".getBytes("UTF-8"));
}
else
{
 response.setHeader("content-type", "text/html;charset=UTF-8");
   OutputStream outputStream = response.getOutputStream();
   outputStream.write("error".getBytes("UTF-8"));

}

}
rs.close();
stmt.close();
conn.close();
%>

