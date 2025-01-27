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
 * Servlet implementation class TicketsAdmin
 */
public class TicketsAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketsAdmin() {
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

        if (session.getAttribute("admin") == null) {
            response.sendRedirect("AdminLogin.jsp");
            return;
        }
        
        String id = request.getParameter("id");
        String action = request.getParameter("action");

        try {
        	Connection conn = DatabaseConnection.getConnection();
        	String sql = null;
        	PreparedStatement stmt = null;
        	
        	if ("complete".equals(action)) {
        	    sql = "UPDATE tickets SET status2 = 'Completed' WHERE id = ?";
        	    stmt = conn.prepareStatement(sql);
        	    stmt.setString(1, id);  
        	} 
            else {
                String status = "Pending";
                
                if ("approve".equals(action)) {
                    status = "Approved";
                } else if ("reject".equals(action)) {
                    status = "Rejected";
                }
                
                sql = "UPDATE tickets SET Status = ?, status2 = 'In process' WHERE id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, status);  
                stmt.setString(2, id);     
        	}
        	
        	stmt.executeUpdate();

            response.sendRedirect("AdminHomePage.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
