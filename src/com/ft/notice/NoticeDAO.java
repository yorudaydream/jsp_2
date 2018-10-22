package com.ft.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ft.util.DBConnector;

public class NoticeDAO {
	public static void main(String[] args) throws Exception{
		NoticeDAO nd = new NoticeDAO();
		
		for(int i=0; i<150; i++) {
			NoticeDTO ndt = new NoticeDTO();
			
			ndt.setTitle("title"+i);
			ndt.setContent("content"+i);
			ndt.setWriter("writer"+i);
			nd.insert(ndt);
			
			if(i%10==0) {
				Thread.sleep(500);
			}
		}
	}
/*public static void main(String[] args) throws Exception{
		NoticeDAO nd=new NoticeDAO();
		
		List<NoticeDTO> ar = nd.selectList();
		System.out.println(ar.get(0).getTitle());
		NoticeDTO ar = nd.selectOne(1);
		System.out.println(ar.getTitle());//오류 selectOne
		
		 * NoticeDTO ndt = new NoticeDTO();
		 * ndt.setTitle("s");
		ndt.setContent("s");
		ndt.setWriter("s");
		int result = nd.insert(ndt);
		System.out.println(result);
		List<NoticeDTO> ar = nd.selectList();
		for(int i=0; i<ar.size(); i++) {
			NoticeDTO ndt = ar.get(i);
			System.out.println(ndt.getTitle());
		}//여기서 꺼내서. 꺼내는데 인덱스번호가 필요할 때는 이 for문을 쓴다
		
		for(NoticeDTO ndt:ar) {
			System.out.println(ndt.getTitle());
		}//여기에 담는다. 결과는 위 아래 같음. 집합에 있는 걸 하나 꺼내서 표시할때. index번호 필요 없을 때
		
		int [] nums = new int [3];
		
		for(int n:nums) {
			System.out.println(n);
		}
	}*/
	
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
