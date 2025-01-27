package myPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Arrays;

/**
 * Servlet implementation class log_in
 */
public class log_in extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public log_in() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s1 = request.getParameter("email");
		String s2 = request.getParameter("pswd");
		
		HttpSession session = request.getSession();				 
		session.setAttribute("email", s1);
		
		try {
			Connection conn = DatabaseConnection.getConnection();
			String sql = "SELECT * FROM user_info WHERE Email = ? AND Password = ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s1);
			pstmt.setString(2, s2);

			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
	             session.setAttribute("usn", rs.getString("First_name"));
	             session.setAttribute("usn2", rs.getString("Last_name"));
	             session.setAttribute("email", rs.getString("Email"));
	             session.setMaxInactiveInterval(1200);
	             response.sendRedirect("homePage.jsp");
			}
			else {
				response.getWriter().append("GOLI BETA, Email ya Password galat hai.");
			}
		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
