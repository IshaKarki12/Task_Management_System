package controller;

import dao.TaskDAO;
import model.Task;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/AdminEditTaskServlet")
public class AdminEditTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskIdParam = request.getParameter("taskID");
        Task task = null;

        if (taskIdParam != null && !taskIdParam.isEmpty()) {
            try {
                int taskId = Integer.parseInt(taskIdParam);
                TaskDAO taskDAO = new TaskDAO();
                task = taskDAO.getTaskById(taskId); // Get task by ID
            } catch (Exception e) {
                response.getWriter().println("<h3>Error: Invalid task ID.</h3>");
                return;
            }
        }

        if (task == null) {
            response.getWriter().println("<h3>Error: Task not found.</h3>");
            return;
        }

        // Set task as a request attribute to display it in the form
        request.setAttribute("task", task);
        // Forward to the Admin Edit Task JSP page
        request.getRequestDispatcher("/view/admin-edit-task.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskID"));
        String taskName = request.getParameter("taskName");
        String taskDescription = request.getParameter("taskDescription");
        String status = request.getParameter("status");
        String dueDate = request.getParameter("dueDate");

        Task updatedTask = new Task();
        updatedTask.setTaskID(taskId);
        updatedTask.setTaskName(taskName);
        updatedTask.setTaskDescription(taskDescription);
        updatedTask.setStatus(status);
        updatedTask.setDueDate(Date.valueOf(dueDate)); // Converts to java.sql.Date

        TaskDAO dao = new TaskDAO();
        boolean success = dao.updateTask(updatedTask);

        if (success) {
            // Redirect to admin task list page after successful update
            response.sendRedirect(request.getContextPath() + "/view/manage-tasks.jsp");
        } else {
            response.getWriter().println("Failed to update task.");
        }
    }
}
