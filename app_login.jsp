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
String dbName="user"; 
String tableName="information"; 

String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd; 
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn=DriverManager.getConnection(url); 
Statement stmt = conn.createStatement(); 
String sql="SELECT * FROM "+tableName+"  where id="+"'"+id+"'"; 
ResultSet rs = stmt.executeQuery(sql); 

boolean bool =false;//�û����ڱ��
if(rs.next())//�û�����
{
bool=true;
}
String p;
if(bool)//�û����ڣ������ݿ��ȡ����
{
p=rs.getString("password");
}
else p="NULL";//�û������ڣ�����Ϊ��
rs.close();
stmt.close();
conn.close();

if(p.equals(password)&&bool )//�û����ڣ���������ȷ
{
   response.setHeader("content-type", "text/html;charset=UTF-8");
   OutputStream outputStream = response.getOutputStream();
   outputStream.write("ok".getBytes("UTF-8"));
} //����app�ͻ���ok״̬
 
if(!bool)//�û�������
{
  response.setHeader("content-type", "text/html;charset=UTF-8");
  OutputStream outputStream = response.getOutputStream();
 outputStream.write("noexit".getBytes("UTF-8"));
}//����app�ͻ����û�������noexit״̬

if(bool&&!p.equals(password))//�û����ڣ��������벻��
{
   response.setHeader("content-type", "text/html;charset=UTF-8");
   OutputStream outputStream = response.getOutputStream();
   outputStream.write("error".getBytes("UTF-8"));
}//����app�ͻ���error״̬

%>

