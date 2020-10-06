package pack.board;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardMgr { // Board ���� process
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	//private DataSource ds;
	
	//paging
	private int tot = 0; // ��ü ���ڵ� ��
	private int pList = 5; // �� �������� ��µ� ��
	private int pageSu = 0; // ��ü ������ ��
	
	
	public BoardMgr() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/shopdb1?autoReconnect=true";
			String dbID = "root";
			String dbPassword = "lsks1878";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			System.out.println("BoardMgr err : " + e);
		}
	}
	
	public int currentGetmaxnum() { // board ���̺��� �ִ� num ���ϱ�
		String sql = "select max(num) from board";
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(!rs.next()) cnt = 1;
			else cnt = rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println("currentGetmaxnum err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
		return cnt;
	}
	
	
	public void saveData(BoardBean bean) {
		String sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			 
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getMail());
			pstmt.setString(5, bean.getTitle());
			pstmt.setString(6, bean.getCont());
			pstmt.setString(7, bean.getBip());
			pstmt.setString(8, bean.getBdate());
			pstmt.setInt(9,0); // readcnt
			pstmt.setInt(10,bean.getGnum());
			pstmt.setInt(11,0); //onum
			pstmt.setInt(12,0); //nested
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("saveData err: " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
	}
	public void totalList() {
		String sql = "select count(*) from board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("totallist err :" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
	}
	
	public int getPageSu() { // �� ������ �� ��ȯ
		pageSu = tot / pList;
		if(tot % pList > 0)pageSu++;
		return pageSu;
	}
	public ArrayList<BoardDto> getDataAll(int page, String stype, String sword){
		ArrayList<BoardDto> list = new ArrayList<>();
		String sql = "select * from board"; //order by gnum desc, onum asc";
		
		try {
			if(sword == null) { //sword�� �˻��� ���� ���
				sql += " order by gnum desc,onum asc";
				pstmt = conn.prepareStatement(sql);
			}else { // �˻��� ���� ���
				sql += " where " + stype + " like ?";
				sql += " order by gnum desc,onum asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + sword + "%");
			}
			
			rs = pstmt.executeQuery();
			
			for(int i = 0; i < (page -1) * pList; i++) {
				rs.next(); // ���ڵ� ��ġ, 0, 4, 9...
			}
			int k = 0;
			while(rs.next() && k < pList) {
				BoardDto dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setBdate(rs.getString("bdate"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setNested(rs.getInt("nested"));
				list.add(dto);				
				k++;
			}			
		} catch (Exception e) {
			System.out.println("getDataAll err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
		return list;
	}
	public BoardDto getData(String num) {
		BoardDto dto = null;
		try {
			String sql = " select * from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new BoardDto();
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass")); //��й�ȣ
				dto.setMail(rs.getString("mail")); // �̸���
				dto.setTitle(rs.getString("title")); // ������
				dto.setCont(rs.getString("cont")); // ����Ʈ
				dto.setBip(rs.getString("bip")); // ip �ּ�
				dto.setBdate(rs.getString("bdate")); // �����
				dto.setReadcnt(rs.getInt("readcnt")); // ��ȸ��
			}
			
		} catch (Exception e) {
			System.out.println("getData err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
		
		return dto;
	}
	public void updateReadcnt(String num) {
		// �� ���� ���� ���� ��ȸ�� ���� �۾�
		try {
			String sql = "update board set readcnt=readcnt + 1 where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateReadcnt err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
	}
	public BoardDto getReplyData(String num) { //��ۿ�
		BoardDto dto = null;
		try {
			String sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new BoardDto();
				dto.setTitle(rs.getString("title"));
				dto.setGnum(rs.getInt("gnum"));
				dto.setOnum(rs.getInt("onum"));
				dto.setNested(rs.getInt("nested"));
			}
			
		} catch (Exception e) {
			System.out.println("getReplyData err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
		
		
		return dto;
	}
	public void updateOnum(int gnum, int onum) {
		// ��ۿ� - onum ����
		// ���� �׷��� ���ڵ�� ��� �۾��� ����
		// ����� onum�� �̹� db�� �ִ� onum ���� ũ�ų� ���� ��쿡 ����
		try {
			String sql = "update board set onum=onum+1 where onum >= ? and gnum=?";
			pstmt.getConnection().prepareStatement(sql);
			pstmt.setInt(1, onum);
			pstmt.setInt(2, gnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateOnum err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
	}
	public void saveReplyData(BoardBean bean) {
		// ��� ����
		try {
			String sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getMail());
			pstmt.setString(5, bean.getTitle());
			pstmt.setString(6, bean.getCont());
			pstmt.setString(7, bean.getBip());
			pstmt.setString(8, bean.getBdate());
			pstmt.setInt(9, 0);
			pstmt.setInt(10, bean.getGnum());
			pstmt.setInt(11, bean.getOnum());
			pstmt.setInt(12, bean.getNested());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("saveReplyData err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
	}
	public boolean checkPass(int num, String new_pass) {
		// ���� �۾��� �ϱ� ���� ��й�ȣ �˻� : db�� �մ� ��� == new__pass ���� Ȯ��
		boolean b = false;
		try {
			String sql = "select pass from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(new_pass.equals(rs.getString("pass"))) {
					b = true;
				}
			}
			
		} catch (Exception e) {
			System.out.println("checkPass err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
		
		
		return b;
	}
	public void saveEdit(BoardBean bean) {
		String sql = "update board set name=?,mail=?,title=?,cont=? where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getMail());
			pstmt.setString(3, bean.getTitle());
			pstmt.setString(4, bean.getCont());			
			pstmt.setInt(5,bean.getNum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("saveEdit err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
	}
	
	public void delete(BoardBean bean) {
		String sql = "delete from board where gnum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bean.getNum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("delete err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
	}
	
}