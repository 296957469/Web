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

boolean bool =false;//用户存在标记
if(rs.next())//用户存在
{
bool=true;
}
String p;
if(bool)//用户存在，则数据库获取密码
{
p=rs.getString("password");
}
else p="NULL";//用户不存在，密码为空
rs.close();
stmt.close();
conn.close();

if(p.equals(password)&&bool )//用户存在，且密码正确
{
   response.setHeader("content-type", "text/html;charset=UTF-8");
   OutputStream outputStream = response.getOutputStream();
   outputStream.write("ok".getBytes("UTF-8"));
} //返回app客户端ok状态
 
if(!bool)//用户不存在
{
  response.setHeader("content-type", "text/html;charset=UTF-8");
  OutputStream outputStream = response.getOutputStream();
 outputStream.write("noexit".getBytes("UTF-8"));
}//返回app客户端用户不存在noexit状态

if(bool&&!p.equals(password))//用户存在，但是密码不对
{
   response.setHeader("content-type", "text/html;charset=UTF-8");
   OutputStream outputStream = response.getOutputStream();
   outputStream.write("error".getBytes("UTF-8"));
}//返回app客户端error状态

%>

