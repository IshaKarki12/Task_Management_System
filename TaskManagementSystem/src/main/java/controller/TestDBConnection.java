package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import util.DBUtil;

@WebServlet("/TestDBConnection")
public class TestDBConnection extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TestDBConnection() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DBUtil.getConnection()) {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");

            if (conn != null) {
                out.println("<h2 style='color: green;'>Database connection successful!</h2>");
            } else {
                out.println("<h2 style='color: red;'>Failed to connect to database.</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h2 style='color: red;'>Error: " + e.getMessage() + "</h2>");
        }
    }
}
