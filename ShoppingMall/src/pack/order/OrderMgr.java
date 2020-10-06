package pack.order;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderMgr {
	private Connection conn;
	private ResultSet rs;
	private DataSource ds;

	public OrderMgr() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/shopdb1?autoReconnect=true&useSSL=false";
			String dbID = "root";
			String dbPassword = "lsks1878";
			try {
	            Class.forName("com.mysql.jdbc.Driver");
	        } catch (ClassNotFoundException e) {
	            throw new Exception("No database");
	        }
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		
		} catch (Exception e) {
			System.out.println("OrderMgr err : " + e);
		}
	}

	public void insertOrder(OrderBean order) {
		try {
			String sql = "insert into shop_order(product_no,quantity,sdate,state,id) values(?,?,now(),?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order.getProduct_no());
			pstmt.setString(2, order.getQuantity());
			pstmt.setString(3, "3");
			pstmt.setString(4, order.getId());
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insertOrder err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				//if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public ArrayList<OrderBean> getOrder(String id){
		ArrayList<OrderBean> list = new ArrayList<>();
		try {
			String sql = "select * from shop_order where id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean bean = new OrderBean();
				bean.setNo(rs.getString("no"));
				bean.setProduct_no(rs.getString("product_no"));
				bean.setQuantity(rs.getString("quantity"));
				bean.setSdate(rs.getString("sdate"));
				bean.setState(rs.getString("state"));
				bean.setId(rs.getString("id"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("OrderBean err : " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				//if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	
	public ArrayList<OrderBean> getOrderAll(){
		ArrayList<OrderBean> list = new ArrayList<>();
		try {
			String sql = "select * from shop_order order by no asc";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean bean = new OrderBean();
				bean.setNo(rs.getString("no"));
				bean.setProduct_no(rs.getString("product_no"));
				bean.setQuantity(rs.getString("quantity"));
				bean.setSdate(rs.getString("sdate"));
				bean.setState(rs.getString("state"));
				bean.setId(rs.getString("id"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getOrderAll err : " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				//if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	
	public OrderBean getOrderDetail(String no) {
		OrderBean bean = null;
		try {
			String sql = "select * from shop_order where no=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new OrderBean();
				bean.setNo(rs.getString("no"));
				bean.setProduct_no(rs.getString("product_no"));
				bean.setQuantity(rs.getString("quantity"));
				bean.setSdate(rs.getString("sdate"));
				bean.setState(rs.getString("state"));
				bean.setId(rs.getString("id"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(rs != null) rs.close();
				//if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return bean;
	}	
	
	public boolean updateOrder(String no, String state) {
		boolean b = false;
		try {
			String sql = "update shop_order set state=? where no=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, state);
			pstmt.setString(2, no);
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("updateOrder err : " + e);
		} finally{
			try {
				if(rs != null) rs.close();
				//if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return b;
	}
	
	public boolean deleteOrder(String no) {
		boolean b = false;
		try {
			String sql = "delete from shop_order where no=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			if(pstmt.executeUpdate() > 0) b = true;
			//상품의 재고량을 원상복귀를 해 줘야 ... 생략
			
		} catch (Exception e) {
			System.out.println("deleteOrder err : " + e);
		} finally{
			try {
				if(rs != null) rs.close();
				//if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
	
}