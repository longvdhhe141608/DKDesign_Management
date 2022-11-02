package DkDesignManagement.Entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Employee {
    private int id;
    private String name;
    private int age;
    private String address;
    private int gender;
    private Date dob;
    private String cccd;
    private String mail;
    private String phone;
    private int id_acc;
}
