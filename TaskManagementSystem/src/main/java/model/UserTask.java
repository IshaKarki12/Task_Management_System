package model;

public class UserTask {
    private int userID;
    private int taskID;

    public UserTask() {
    }

    public UserTask(int userID, int taskID) {
        this.userID = userID;
        this.taskID = taskID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getTaskID() {
        return taskID;
    }

    public void setTaskID(int taskID) {
        this.taskID = taskID;
    }

    @Override
    public String toString() {
        return "UserTask{" +
                "userID=" + userID +
                ", taskID=" + taskID +
                '}';
    }
}
