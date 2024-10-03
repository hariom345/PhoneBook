package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;
import com.entity.User;

public class UserDao {
	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User u) {
		boolean c = false;
		try {
			String sql = "insert into user(name,email,password) values(?,?,?)";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, u.getName());
			st.setString(2, u.getEmail());
			st.setString(3, u.getPassword());
			int i = st.executeUpdate();
			if (i > 0) {
				c = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return c;
	}

	public User isRegisterUSer(String e, String p) {
		User user = null;
		try {
			String sql = "select* from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, e);
			ps.setString(2, p);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));

			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		return user;
	}

}
