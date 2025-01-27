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
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Tickets
 */
public class Tickets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Tickets() {
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
		String email = (String) session.getAttribute("email");
	    String usn = (String) session.getAttribute("usn");
	    String usn2 = (String) session.getAttribute("usn2");
		
	    Random random = new Random();
	    int ticketId = random.nextInt(90000) + 10000;
	    String Name = usn + " " + usn2;
		String Email = email;
		String seat = request.getParameter("seat");
		String type = request.getParameter("reqtype");
		String reason = request.getParameter("req_res");
		
		if (reason.isEmpty()) {
			response.getWriter().append("Empty tickets cannot be submitted; Please specify you needs and reasons.");
		}
		else {
			try {
				Connection conn = DatabaseConnection.getConnection();
				String sql = "INSERT INTO tickets (id, Name, Email_id, Seat_no, Type, Reason) VALUES (?, ?, ?, ?, ?, ?)";
            	PreparedStatement pstmt = conn.prepareStatement(sql);
            	pstmt.setInt(1, ticketId); 
            	pstmt.setString(2, Name);
            	pstmt.setString(3, Email);
            	pstmt.setString(4, seat);
            	pstmt.setString(5, type);
            	pstmt.setString(6, reason);
            	pstmt.executeUpdate();
            
            	response.sendRedirect("myTickets2.jsp");
			}
			catch (Exception e) {
			e.printStackTrace();
			}
		}
	}
}
