package com.ft.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ft.util.DBConnector;

public class NoticeDAO {
	
public static void main(String[] args) throws Exception{
		NoticeDAO nd=new NoticeDAO();
		NoticeDTO ndt = new NoticeDTO();
		/*List<NoticeDTO> ar = nd.selectList();
		System.out.println(ar.get(0).getTitle());*/
		/*NoticeDTO ar = nd.selectOne(1);
		System.out.println(ar.getTitle());*///오류 selectOne
		ndt.setTitle("s");
		ndt.setContent("s");
		ndt.setWriter("s");
		int result = nd.insert(ndt);
		System.out.println(result);
	}
	
	//insert
	public int insert(NoticeDTO ndt) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into notice values(notice_seq.nextval, ?, ?, ?, sysdate, 0)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, ndt.getTitle());
		st.setString(2, ndt.getContent());
		st.setString(3, ndt.getWriter());
		//st.setInt(4, ndt.getHit());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	//delete
	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "delete notice where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
		
	}
	
	public int update(NoticeDTO ndt) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="update notice set title=?, name=?, content=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, ndt.getTitle());
		st.setString(2, ndt.getWriter());
		st.setString(3, ndt.getContent());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
		
	}
	
	//selectOne
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
			ndt.setWriter(rs.getString("writer"));
			ndt.setContent(rs.getString("content"));
			ndt.setDate(rs.getDate("date"));
			ndt.setHit(rs.getInt("hit"));
		}
		
		DBConnector.disConnect(rs, st, con);
			
		return ndt;
	}
	
	//selectList
	public List<NoticeDTO> selectList() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select num, title, writer, reg_date, hit from notice order by num desc";
		PreparedStatement st = con.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<NoticeDTO> ar = new ArrayList<>();
		NoticeDTO ndt = null;
		
		while(rs.next()) {
			ndt = new NoticeDTO();
			ndt.setNum(rs.getInt("num"));
			ndt.setTitle(rs.getString("title"));
			ndt.setWriter(rs.getString("writer"));
			ndt.setDate(rs.getDate("date"));
			ndt.setHit(rs.getInt("hit"));
			ar.add(ndt);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
		
	}
	
}
