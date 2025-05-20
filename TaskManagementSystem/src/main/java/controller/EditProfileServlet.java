package controller;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User currentUser = (User) session.getAttribute("currentUser");

        // Get form values
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Update currentUser object
        currentUser.setUserName(username);
        currentUser.setEmail(email);
        currentUser.setPhoneNo(phone);

        // Call DAO to update in DB
        boolean updated = UserDAO.updateUserProfile(currentUser);

        if (updated) {
            session.setAttribute("currentUser", currentUser); // Update session
            response.sendRedirect("view/user-dashboard.jsp"); // Change as per your app
        } else {
            response.getWriter().println("Error updating profile.");
        }
    }
}
