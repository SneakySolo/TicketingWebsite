package myPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.Random;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class signup
 */
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup() {
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
		Random random = new Random();
		
		String f_name = request.getParameter("First Name");
		String l_name = request.getParameter("Last Name");
		String cont_no = request.getParameter("Contact No");
		String city = request.getParameter("City");
		String email = request.getParameter("email");
		String pswd = request.getParameter("pswd");
		int user_id = random.nextInt(90000) + 10000;
		
		if (email.isEmpty() && pswd.isEmpty() && f_name.isEmpty()) {
			response.getWriter().append("GOLI BETA, White Spaces maat use karo");
		}
		
		else {
			if (Email(email)) {
			try {
				Connection conn = DatabaseConnection.getConnection();
				String sql = "INSERT INTO user_info(First_name, Last_name, Contact_no, City, Email, Password, User_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, f_name);
				pstmt.setString(2, l_name);
				pstmt.setString(3, cont_no);
				pstmt.setString(4, city);
				pstmt.setString(5, email);
				pstmt.setString(6, pswd);				pstmt.setInt(7, user_id);
				
				pstmt.execute();
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("LoginCRUD.jsp");
			}
		
		else {
			response.getWriter().append("GOLI BETA, email registered hai; Jaa kar login karo");
			}
		}
	}
	
	protected boolean Email(String email) {
        boolean status = false;
        try {
        	Connection conn = DatabaseConnection.getConnection();
        	String query = "SELECT COUNT(*) FROM user_info WHERE email = ?";
        	PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, email);
        	ResultSet rs = preparedStatement.executeQuery();   
        	if (rs.next()) {
        	    int count = rs.getInt(1);
        	    if (count == 0) {
        	        status = true;
        	    } else {
        	        status = false;
        	    }
        	}     
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
	}
}
