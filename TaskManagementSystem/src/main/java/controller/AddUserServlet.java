package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNo = request.getParameter("phoneNo");
        int roleID = Integer.parseInt(request.getParameter("roleID"));

        boolean isAdded = userDAO.registerUser(userName, email, password, phoneNo, roleID);

        if (isAdded) {
            request.setAttribute("successMessage", "User added successfully.");
            response.sendRedirect("view/manage-users.jsp"); 
        } else {
            request.setAttribute("errorMessage", "Failed to add user. Email might already exist.");
        }

        // Forward back to the add-user.jsp page
        request.getRequestDispatcher("/view/add-user.jsp").forward(request, response);
    }
}
