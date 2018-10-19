package com.ft.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ft.util.DBConnector;

public class NoticeDAO {
	public int insert(NoticeDTO ndt) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into notice values(notice_seq.nextval, ?, ?, ?, sysdate, 0)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, ndt.getTitle());
		st.setString(2, ndt.getContent());
		st.setString(3, ndt.getName());
		//st.setInt(4, ndt.getHit());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	public void delete() throws Exception{
		
	}
	
	public void update() throws Exception{
		
	}
	
	public NoticeDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect(); 
		String sql = "select * from notice where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		NoticeDTO ndt =  null;
		
		if(rs.next()) {
			ndt = new NoticeDTO();
			ndt.setNum(rs.getInt("num"));
			ndt.setTitle(rs.getString("title"));
			ndt.setName(rs.getString("name"));
			ndt.setContent(rs.getString("content"));
			ndt.setToday(rs.getDate("today"));
			ndt.setHit(rs.getInt("hit"));
			
		}
		
		DBConnector.disConnect(rs, st, con);
			
		return ndt;
	}
	
}
