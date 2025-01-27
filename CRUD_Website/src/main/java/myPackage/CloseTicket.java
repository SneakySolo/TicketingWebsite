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

/**
 * Servlet implementation class CloseTicket
 */
public class CloseTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CloseTicket() {
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

        if (session.getAttribute("usn") == null) {
            response.sendRedirect("AdminLogin.jsp");
            return;
        }
        
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        
        String status = "";
        if ("Closed".equals(action)) {
            status = "Closed";
        }
        try {
        	Connection conn = DatabaseConnection.getConnection();
        	 String sql = "UPDATE tickets SET status2 = 'Closed' WHERE id = ?";
             PreparedStatement stmt = conn.prepareStatement(sql);
             stmt.setString(1, id);
             stmt.executeUpdate();

             response.sendRedirect("myTickets2.jsp");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
	}
}
