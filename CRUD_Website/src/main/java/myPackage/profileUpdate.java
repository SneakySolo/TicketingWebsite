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
 * Servlet implementation class profileUpdate
 */
public class profileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
        
    }

    protected void update(Connection conn, String firstname1, String lastname1, String city1, String contactNumber1, String Email_id1, String email) throws Exception {
        String query = "UPDATE user_info SET First_name = ?, Last_name = ?, City = ?, Contact_no = ?, Email = ? WHERE Email = ?";
        PreparedStatement pstmt1 = conn.prepareStatement(query);
        pstmt1.setString(1, firstname1);
        pstmt1.setString(2, lastname1);
        pstmt1.setString(3, city1);
        pstmt1.setString(4, contactNumber1);
        pstmt1.setString(5, Email_id1);
        pstmt1.setString(6, email);
        
        int ex = pstmt1.executeUpdate();
        if (ex == 0) {
        	System.out.print("not updated");
        }
        else {
        	System.out.println("updated");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstname1 = request.getParameter("firstName");
        String lastname1 = request.getParameter("lastname");
        String city1 = request.getParameter("city");
        String contactNumber1 = request.getParameter("contactNumber");
        String Email_id1 = request.getParameter("email");
        
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        try {
            Connection conn = DatabaseConnection.getConnection();
            String sql = "SELECT * FROM user_info WHERE Email = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next()) {
                session.setAttribute("firstname", rs.getString("First_name"));
                session.setAttribute("lastname", rs.getString("Last_name"));
                session.setAttribute("city", rs.getString("City"));
                session.setAttribute("phone", rs.getString("Contact_no"));
                session.setAttribute("email", rs.getString("Email"));
                
                update(conn, firstname1, lastname1, city1, contactNumber1, Email_id1, email);
                response.sendRedirect("homePage.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}		
}
