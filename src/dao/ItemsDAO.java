package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Items;
import util.DBHelper;

public class ItemsDAO {
	public ArrayList<Items> getAllItems()
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Items> list = new ArrayList<Items>();
		try
		{
			conn = DBHelper.getConnection();
			String sql = "select * from items;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next())
			{
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setCityname(rs.getString("cityname"));
				item.setPrice(rs.getInt("price"));
				item.setNumber(rs.getInt("number"));
				item.setPicture(rs.getString("picture"));
				list.add(item);
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			try
			{
				if(rs != null)
				{
					rs.close();
					rs = null;
				}
				if(stmt != null)
				{
					stmt.close();
					stmt = null;
				}
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		return list;
	}
	public Items getItemById(int id)
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try
		{
			conn = DBHelper.getConnection();
			String sql = "select * from items where id = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs.next())
			{
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setCityname(rs.getString("cityname"));
				item.setPrice(rs.getInt("price"));
				item.setNumber(rs.getInt("number"));
				item.setPicture(rs.getString("picture"));
				return item;
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			try
			{
				if(rs != null)
				{
					rs.close();
					rs = null;
				}
				if(stmt != null)
				{
					stmt.close();
					stmt = null;
				}
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
			
		}
		return null;
	}
	public ArrayList<Items> getViewList(String list)
	{
		ArrayList<Items> itemlist = new ArrayList<Items>();
		if(list != null && list.length() > 0)
		{
			String[] arr = list.split(",");
			if(arr.length >= 5)
			{
				for(int i = arr.length - 1;i >= arr.length - 5;i--)
				{
					itemlist.add(getItemById(Integer.parseInt(arr[i])));
				}
			}
			else
			{
				for(int i = arr.length - 1;i >= 0;i--)
				{
					itemlist.add(getItemById(Integer.parseInt(arr[i])));
				}
			}
			return itemlist;
		}
		else
			return null;
	}
}
