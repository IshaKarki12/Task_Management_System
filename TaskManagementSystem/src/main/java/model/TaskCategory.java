package model;

public class TaskCategory {
    private int taskId;
    private int categoryId;

    // Constructors
    public TaskCategory() {}

    public TaskCategory(int taskId, int categoryId) {
        this.taskId = taskId;
        this.categoryId = categoryId;
    }

    // Getters and Setters
    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}
