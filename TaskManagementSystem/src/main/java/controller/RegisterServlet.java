package controller; 
import dao.UserDAO;
 
import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet; 
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse; 
import java.io.IOException; 
@WebServlet("/RegisterServlet") 
public class RegisterServlet extends HttpServlet { 
private static final long serialVersionUID = 1L; 
public RegisterServlet() { 
super(); 
} 
@Override 
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
request.getRequestDispatcher("view/register.jsp").forward(request, response); 
} 
@Override 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
String userName = request.getParameter("userName"); 
String email = request.getParameter("email"); 
String password = request.getParameter("password"); 
String phoneNo = request.getParameter("phoneNo"); 
int roleID = Integer.parseInt(request.getParameter("roleID")); 
UserDAO userDAO = new UserDAO(); 
boolean isRegistered = userDAO.registerUser(userName, email, password, phoneNo, roleID); 
if (isRegistered) { 
response.sendRedirect("view/login.jsp"); 
} else { 
request.setAttribute("error", "Registration failed. Please try again."); 
request.getRequestDispatcher("view/register.jsp").forward(request, response); 
} 
} 
} 
