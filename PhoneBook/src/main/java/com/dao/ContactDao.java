package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;

public class ContactDao {
	private Connection conn;

	public ContactDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean saveContact(Contact c) {
		boolean f = false;

		try {
			String sql = "insert into contact(name,email,phone,about,userid) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhono());
			ps.setString(4, c.getAbout());
			ps.setInt(5, c.getUserid());
			int i = ps.executeUpdate();

			if (i > 0) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return f;
	}

	public List<Contact> getAllContact(int uid) {
		List<Contact> list = new ArrayList<Contact>();
		Contact c = null;
		try {
			String sql = "select*from contact where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Contact();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhono(rs.getString(4));
				c.setAbout(rs.getString(5));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Contact getDetailByID(int cid) {
		Contact c = new Contact();
		try {
			String sql = "select*from contact where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhono(rs.getString(4));
				c.setAbout(rs.getString(5));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return c;
	}

	public boolean editContact(Contact c) {
		boolean f = false;

		try {
			String sql = "update contact set name=?,email=?,phone=?,about=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhono());
			ps.setString(4, c.getAbout());
			ps.setInt(5, c.getId());
			int i = ps.executeUpdate();

			if (i > 0) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return f;
	}

	public boolean deleteContactById(int id) {
		boolean f = false;

		try {
			String sql = "delete from contact where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();

			if (i > 0) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return f;
	}

}
