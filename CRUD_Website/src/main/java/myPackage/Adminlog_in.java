package myPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Adminlog_in
 */
public class Adminlog_in extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Adminlog_in() {
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
		String email = request.getParameter("email");
        String password = request.getParameter("pswd");
        String admin = "Admin";
        
        HttpSession session = request.getSession();
        
        if (email.isEmpty() || password.isEmpty()) {
        	response.getWriter().append("Do not leave the Email and Password area empty.");
        }
        else {
        	try {
    			Connection conn = DatabaseConnection.getConnection();
    			String sql = "SELECT * FROM admin_info WHERE Email = ? AND Password = ? ";
    			PreparedStatement pstmt = conn.prepareStatement(sql);
    			pstmt.setString(1, email);
    			pstmt.setString(2, password);

    			ResultSet rs = pstmt.executeQuery();

    			if(rs.next()) {
    	             session.setAttribute("admin", email);
    	             session.setAttribute("usn", admin);
    	             session.setMaxInactiveInterval(1200);
    	             response.sendRedirect("AdminHomePage.jsp");
    			}
    			else {
    				response.getWriter().append("Admin GOLI BETA, Email ya Password galat hai.");
    			}
    		
    		}
    		catch (Exception e) {
    			e.printStackTrace();
    		}
        }
	}

}
