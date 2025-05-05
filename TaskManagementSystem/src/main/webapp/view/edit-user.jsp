<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%
    String userIDParam = request.getParameter("userID");
    User user = null;

    if (userIDParam != null && !userIDParam.isEmpty()) {
        try {
            int userID = Integer.parseInt(userIDParam);
            UserDAO dao = new UserDAO();
            user = dao.getUserById(userID);
        } catch (Exception e) {
            out.println("<h3>Error: Invalid user ID.</h3>");
            return;
        }
    }

    if (user == null) {
        out.println("<h3>Error: User not found.</h3>");
        return;
    }
%>

<html>
<head><title>Edit User</title></head>
<body>
    <h2>Edit User</h2>
    <form action="../EditUserServlet" method="post">
    <input type="hidden" name="userID" value="<%= user.getUserID() %>" />
    
    <label for="userName">Username:</label>
    <input type="text" name="userName" value="<%= user.getUserName() %>" required /><br><br>

    <label for="email">Email:</label>
    <input type="email" name="email" value="<%= user.getEmail() %>" required /><br><br>

    <label for="phoneNo">Phone Number:</label>
    <input type="text" name="phoneNo" value="<%= user.getPhoneNo() %>" required /><br><br>

    <label for="roleID">Role:</label>
    <select name="roleID" required>
        <option value="1" <%= user.getRoleID() == 1 ? "selected" : "" %>>Admin</option>
        <option value="2" <%= user.getRoleID() == 2 ? "selected" : "" %>>User</option>
    </select><br><br>

    <button type="submit">Update</button>
</form>

</body>
</html>
