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
 * Servlet implementation class MyChatRoom
 */
public class MyChatRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyChatRoom() {
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
		HttpSession session = request.getSession();
		
		String admin = (String) session.getAttribute("admin");
		
		String id = (String) request.getParameter("reqid");
		String name = (String) session.getAttribute("usn");
		String reciever = "alfred@gmail.com";
		String sender = (String) session.getAttribute("email"); 
		String text = (String) request.getParameter("message");
		
		if (admin != null) {
			sender = "alfred@gmail.com";
			try {
				
				Connection conn = DatabaseConnection.getConnection();
				String getUserEmailSql = "SELECT Email_id FROM tickets WHERE id = ?";
				PreparedStatement pstmt = conn.prepareStatement(getUserEmailSql);
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				
				if (rs.next()) {
					reciever = rs.getString("Email_id");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			reciever = "alfred@gmail.com"; // Assuming the user is sending a message to the admin
		}
		
		try {
			Connection conn = DatabaseConnection.getConnection();
			String sql = "INSERT INTO Chat (Req_id, Sender, Reciever, Message, Name) VALUES (?, ?, ?, ?, ?)";
        	PreparedStatement pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, id); 
        	pstmt.setString(2, sender);
        	pstmt.setString(3, reciever);
        	pstmt.setString(4, text);
        	pstmt.setString(5, name);
        	pstmt.executeUpdate();        	
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("ChatRoom.jsp?reqid=" + id);
	}
}
