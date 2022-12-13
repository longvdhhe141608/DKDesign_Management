package DkDesignManagement.Model;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DashboardResponse {

    private int projectId;

    //Tổng số công việc
    int countTask;
    //Công việc đang làm
    int countSubTaskProcess;
    //Công việc hoàn thành đúng hạn
    int countCorrectDeadline;
    //Công việc trễ hạn
    int countOverDeadline;
    //Công việc hoàn thành chậm tiến độ
    int countOverDeadlineDoneTask;

}
