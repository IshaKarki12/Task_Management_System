package controller;

import dao.TaskDAO;
import model.Task;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/CreateTaskServlet")
public class CreateTaskServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 1. Get parameters from form
        String taskName = request.getParameter("taskName");
        String taskDescription = request.getParameter("taskDescription");
        String status = request.getParameter("status");
        String dueDateStr = request.getParameter("dueDate");
        String categoryIdStr = request.getParameter("categoryId");

        // 2. Validate session and get logged-in user
        HttpSession session = request.getSession(false);
        Integer userID = (session != null) ? (Integer) session.getAttribute("currentUserID") : null;

        if (userID == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 3. Handle null or invalid categoryID safely
        int categoryId = 0;
        if (categoryIdStr != null && !categoryIdStr.trim().isEmpty()) {
            try {
                categoryId = Integer.parseInt(categoryIdStr);
            } catch (NumberFormatException e) {
                response.sendRedirect("view/create-task.jsp?error=invalid_category");
                return;
            }
        } else {
            response.sendRedirect("view/create-task.jsp?error=missing_category");
            return;
        }

        // 4. Parse due date (if provided)
        LocalDate dueDate = (dueDateStr != null && !dueDateStr.trim().isEmpty()) ? LocalDate.parse(dueDateStr) : null;

        // 5. Create task object
        Task task = new Task();
        task.setTaskName(taskName);
        task.setTaskDescription(taskDescription);
        task.setStatus((status != null && !status.trim().isEmpty()) ? status : "Pending");
        task.setDueDate(dueDate != null ? Date.valueOf(dueDate) : null);
        task.setUserID(userID);
        task.setCategoryID(categoryId);

        // 6. Save task via DAO
        TaskDAO taskDAO = new TaskDAO();
        boolean success = taskDAO.createTask(task);

        // 7. Redirect based on result
        if (success) {
            response.sendRedirect("view/user-dashboard.jsp?message=task_created");
        } else {
            response.sendRedirect("view/create-task.jsp?error=task_creation_failed");
        }
    }
}
