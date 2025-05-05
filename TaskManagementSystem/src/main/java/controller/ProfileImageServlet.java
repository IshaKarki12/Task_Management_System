package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/ProfileImageServlet")
public class ProfileImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        User user = (User) session.getAttribute("currentUser");

        if (user == null || user.getProfileImage() == null) {
            // Set a default image if no image is found
            response.setContentType("image/png");
            response.sendRedirect(request.getContextPath() + "/img/default-profile.png");
            return;
        }

        response.setContentType("image/jpeg"); // or image/png if you stored PNGs
        OutputStream out = response.getOutputStream();
        out.write(user.getProfileImage());
        out.flush();
        out.close();
    }
}
