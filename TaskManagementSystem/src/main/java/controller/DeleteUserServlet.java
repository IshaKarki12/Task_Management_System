package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get userID from the request
        String userIdParam = request.getParameter("id");

        if (userIdParam != null && !userIdParam.isEmpty()) {
            try {
                int userId = Integer.parseInt(userIdParam);
                
                // Create instance of UserDAO
                UserDAO userDAO = new UserDAO();
                
                // Delete the user
                boolean success = userDAO.deleteUser(userId);
                
                // Redirect back to the user management page
                if (success) {
                	response.sendRedirect("view/manage-users.jsp?msg=deleted");
                } else {
                    response.getWriter().println("Failed to delete user.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Error: " + e.getMessage());
            }
        } else {
            response.getWriter().println("Invalid user ID.");
        }
    }
}
