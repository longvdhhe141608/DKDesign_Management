package Model;

import java.util.Date;

public class Task {
    private int idTask;
    private int idPhase;
    private int idTaskf;
    private String taskName;
    private String taskStatus;
    private Date startDate;
    private Date deadline;
    private String taskGallery;
    private String taskCreator;

    public int getIdTask() {
        return idTask;
    }

    public void setIdTask(int idTask) {
        this.idTask = idTask;
    }

    public int getIdPhase() {
        return idPhase;
    }

    public void setIdPhase(int idPhase) {
        this.idPhase = idPhase;
    }

    public int getIdTaskf() {
        return idTaskf;
    }

    public void setIdTaskf(int idTaskf) {
        this.idTaskf = idTaskf;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(String taskStatus) {
        this.taskStatus = taskStatus;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public String getTaskGallery() {
        return taskGallery;
    }

    public void setTaskGallery(String taskGallery) {
        this.taskGallery = taskGallery;
    }

    public String getTaskCreator() {
        return taskCreator;
    }

    public void setTaskCreator(String taskCreator) {
        this.taskCreator = taskCreator;
    }
}
