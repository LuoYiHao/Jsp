<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "dao.ItemsDAO" %>
<%@ page import = "entity.Items" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type = "text/css" href = "css/detail.css" rel = "stylesheet">
<title>商品信息</title>
</head>
<body>
	<h1>商品信息</h1>
	<%
		boolean flag = true;
		ItemsDAO itemsDao = new ItemsDAO();
		Items item = itemsDao.getItemById(Integer.parseInt(request.getParameter("id")));
		if(item != null)
		{
	%>
	<div class = "goods">
		<div>
			<img src = "images/<%=item.getPicture() %>" width = "500" height = "500">
		</div>
		<div class = "goodsinfo">
			<div>
				商品：<%= item.getName() %>
			</div>
			<div>
				产地：<%=item.getCityname() %>
			</div>
			<div>
				价格：￥<%=item.getPrice() %>
			</div>
			<div>
				库存：<%=item.getNumber() %>
			</div>
			<a href = "index.jsp">返回主页</a>
		</div>
	</div>
	<div class = "aside">
	<p>浏览历史纪录</p>
	<%
		}
		String list = "";
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0)
		for(Cookie c:cookies)
		{
			if(c.getName().equals("LVC"))
			{
				list = c.getValue();
			}
		}
		String[] arr = list.split(",");
		if(arr.length >= 0)
		{
			for(int i = arr.length - 1;i >= arr.length - 5&&i >= 0;i--)
			{
				if(arr[i].equals(request.getParameter("id")))
				{
					flag = false;
					break;
				}
			}
		}
		if(flag)
			list += request.getParameter("id") + ",";
		flag = true;
		if(arr != null && arr.length >= 1000)
			list = "";
		Cookie cookie = new Cookie("LVC",list);
		response.addCookie(cookie);
		
		System.out.println(list);
		ArrayList<Items> itemlist = itemsDao.getViewList(list);
		if(itemlist != null && itemlist.size() > 0)
		{
			for(Items i:itemlist)
			{
	%>
			<div>
				<a href = "detail.jsp?id=<%=i.getId() %>">
					<img src = "images/<%=i.getPicture() %>" width = "100" height = "100">
				</a>
			</div>
			<div>
				商品：<%= i.getName() %>
			</div>
			<div>
				产地：<%=i.getCityname() %>
			</div>
			<div>
				价格：￥<%=i.getPrice() %>
			</div>
			<div>
				库存：<%=i.getNumber() %>
			</div>
			<div class = "hr"></div>
	<%
			}
		}
	%>
	</div>
</body>
</html>