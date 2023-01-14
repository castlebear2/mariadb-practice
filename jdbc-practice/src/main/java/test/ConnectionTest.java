package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTest {

	public static void main(String[] args) {
		Connection conn = null;
		
		try {
			//1. JDBC Driver Class 로딩 : new를 안하고 클래스로딩한다. new하면 JVM이 클래스로딩해준다. 

			//  왜냐면 driver안에 있는 클래스를 알 필요가 없기 때문이다.!!! ::: (동적으로 로딩 >> 강의 시간에 설명하심)
			Class.forName("org.mariadb.jdbc.Driver");
			//이런거 다 정해져있는거다. 안에 있는 매개변수도.
			//위의 코드가 실행되면, 드라이버가 코드 하나를 실행하는데, 
			// static { } 코드를 넣어주면, 드라이버가 로딩되면서 안에 코드 내용을 실행한다. >> 이걸 driver패키지에서 한 번 만들어보자. 작동원리르 알기 위해!
			//위의 코드는 커넥션을 만들어 driver manager한테 등록을 시킨다고
			// 그래서 다음에는 커넥션을 달라고 해야한다. (바로 밑.)
			
			//2. 연결하기
			// db이름주소/db이름?charset=utf8 이다.
			String url = "jdbc:mariadb://192.168.10.119:3307/webdb?charset=utf8";
			// 그래서 DriverManager한테 connection을 달라고 하는것이다.
			// Connection(인터페이스.)이다.
			
			conn = DriverManager.getConnection(url, "webdb", "webdb"); // 앞에꺼 아이디 뒤에꺼 비밀번호
			
			//static area에서  Connection 어쩌고를 한다...
			//statement:구문, 여기선 쿼리라고 보면 됨.
			System.out.println("연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
}
