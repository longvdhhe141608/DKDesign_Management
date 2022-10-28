package DkDesignManagement.Entity;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Employee {
    private int idEmp;
    private String name;
    private String gender;
    private int age;
    private String mail;
    private String phone;
    private String cccd;
}
