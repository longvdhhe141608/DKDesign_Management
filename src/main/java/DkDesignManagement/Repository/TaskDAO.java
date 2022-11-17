package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Section;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Entity.Tasks;
import DkDesignManagement.Mapper.MapperSection;
import DkDesignManagement.Mapper.MapperTask;
import DkDesignManagement.Mapper.MapperTasks;
import DkDesignManagement.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
/*
 * TaskDAO xu ly 2 bang big_task va task
 * TaskDAO co the xem toan bo task va big_task theo project_id, xem detail task theo task_id
 * TaskDAO co them moi big_task, task, sub-task(task co khoa ngoai la 1 task cu)
 * task_status :
 * 1 - pending
 * 2 - doing
 * 3 - done
 * 4 - approved
 * 5 - rejected
 */

@Repository
public class TaskDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    // Lay ra toan bo big_task trong project
    public List<Task> getAllBigTaskInProject(int project_id) {

        String sql = "SELECT *,(SELECT project_name FROM project WHERE id = ?) as projectName, " +
                "null as big_task_id, " +
                "null as task_id " +
                "FROM section where section.project_id = ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), project_id, project_id);
        return taskList;
    }

    public List<Task> getAllTaskLevel2() {

        String sql = "select * from task t where t.task_id is null";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask());
        return taskList;
    }

    public List<Task> getTaskByBigTaskId(int sectionId) {

        String sql = "select t.* from section s ,task t where s.id =t.section_id  and s.id  = ? and t.task_id is null ";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), sectionId);
        return taskList;
    }

    public Task getTaskById(int taskId){

        Task task = new Task();
        String sql = "select * from task t where t.id  = ? ";

        try {
            task = jdbcTemplate.queryForObject(sql, new MapperTask(),taskId);
            return task;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Task> getListSubTask(int taskId) {

        String sql = "select * from task t where t.task_id = ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), taskId);
        return taskList;
    }

    //Lay ra toan bo task cua mot account
    public List<Task> getAllTaskInPhaseByAssignedUser(int acc_id) {

        String sql = "SELECT *,task.section_id as task_in_phase, " + "(SELECT project.project_name from project where project.id = (SELECT section.project_id from section where section.id = task_in_phase)) as projectname " + "FROM task where task.assignedto = ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), acc_id);
        return taskList;
    }

    // Lay ra task trong 1 big task
    public List<Task> getAllTaskInBigTask(int big_task_id) {

        String sql = "SELECT *,(SELECT project_name FROM project WHERE id = (SELECT section.project_id from section where section.id = ?)) as projectname FROM task where section_id = ? and task_id is null";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), big_task_id, big_task_id);
        return taskList;
    }

    // lay ra sub task trong 1 task
    public List<Task> getAllSubTaskInTask(int big_task_id, int task_id) {

        String sql = "SELECT *," +
                "(SELECT project_name " +
                "FROM project " +
                "WHERE id = (SELECT section.project_id from section where section.id = ?)" +
                ") as projectname " +
                "FROM task WHERE section_id = ? AND task_id = ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), big_task_id, big_task_id, task_id);
        return taskList;
    }

    //tao big task moi ma co assign cho designer
    public void addNewBigTaskHasAssignTo(Date start_date, Date deadline, String description, int project_id, int creator, int assigned_to) {

        String sql = "INSERT INTO `dkmanagement`.`big_task` \n" +
                "(`start_date`, `deadline`, `description`, `project_id`, `creator`, `assigned_to`)" +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            jdbcTemplate.update(sql, start_date, deadline, description, project_id, creator, assigned_to);
        } catch (Exception e) {

        }

    }

    // tao big task moi ma chua assign cho designer
    public void addNewBigTaskHasNotAssigned(Date start_date, Date deadline, String description, int project_id, int creator) {
        int task = 0;
        String sql = "INSERT INTO `dkmanagement`.`big_task` " +
                "(`start_date`, `deadline`, `description`, `project_id`, `creator`) " +
                "VALUES (?,?,?,?,?);\n";

        jdbcTemplate.update(sql, start_date, deadline, description, project_id, creator);

    }

    //assign mot big task cho member
    public void assignNewTaskToNewMember(int id, int assigned_to) {
        String sql = "UPDATE `dkmanagement`.`big_task` SET `assigned_to` = ? WHERE (`id` = ?)";
        try {
            jdbcTemplate.update(sql, assigned_to, id);
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
    public void createNewTaskAndAssignToMember(int big_task_id, int creator, int assignedto, String task_name, Date start_date, Date deadline, String description) {
        String sql = "INSERT INTO `dkmanagement`.`task` \n" + "(`big_task_id`, `creator`, `assignedto`, `task_name`, `task_status`, `starting_date`, `deadline`, `description`) \n" + "VALUES (?, ?, ?, ?, ?, 2 , ?, ?)";
        try {
            jdbcTemplate.update(sql, big_task_id, creator, assignedto, task_name, start_date, deadline, description);
        } catch (Exception e) {

        }
    }

    /*
     * Leader them mot task moi trong big_task ma chua assign cho member
     * status mac dinh la 1 (pending)
     * creator =  leader_id, assigned_to = null
     */
    public void createNewTaskNotAssigned(int big_task_id, int creator, int assignedto, String task_name, Date start_date, Date deadline, String description) {
        String sql = "INSERT INTO `dkmanagement`.`task` \n" + "(`big_task_id`, `creator`, `task_name`, `task_status`, `starting_date`, `deadline`, `description`) " +
                "VALUES (?, ?, ?, 1 , ?, ?, ?)";
        try {
            jdbcTemplate.update(sql, big_task_id, creator, assignedto, task_name, start_date, deadline, description);
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
    public void createNewTaskByMember(int big_task_id, int creator, int assignedTo, String task_name, Date start_date, Date deadline, String description) {
        String sql = "INSERT INTO `dkmanagement`.`task` \n" + "(`big_task_id`, `creator`, `assignedto`, `task_name`, `task_status`, `starting_date`, `deadline`, `description`) \n" + "VALUES (?, ?, ?, ?, 1, ?, ?, ?)";
        jdbcTemplate.update(sql, big_task_id, creator, assignedTo, task_name, start_date, deadline, description);
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

    public int addTask(Task task) {
        String sql = "INSERT INTO dkmanagement.task\n" +
                "(project_id, section_id, task_id, creator, assignedto, requirement_id" +
                ", task_name, starting_date, deadline, ended_date, number_of_file, description, status)\n" +
                "VALUES(:project_id, :section_id, :task_id, :creator, :assignedto, :requirement_id " +
                " , :task_name , :starting_date , :deadline , :ended_date , :number_of_file, :description, :status);";

        Map<String, Object> params = new HashMap<>();
        params.put("project_id", task.getProjectId());
        params.put("section_id", task.getSectionId());
        params.put("task_id", task.getTaskfId());
        params.put("creator", task.getCreatorId());
        params.put("assignedto", task.getAssignToId());
        params.put("requirement_id", task.getRequirementId());
        params.put("task_name", task.getTaskName());
        params.put("starting_date", task.getStartDate());
        params.put("deadline", task.getDeadline());
        params.put("ended_date", task.getEndDate());
        params.put("number_of_file", task.getFileNumber());
        params.put("description", task.getDescription());
        params.put("status", task.getTaskStatus());

        GeneratedKeyHolder generatedKeyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(params), generatedKeyHolder);
        return generatedKeyHolder.getKey().intValue();
    }


    public List<Tasks> getAllTasksByProjectIDAndSectionID(int projectID, int sectionID) {
        List<Tasks> tasksList = new ArrayList<>();
        String sql = "SELECT t.*, a.username, r.requirement_name FROM section s\n" +
                "left join project p on s.project_id = p.id \n" +
                "left join task t on s.id = t.section_id\n" +
                "left join project_participation pp on p.id = pp.project_id \n" +
                "left join accounts a on a.id = t.assignedto \n" +
                "left join employees e on a.id =e.id_acc\n" +
                "left join requirement r on p.id = r.project_id\n" +
                "where s.project_id= ? AND t.section_id= ? AND t.task_id is null \n" +
                "Group By t.id;";

        try {
            tasksList = jdbcTemplate.query(sql, new MapperTasks(), projectID, sectionID);
            return tasksList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Tasks> getAllSubTasksByProjectIDAndSectionIDAndTaskID(int projectID, int sectionID, int taskID) {
        List<Tasks> tasksList = new ArrayList<>();
        String sql = "SELECT t.*, a.username, r.requirement_name FROM section s\n" +
                "left join project p on s.project_id = p.id \n" +
                "left join task t on s.id = t.section_id\n" +
                "left join project_participation pp on p.id = pp.project_id \n" +
                "left join accounts a on a.id = t.assignedto \n" +
                "left join requirement r on p.id = r.project_id\n" +
                "left join employees e on a.id =e.id_acc\n" +
                "where s.project_id= ? AND t.section_id= ? AND t.task_id= ?\n" +
                "Group By t.id;";
        try {

            tasksList = jdbcTemplate.query(sql, new MapperTasks(), projectID, sectionID, taskID);
            return tasksList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Tasks getOneTasksByTaskID(int taskID) {

        Tasks tasks = new Tasks();
        String sql = "SELECT t.*,a.username, r.requirement_name FROM section s\n" +
                "                left join project p on s.project_id = p.id \n" +
                "                left join task t on s.id = t.section_id\n" +
                "                left join project_participation pp on p.id = pp.project_id\n" +
                "                left join accounts a on a.id = pp.project_id\n" +
                "                left join employees e on a.id =e.id_acc\n" +
                "                left join requirement r on p.id = r.project_id\n" +
                "                where t.id = ? AND t.task_id is null\n" +
                "                Group By t.id;";
        try {
            tasks = jdbcTemplate.queryForObject(sql, new MapperTasks(), taskID);
            return tasks;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Tasks getOneSubTaskBySubTaskID(int subTaskID, int taskID) {

        Tasks tasks = new Tasks();
        String sql = "SELECT t.*, a.username, r.requirement_name FROM section s\n" +
                "left join project p on s.project_id = p.id\n" +
                "left join task t on s.id = t.section_id\n" +
                "left join project_participation pp on p.id = pp.project_id\n" +
                "left join accounts a on a.id = pp.project_id\n" +
                "left join employees e on a.id =e.id_acc\n" +
                "left join requirement r on p.id = r.project_id\n" +
                "where t.id = ? AND t.task_id = ?\n" +
                "Group By t.id";
        try {
            tasks = jdbcTemplate.queryForObject(sql, new MapperTasks(), subTaskID, taskID);
            return tasks;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int insertSubTaskByDesign(Tasks tasks) {
        int check = 0;

        String sql = "INSERT INTO `dkmanagement`.`task` (`project_id`, `section_id`, `task_id`, `creator`," +
                " `assignedto`, `requirement_id`, `task_name`, `starting_date`, `deadline`, `number_of_file`, `status`)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);\n";

        try {
            check = jdbcTemplate.update(sql, tasks.getProjectID(), tasks.getSectionID(), tasks.getTaskID(), tasks.getCreator(), tasks.getAssignedTo(),
                    tasks.getRequirementID(), tasks.getTaskName(), tasks.getStartingDate(), tasks.getDeadline(), tasks.getNumberOfFile(), tasks.getStatus());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
}
