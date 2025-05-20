package controller;

import model.Task;
import dao.TaskDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;


@WebServlet("/AddTaskServlet")
public class AddTaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String taskName = request.getParameter("taskName");
        String taskDescription = request.getParameter("taskDescription");
        String status = request.getParameter("status");
        Date dueDate = Date.valueOf(request.getParameter("dueDate"));
        int userID = Integer.parseInt(request.getParameter("userID")); // Get from dropdown
        int categoryID = Integer.parseInt(request.getParameter("categoryId")); // Get from dropdown

       
        

        Task task = new Task();
        task.setTaskName(taskName);
        task.setTaskDescription(taskDescription);
        task.setStatus(status);
        task.setDueDate(dueDate);
        task.setUserID(userID);
        task.setCategoryID(categoryID);

        boolean success = TaskDAO.addTask(task);

        if (success) {       	
            response.sendRedirect("view/manage-tasks.jsp");
        } else {
            request.setAttribute("error", "Failed to add task. Check console for error.");
            request.getRequestDispatcher("/view/admin-add-task.jsp").forward(request, response);
        }
        
    }}


