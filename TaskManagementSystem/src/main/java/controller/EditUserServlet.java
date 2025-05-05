package controller;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String phoneNo = request.getParameter("phoneNo");
        int roleID = Integer.parseInt(request.getParameter("roleID"));

        User user = new User();
        user.setUserID(userID);
        user.setUserName(userName);
        user.setEmail(email);
        user.setPhoneNo(phoneNo);
        user.setRoleID(roleID);

        UserDAO dao = new UserDAO();
        boolean success = dao.updateUser(user);

        if (success) {
            // Redirect back to user list page or success page
            response.sendRedirect(request.getContextPath() + "/view/manage-users.jsp");
        } else {
            response.getWriter().println("Failed to update user.");
        }
    }
}
