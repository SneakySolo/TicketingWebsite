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
 * Servlet implementation class profileView
 */
public class profileView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		try {
			Connection conn = DatabaseConnection.getConnection();
			String sql = "SELECT * FROM user_info WHERE Email = ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) { 
				session.setAttribute("firstname", rs.getString("First_name"));
				session.setAttribute("lastname", rs.getString("Last_name"));
				session.setAttribute("city", rs.getString("City"));
				session.setAttribute("phone", rs.getString("Contact_no"));
				session.setAttribute("email", rs.getString("Email"));
				
				//request.getRequestDispatcher("ViewProfile.jsp").forward(request, response);
				response.sendRedirect("ViewProfile.jsp");
			}
	}
		catch (Exception e){
			e.printStackTrace();
		}
		
	}
}
