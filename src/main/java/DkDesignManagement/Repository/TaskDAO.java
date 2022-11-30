package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Section;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Entity.Tasks;
import DkDesignManagement.Mapper.*;
import DkDesignManagement.model.MyTaskDto;
import DkDesignManagement.model.TaskWaitDto;
import DkDesignManagement.utils.Constant;
import DkDesignManagement.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.util.ObjectUtils;

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

    public List<Task> getAllSubTask(int pageNumber, int page, int projectId, String status, String name, String accountId) {

        String sql = "select * from task t where (1=1) and t.project_id = " + projectId + "  ";

        if (!ObjectUtils.isEmpty(status)) {
            sql += " and (status = " + status + " or status = 5) ";
        }

        if (!ObjectUtils.isEmpty(name)) {
            sql += " and task_name like '%" + name + "%' ";
        }
        if (!ObjectUtils.isEmpty(accountId)) {
            sql += " and assignedto = " + accountId + " ";
        }

        sql += " order by starting_date desc  LIMIT " + pageNumber + " OFFSET " + (page - 1) * pageNumber;

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask());
        return taskList;
    }

    public List<Task> getAllSubTaskViewProcess(int pageNumber, int page, int projectId) {

        String sql = "select * from task t where (1=1) and t.project_id = " + projectId + "   and t.task_id is not null ";

        sql += " order by id  LIMIT " + pageNumber + " OFFSET " + (page - 1) * pageNumber;

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask());
        return taskList;
    }

    public int countSubTask(int projectId, String status, String name, String accountId) {
        String sql = "select count(*)  from task t where (1=1) and t.project_id = " + projectId + " ";

        if (!ObjectUtils.isEmpty(status)) {
            sql += " and ( status = " + status + " or status = 5) ";
        }
        if (!ObjectUtils.isEmpty(name)) {
            sql += " and task_name like '%" + name + "%' ";
        }
        if (!ObjectUtils.isEmpty(accountId)) {
            sql += " and assignedto = " + accountId + " ";
        }

        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public int countSubTaskViewProcess(int projectId) {
        String sql = "select count(*)  from task t where (1=1) and t.project_id = " + projectId + "  and t.task_id is not null  ";

        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public int countFile(int taskId) {
        String sql = "select count(*) from image_and_file iaf where task_id = ? ";
        return jdbcTemplate.queryForObject(sql, Integer.class, taskId);
    }

    public List<Task> getTaskByBigTaskId(int sectionId) {

        String sql = "select t.* from section s ,task t where s.id =t.section_id  and s.id  = ? and t.task_id is null ";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), sectionId);
        return taskList;
    }

    public List<Task> getAllTaskByRequirementId(int requirementId) {

        String sql = "select * from task t where t.requirement_id =? and t.task_id  is not null";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), requirementId);
        return taskList;
    }

    public Task getTaskById(int taskId) {

        Task task = new Task();
        String sql = "select * from task t where t.id  = ? ";

        try {
            task = jdbcTemplate.queryForObject(sql, new MapperTask(), taskId);
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

    //tao big task moi ma co assign cho designer luon
//    public void addNewBigTaskHasAssignTo(Date start_date, Date deadline, String description, int project_id, int creator, int assigned_to) {
//
//        String sql = "INSERT INTO `dkmanagement`.`big_task` \n" +
//                "(`start_date`, `deadline`, `description`, `project_id`, `creator`, `assigned_to`)" +
//                "VALUES (?, ?, ?, ?, ?, ?)";
//        try {
//            jdbcTemplate.update(sql, start_date, deadline, description, project_id, creator, assigned_to);
//        } catch (Exception e) {
//
//        }
//
//    }

    // tao big task moi ma chua assign cho designer
//    public void addNewBigTaskHasNotAssigned(Date start_date, Date deadline, String description, int project_id, int creator) {
//        int task = 0;
//        String sql = "INSERT INTO `dkmanagement`.`big_task` " +
//                "(`start_date`, `deadline`, `description`, `project_id`, `creator`) " +
//                "VALUES (?,?,?,?,?);\n";
//
//        jdbcTemplate.update(sql, start_date, deadline, description, project_id, creator);
//
//    }

    //assign mot big task cho member
//    public void assignNewTaskToNewMember(int id, int assigned_to) {
//        String sql = "UPDATE `dkmanagement`.`big_task` SET `assigned_to` = ? WHERE (`id` = ?)";
//        try {
//            jdbcTemplate.update(sql, assigned_to, id);
//        } catch (Exception e) {
//
//        }
//    }

    // xoa BigTask theo ID
//    public void deleteBigTaskById(int id) {
//        String sql = "DELETE FROM `dkmanagement`.`big_task` WHERE (`id` = ?);\n";
//        try {
//            jdbcTemplate.update(sql, id);
//        } catch (Exception e) {
//
//        }
//    }

    // Leader them mot task moi trong big_task va assign cho member
//    public void createNewTaskAndAssignToMember(int big_task_id, int creator, int assignedto, String task_name, Date start_date, Date deadline, String description) {
//        String sql = "INSERT INTO `dkmanagement`.`task` \n" + "(`big_task_id`, `creator`, `assignedto`, `task_name`, `task_status`, `starting_date`, `deadline`, `description`) \n" + "VALUES (?, ?, ?, ?, ?, 2 , ?, ?)";
//        try {
//            jdbcTemplate.update(sql, big_task_id, creator, assignedto, task_name, start_date, deadline, description);
//        } catch (Exception e) {
//
//        }
//    }

    /*
     * Leader them mot task moi trong big_task ma chua assign cho member
     * status mac dinh la 1 (pending)
     * creator =  leader_id, assigned_to = null
     */
//    public void createNewTaskNotAssigned(int big_task_id, int creator, int assignedto, String task_name, Date start_date, Date deadline, String description) {
//        String sql = "INSERT INTO `dkmanagement`.`task` \n" + "(`big_task_id`, `creator`, `task_name`, `task_status`, `starting_date`, `deadline`, `description`) " +
//                "VALUES (?, ?, ?, 1 , ?, ?, ?)";
//        try {
//            jdbcTemplate.update(sql, big_task_id, creator, assignedto, task_name, start_date, deadline, description);
//        } catch (Exception e) {
//
//        }
//    }

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
//    public void createNewTaskByMember(int big_task_id, int creator, int assignedTo, String task_name, Date start_date, Date deadline, String description) {
//        String sql = "INSERT INTO `dkmanagement`.`task` \n" + "(`big_task_id`, `creator`, `assignedto`, `task_name`, `task_status`, `starting_date`, `deadline`, `description`) \n" + "VALUES (?, ?, ?, ?, 1, ?, ?, ?)";
//        jdbcTemplate.update(sql, big_task_id, creator, assignedTo, task_name, start_date, deadline, description);
//    }

    /*
     * Update task_status theo trang thai hien tai cua cong viec
     * Member set trang thai task tu dang lam thanh hoan thanh -> 2(doing) -> 3(done)
     * Leader accept task da hoan thanh -> status tu 3(done) thanh 4(accept)
     * Leader reject task da hoan thanh -> status tu 3(done) thanh 5(reject)
     * Member retry task bi reject -> status tu 5(reject) thanh 2(doing)
     */
    public void updateTaskStatus(int id, int status) {
        String sql = "UPDATE `dkmanagement`.`task` SET `status` = ? WHERE (`id` = ?)";
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
                "where s.project_id= ? AND t.section_id= ? AND t.task_id= ?\n AND t.status != 5 " +
                "Group By t.id;";
        try {

            tasksList = jdbcTemplate.query(sql, new MapperTasks(), projectID, sectionID, taskID);
            return tasksList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Tasks> getTotalFileSubTasksByProjectIDAndSectionIDAndTaskID(int projectID, int sectionID, int taskID) {
        List<Tasks> tasksList = new ArrayList<>();
        String sql = "SELECT t.*, a.username, r.requirement_name FROM section s\n" +
                "left join project p on s.project_id = p.id \n" +
                "left join task t on s.id = t.section_id\n" +
                "left join project_participation pp on p.id = pp.project_id \n" +
                "left join accounts a on a.id = t.assignedto \n" +
                "left join requirement r on p.id = r.project_id\n" +
                "left join employees e on a.id =e.id_acc\n" +
                "where s.project_id= ? AND t.section_id= ? AND t.task_id= ?\n AND (t.status = 2 or t.status = 3 or t.status = 4 ) " +
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
        String sql = "SELECT t.*, a.username, r.requirement_name FROM section s\n" +
                "                left join project p on s.project_id = p.id \n" +
                "                left join task t on s.id = t.section_id\n" +
                "                left join project_participation pp on p.id = pp.project_id\n" +
                "                left join accounts a on a.id = t.assignedto\n" +
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
                "left join accounts a on a.id = t.assignedto\n" +
                "left join employees e on a.id =e.id_acc\n" +
                "left join requirement r on p.id = r.project_id\n" +
                "where t.id = ? AND t.task_id = ? \n" +
                "Group By t.id";
        try {
            tasks = jdbcTemplate.queryForObject(sql, new MapperTasks(), subTaskID, taskID);
            return tasks;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

//    public int insertSubTaskByDesign(Tasks tasks) {
//        int check = 0;
//
//        String sql = "INSERT INTO `dkmanagement`.`task` (`project_id`, `section_id`, `task_id`, `creator`," +
//                " `assignedto`, `requirement_id`, `task_name`, `starting_date`, `deadline`, `number_of_file`, `status`)" +
//                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);\n";
//
//        try {
//            check = jdbcTemplate.update(sql, tasks.getProjectID(), tasks.getSectionID(), tasks.getTaskID(), tasks.getCreator(), tasks.getAssignedTo(),
//                    tasks.getRequirementID(), tasks.getTaskName(), tasks.getStartingDate(), tasks.getDeadline(), tasks.getNumberOfFile(), tasks.getStatus());
//
//            GeneratedKeyHolder generatedKeyHolder = new GeneratedKeyHolder();
//            namedParameterJdbcTemplate.update(sql, generatedKeyHolder);
//            return generatedKeyHolder.getKey().intValue();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return check;
//    }

    public int updateTask(Task task) {
        String sql = "UPDATE dkmanagement.task\n" +
                "SET project_id=:project_id, section_id=:section_id, task_id=:task_id , creator=:creator , assignedto=:assignedto" +
                ", requirement_id=:requirement_id, task_name=:task_name, starting_date=:starting_date, deadline=:deadline " +
                ", ended_date=:ended_date, number_of_file=:number_of_file, description=:description, status=:status\n" +
                "WHERE id=:taskId;\n";

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
        params.put("taskId", task.getTaskId());

        return namedParameterJdbcTemplate.update(sql, params);
    }

    public int updateSubTaskByDesign(int subTaskID, Tasks tasks) {

        int check = 0;
        String sql = "UPDATE `dkmanagement`.`task` SET `task_name` = ?," +
                " `starting_date` = ?, `deadline` = ?," +
                " `number_of_file` = ? WHERE (`id` = ?);\n";

        try {
            check = jdbcTemplate.update(sql, tasks.getTaskName(), tasks.getStartingDate(), tasks.getDeadline(),
                    tasks.getNumberOfFile(), subTaskID);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public int totalTaskWait(int projectID, int statusID, String textSearch, int accID) {

        int totalPage = 0;
        List<TaskWaitDto> waitDtoList = new ArrayList<>();
        String sql = "SELECT t.task_name, a.username, t.starting_date, t.deadline," +
                " t.number_of_file, st.status_task, t.status, t.description FROM dkmanagement.task t\n" +
                "left join project p on t.project_id = p.id\n" +
                "left join section s on t.section_id = s.id\n" +
                "left join accounts a on t.assignedto = a.id\n" +
                "left join status st on t.status = st.id where t.project_id = ? AND t.assignedto =?\n";

        if (!ObjectUtils.isEmpty(statusID) && statusID != 0) {
            sql += " and t.status =  " + statusID;
        }

        if (!ObjectUtils.isEmpty(textSearch)) {
            sql += " and t.task_name like '%" + textSearch + "%' ";
        }

        sql += " group by t.id";

        try {
            waitDtoList = jdbcTemplate.query(sql, new MapperTaskWaitDto(), projectID, accID);
            totalPage = waitDtoList.size();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return totalPage;
    }

    public List<TaskWaitDto> getAllTaskWaitByDesign(int projectID, int indexPage, int statusID, String textSearch, int accID) {

        List<TaskWaitDto> waitDtoList = new ArrayList<>();

        String sql = "SELECT t.task_name, a.username, t.starting_date, t.deadline," +
                " t.number_of_file, st.status_task, t.status, t.description FROM dkmanagement.task t\n" +
                "left join project p on t.project_id = p.id\n" +
                "left join section s on t.section_id = s.id\n" +
                "left join accounts a on t.assignedto = a.id\n" +
                "left join status st on t.status = st.id where t.project_id = ? AND t.assignedto =? \n";

        if (!ObjectUtils.isEmpty(statusID) && statusID != 0) {
            sql += " and t.status =  " + statusID;
        }

        if (!ObjectUtils.isEmpty(textSearch)) {
            sql += " and t.task_name like '%" + textSearch + "%' ";
        }
//        limit ?,10
        sql += " group by t.id limit ?,10;";

        try {
            waitDtoList = jdbcTemplate.query(sql, new MapperTaskWaitDto(), projectID, accID, indexPage);
            return waitDtoList;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public int countTaskNoDone(int taskId) {
        String sql = "select count(1) from task t where t.task_id =? and status != 4";
        return jdbcTemplate.queryForObject(sql, Integer.class, taskId);
    }

    public int getTotalAllMyTask(int accID, String textSearch) {
        List<MyTaskDto> myTaskDtoList = new ArrayList<>();
        String sql = "SELECT t.task_id, t.id, t.task_name, p.project_name,\n" +
                " t.starting_date, t.deadline, t.ended_date,\n" +
                " t.status, s.status_task, t.project_id, t.section_id FROM dkmanagement.task t\n" +
                "left join project p on t.project_id = p.id\n" +
                "left join accounts a on t.assignedto = a.id " +
                "left join section sc on t.section_id = sc.id \n" +
                "left join status s on t.status = s.id where t.assignedto = ? AND (t.status in (2,3,4)) " +
                "and t.task_id is not null " +
                "group by t.id ";
        try {
            myTaskDtoList = jdbcTemplate.query(sql, new MapperMyTaskDto(), accID);
            return myTaskDtoList.size();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<MyTaskDto> getAllMyTask(int accID, int indexPage, String textSearch) {
        List<MyTaskDto> myTaskDtoList = new ArrayList<>();
        String sql = "SELECT t.task_id, t.id, t.task_name, p.project_name,\n" +
                " t.starting_date, t.deadline, t.ended_date,\n" +
                " t.status, s.status_task, t.project_id, t.section_id FROM dkmanagement.task t\n" +
                "left join project p on t.project_id = p.id\n" +
                "left join accounts a on t.assignedto = a.id " +
                "left join section sc on t.section_id = sc.id \n" +
                "left join status s on t.status = s.id where t.assignedto = ? " +
                "AND (t.status in (2,3,4)) and t.task_id is not null " +
                "group by t.id order by t.status asc limit ?, 10";
        try {
            myTaskDtoList = jdbcTemplate.query(sql, new MapperMyTaskDto(), accID, indexPage);
            return myTaskDtoList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int updateStatusSubTaskByDesign(int subTaskID, int status) {
        int check = 0;
        String sql = "UPDATE `dkmanagement`.`task` SET `status` = ? WHERE (`id` = ?);";
        try {
            check = jdbcTemplate.update(sql, status, subTaskID);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public List<Tasks> getAllSubTasksByTaskID(int taskID) {
        List<Tasks> tasksList = new ArrayList<>();
        String sql = "SELECT t.*, a.username, r.requirement_name FROM section s\n" +
                "left join project p on s.project_id = p.id \n" +
                "left join task t on s.id = t.section_id\n" +
                "left join project_participation pp on p.id = pp.project_id \n" +
                "left join accounts a on a.id = t.assignedto \n" +
                "left join requirement r on p.id = r.project_id\n" +
                "left join employees e on a.id =e.id_acc\n" +
                "where t.task_id= ?\n AND (t.status = 2 or t.status = 3 or t.status = 4 ) " +
                "Group By t.id;";
        try {

            tasksList = jdbcTemplate.query(sql, new MapperTasks(), taskID);
            return tasksList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }


    //Dash board

    public int countAllSubTaskByProjectId(int projectId) {
        String sql = " select count(1) from task t where t.project_id =? and t.task_id is not null ";
        return jdbcTemplate.queryForObject(sql, Integer.class, projectId);
    }

    public int countAllSubTaskProcess(int projectId) {
        String sql = " select count(1) from task t where t.project_id =? and t.task_id is not null and t.status = 2 ";
        return jdbcTemplate.queryForObject(sql, Integer.class, projectId);
    }

    public int countAllSubTaskCorrectDeadline(int projectId) {
        String sql = " select count(*) from task t where t.deadline >= t.ended_date and t.project_id =? ";
        return jdbcTemplate.queryForObject(sql, Integer.class, projectId);
    }

    public int countAllSubTaskOverDeadline(int projectId) {
        String sql = " select count(*) from task t \n" +
                "where (t.deadline < t.ended_date or  (t.deadline < CURDATE() and  t.ended_date is null  )) \n" +
                "and t.project_id =? \n" +
                "and t.status != 5  ";
        return jdbcTemplate.queryForObject(sql, Integer.class, projectId);
    }

    public int countAllSubTaskOverDeadlineAndFinish(int projectId) {
        String sql = " select count(*) from task t \n" +
                "where (t.deadline < t.ended_date or  (t.deadline < CURDATE() and  t.ended_date is null  )) \n" +
                "and t.project_id = ?\n" +
                "and t.status =4 ";
        return jdbcTemplate.queryForObject(sql, Integer.class, projectId);
    }

    public List<Task> getAllSubTaskExpiredToDay(int projectId) {
        List<Task> tasksList = new ArrayList<>();
        String sql = "select * from task t \n" +
                "where \n" +
                "t.project_id = ? \n" +
                "and t.deadline <= curdate() \n" +
                "and t.status != 4 \n" +
                "and t.status != 5 \n" +
                "and t.task_id is not null ";
        try {

            tasksList = jdbcTemplate.query(sql, new MapperTask(), projectId);
            return tasksList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Task> getAllSubTaskExpiredToDayDesign(int accountId) {
        List<Task> tasksList = new ArrayList<>();
        String sql = "select * from task t \n" +
                "where \n" +
                "t.assignedto = ? \n" +
                "and t.deadline <= curdate() \n" +
                "and t.status != 4 \n" +
                "and t.status != 5 \n" +
                "and t.task_id is not null ";
        try {

            tasksList = jdbcTemplate.query(sql, new MapperTask(), accountId);
            return tasksList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
