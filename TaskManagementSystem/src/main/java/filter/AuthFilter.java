package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
        // You can initialize filter parameters here if needed
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("currentUser") != null);
        
      
        String loginURI = req.getContextPath() + "/view/login.jsp";
        String registerURI = req.getContextPath() + "/view/register.jsp";

        // Allow access to login and registration pages even if not logged in
        boolean loginRequest = req.getRequestURI().equals(loginURI);
        boolean registerRequest = req.getRequestURI().equals(registerURI);

        if (loggedIn || loginRequest || registerRequest) {
            // User is logged in or accessing login/register page → continue
            chain.doFilter(request, response);
        } else {
            // Not logged in and accessing a protected page → redirect to login
            res.sendRedirect(req.getContextPath() + "/view/login.jsp");
        }
    }

    public void destroy() {
        // Cleanup code if needed
    }
}
