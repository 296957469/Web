<%@ page contentType="text/html" pageEncoding="GBK"%>import 
<%@ page import="java.sql.*" %> 

<%@ page import="java.io.OutputStream" %> 
<%@ page import="java.io.PrintWriter" %> 

<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%
String id =request.getParameter("id") ;
String userName="root"; 
String userPasswd="linyuQQ-961224"; 
String dbName1="user"; 
String tableName1="information"; 
String url1="jdbc:mysql://localhost/"+dbName1+"?user="+userName+"&password="+userPasswd; 
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn1=DriverManager.getConnection(url1); 
Statement stmt1 = conn1.createStatement(); 
String sql1="SELECT * FROM "+tableName1;                      //+"  where id="+"'"+id+"'"; 
ResultSet rs1 = stmt1.executeQuery(sql1); 
rs1.last();
int l=rs1.getRow();
int k=0;
rs1.beforeFirst();//获取结果集的长度
StringBuffer s=new StringBuffer();
	s.append("[");
for(int i=1;rs1.next();i++)
{
        s.append("{");
	s.append("\"id\":\"");
	s.append(rs1.getString("id"));
	s.append("\",");
	s.append("\"password\":\"");
	s.append(rs1.getString("password"));
	s.append("\"}");
        if(i<l)//如果是最后一个，不用加上逗号
        s.append(",");
}
s.append("]");
//s已经成为json格式


 response.setHeader("content-type", "text/html;charset=UTF-8");
 OutputStream outputStream = response.getOutputStream();
 outputStream.write(s.toString().getBytes("UTF-8"));

%>

