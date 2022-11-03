package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Task;
import DkDesignManagement.Mapper.MapperTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
/*
 * TaskDAO xu ly 2 bang big_task va task
 * TaskDAO co the xem toan bo task va big_task theo project_id, xem detail task theo task_id
 * TaskDAO co them moi big_task, task, sub-task(task co khoa ngoai la 1 task cu)
 *
 */

@Repository
public class TaskDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Lay ra toan bo big_task trong project
    public List<Task> getAllBigTaskInProject(int project_id) {

        String sql = "SELECT *,(SELECT project_name FROM project WHERE id = ?) as projectname FROM big_task where big_task.project_id = ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), project_id, project_id);
        return taskList;
    }

    //Lay ra toan bo task cua mot account
    public List<Task> getAllTaskInPhaseByAssignedUser(int acc_id) {

        String sql = "SELECT *,task.big_task_id as task_in_phase,\n" + "                (SELECT project.project_name from project where project.id = (SELECT big_task.project_id from big_task where big_task.id = task_in_phase)) as projectname\n" + "                FROM task where task.assigned_to = ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), acc_id);
        return taskList;
    }

    // Lay ra task trong 1 big task
    public List<Task> getAllTaskInBigTask(int big_task_id) {

        String sql = "SELECT *,(SELECT project_name FROM project WHERE id = (SELECT big_task.project_id from big_task where big_task.id = ?)) as projectname FROM task where big_task_id = ? and task_id is null";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), big_task_id, big_task_id);
        return taskList;
    }

    // lay ra sub task trong 1 task
    public List<Task> getAllSubTaskInTask(int big_task_id, int task_id) {

        String sql = "SELECT *,(SELECT project_name FROM project WHERE id = (SELECT big_task.project_id from big_task where big_task.id = ?)) as projectname FROM task where big_task_id = ? and task_id = ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), big_task_id, big_task_id, task_id);
        return taskList;
    }

    //tao big task moi ma co assign cho designer luon
    public void addNewBigTaskHasAssignTo(int id, Date start_date, Date deadline, String description, int project_id, int creator, int assigned_to) {

        String sql = "INSERT INTO `dkmanagement`.`big_task` \n" + "(`id`, `start_date`, `deadline`, `description`, `project_id`, `creator`, `assigned_to`) \n" + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            jdbcTemplate.update(sql, id, start_date, deadline, description, project_id, creator, assigned_to);
        } catch (Exception e) {

        }

    }

    // tao big task moi ma chua assign cho designer
    public void addNewBigTaskHasNotAssigned(int id, Date start_date, Date deadline, String description, int project_id, int creator) {
        int task = 0;
        String sql = "INSERT INTO `dkmanagement`.`big_task` \n" + "(`id`, `start_date`, `deadline`, `description`, `project_id`, `creator`) \n" + "VALUES (?, ?, ?, '?', ?, ?)";
        try {
            jdbcTemplate.update(sql, id, start_date, deadline, description, project_id, creator);
        } catch (Exception e) {

        }

    }

    //assign mot big task cho member
    public void assignNewTaskToNewMember(int id, int assign_to) {
        String sql = "UPDATE `dkmanagement`.`big_task` SET `assigned_to` = ? WHERE (`id` = ?)";
        try {
            jdbcTemplate.update(sql, assign_to, id);
        } catch (Exception e) {

        }
    }

    // xoa BigTask theo ID
    public void deleteBigTaskById(int id) {
        String sql = "DELETE FROM `dkmanagement`.`big_task` WHERE (`id` = ?);\n";
        try {
            jdbcTemplate.update(sql, id);
        } catch (Exception e) {

        }
    }

    // Leader them mot task moi trong big_task va assign cho member
    public void createNewTaskAndAssignToMember(int id, int big_task_id, int creator, int assignedto, String task_name, Date start_date, Date deadline, String description) {
        String sql = "INSERT INTO `dkmanagement`.`task` \n" + "(`id`, `big_task_id`, `creator`, `assignedto`, `task_name`, `task_status`, `starting_date`, `deadline`, `description`) \n" + "VALUES (?, ?, ?, ?, ?, 2 , ?, ?, ?)";
        try {
            jdbcTemplate.update(sql, id, big_task_id, creator, assignedto, task_name, start_date, deadline, description);
        } catch (Exception e) {

        }
    }

    /*
     * Leader them mot task moi trong big_task ma chua assign cho member
     * status mac dinh la 1 (pending)
     * creator =  leader_id, assigned_to = null
     */
    public void createNewTaskNotAssigned(int id, int big_task_id, int creator, int assignedto, String task_name, Date start_date, Date deadline, String description) {
        String sql = "INSERT INTO `dkmanagement`.`task` \n" + "(`id`, `big_task_id`, `creator`, `task_name`, `task_status`, `starting_date`, `deadline`, `description`) \n" + "VALUES (?, ?, ?, ?, 1 , ?, ?, ?)";
        try {
            jdbcTemplate.update(sql, id, big_task_id, creator, assignedto, task_name, start_date, deadline, description);
        } catch (Exception e) {

        }
    }

    /*
     * member assign a task that no one has assigned yet
     * update assignTo = member_id
     */
    public void assignTaskByMember(int id, int assignedTo) {
        String sql = "UPDATE `dkmanagement`.`task` SET ? = NULL WHERE (`id` = ?)";
        jdbcTemplate.update(sql, id, assignedTo);
    }

    /*
     * Member tu tao task moi trong big_task
     * status mac dinh la 1 (pending)
     * creator = assignedTo = member_id
     */
    public void createNewTaskByMember(int id, int big_task_id, int creator, int assignedTo, String task_name, Date start_date, Date deadline, String description) {
        String sql = "INSERT INTO `dkmanagement`.`task` \n" + "(`id`, `big_task_id`, `creator`, `assignedto`, `task_name`, `task_status`, `starting_date`, `deadline`, `description`) \n" + "VALUES (?, ?, ?, ?, ?, 1, ?, ?, ?)";
        jdbcTemplate.update(sql, id, big_task_id, creator, assignedTo, task_name, start_date, deadline, description);
    }

    /*
     * Update task_status theo trang thai hien tai cua cong viec
     * Member set trang thai task tu dang lam thanh hoan thanh -> 2(doing) -> 3(done)
     * Leader accept task da hoan thanh -> status tu 3(done) thanh 4(accept)
     * Leader reject task da hoan thanh -> status tu 3(done) thanh 5(reject)
     * Member retry task bi reject -> status tu 5(reject) thanh 2(doing)
     */
    public void updateTaskStatus(int id, int status) {
        String sql = "UPDATE `dkmanagement`.`task` SET `task_status` = ? WHERE (`id` = ?)";
        jdbcTemplate.update(sql, id, status);
    }
}
