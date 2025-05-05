package controller;

import dao.TaskDAO;
import model.Task;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/EditTaskServlet")
public class EditTaskServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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
        	response.sendRedirect(request.getContextPath() + "/view/my-tasks.jsp");

        } else {
            response.getWriter().println("Failed to update task.");
        }
    }
}