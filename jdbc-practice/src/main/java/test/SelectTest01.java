package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectTest01 {
	public static void main(String[] args) {
		serach("pat");
	}
	public static void serach(String keyword) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			//1. JDBC Drive Class 로딩          ::: (동적으로 로딩 >> 강의 시간에 설명하심)
			Class.forName("org.mariadb.jdbc.Driver");
			
			//2. 연결하기
			String url = "jdbc:mariadb://192.168.10.119:3307/employees?charset=utf8";
			conn = DriverManager.getConnection(url, "hr", "hr"); 
			
		    //3. Statement 생성
			stmt = conn.createStatement();
			
			//4. SQL 실행
			String sql = 
					"select emp_no, first_name, last_name"+ 
			        " from employees" +
					" where first_name like '%" + keyword +"%'";
			rs = stmt.executeQuery(sql);
			
			//5. 결과 처리
			while(rs.next()) {
				Long empNo = rs.getLong(1);
				String firstName = rs.getString(2);
				String lastName = rs.getString(3);
				
				System.out.println(empNo + ":" + firstName + ":" + lastName);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
}
