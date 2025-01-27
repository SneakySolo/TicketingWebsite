package myPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Forgot_pswd
 */
public class Forgot_pswd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Forgot_pswd() {
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
		String pswd = request.getParameter("pswd");
		String conf_pswd = request.getParameter("conf_pswd");
		
		if (pswd.equals(conf_pswd)) {
			try {
				Connection conn = DatabaseConnection.getConnection();
				String sql = "SELECT Email FROM user_info WHERE Email = ? ";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email);
				
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					String query = "UPDATE user_info SET Password = ? WHERE Email = ?";
					PreparedStatement pst = conn.prepareStatement(query);
					pst.setString(1, pswd);
					pst.setString(2, email);
					
					int updatedRows = pst.executeUpdate();
					
					if (updatedRows > 0) {
						System.out.println("PASSWORD UPDATED SUCCESSFULLY");
						response.sendRedirect("LoginCRUD.jsp");
					}
					else {
						response.getWriter().append("TASK FAILED SUCCESSFULLY. Please try again");
					}
				}
				else {
					response.getWriter().append("GOLI BETA aisa koi Email exist he nahi karta.");
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		else {
			response.getWriter().append("Goli Beta password match nahi kar raha hai.");
		}
	}
}