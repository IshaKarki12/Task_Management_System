package controller;

import dao.TaskDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/AdminDeleteTaskServlet")
public class AdminDeleteTaskServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskIdParam = request.getParameter("taskId");

        if (taskIdParam != null) {
            try {
                int taskId = Integer.parseInt(taskIdParam);
                TaskDAO taskDAO = new TaskDAO();
                boolean deleted = taskDAO.deleteTask(taskId);

                if (deleted) {
                    response.sendRedirect("view/manage-tasks.jsp?msg=deleted");
                } else {
                    response.sendRedirect("view/manage-tasks.jsp?msg=notdeleted");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("view/manage-tasks.jsp?msg=invalid");
            }
        } else {
            response.sendRedirect("view/manage-tasks.jsp?msg=missing");
        }
    }
}
