<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "dao.ItemsDAO" %>
<%@ page import = "entity.Items" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type = "text/css" href = "css/index.css" rel = "stylesheet">
<title>购物网</title>
</head>
<body>
	<h1>购物网</h1>
	<div class = "container">
		<%
			ItemsDAO itemsDao = new ItemsDAO();
			ArrayList<Items> list = itemsDao.getAllItems();
			if(list != null && list.size() > 0)
			for(int i = 0;i < list.size();i++)
			{
				Items item = list.get(i);
		%>
		<div class = "goods">
			<div>
				<a href = "detail.jsp?id=<%=item.getId() %>">
					<img src = "images/<%=item.getPicture() %>" width = "250" height = "250">
				</a>
			</div>
			<div>
				商品：<%= item.getName() %>
			</div>
			<div>
				价格：￥<%=item.getPrice() %>
			</div>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>