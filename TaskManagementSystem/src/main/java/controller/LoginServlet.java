package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import dao.UserDAO;
import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.validateLogin(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);

            // If "Remember Me" is checked
            if (remember != null && remember.equals("on")) {
                Cookie emailCookie = new Cookie("email", email);
                Cookie passwordCookie = new Cookie("password", password);

                emailCookie.setMaxAge(60 * 60 * 24 * 7); // 7 days
                passwordCookie.setMaxAge(60 * 60 * 24 * 7); // 7 days

                response.addCookie(emailCookie);
                response.addCookie(passwordCookie);
            } else {
                // Clear cookies if not selected
                Cookie emailCookie = new Cookie("email", "");
                Cookie passwordCookie = new Cookie("password", "");
                emailCookie.setMaxAge(0);
                passwordCookie.setMaxAge(0);
                response.addCookie(emailCookie);
                response.addCookie(passwordCookie);
            }

            // Redirect based on user role
            if (user.getRoleID() == 1) {  // Admin
                response.sendRedirect("view/admin-dashboard.jsp");
            } else if (user.getRoleID() == 2) {  // User
                response.sendRedirect("view/user-dashboard.jsp");
            }
        } else {
            request.setAttribute("error", "Invalid email or password");

            // Repopulate cookie values if available
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if (c.getName().equals("email")) {
                        request.setAttribute("rememberedEmail", c.getValue());
                    } else if (c.getName().equals("password")) {
                        request.setAttribute("rememberedPassword", c.getValue());
                    }
                }
            }

            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }
}
