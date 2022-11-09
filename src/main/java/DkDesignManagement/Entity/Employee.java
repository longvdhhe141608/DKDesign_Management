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

    public Employee(int id, String address, int gender, Date dob, String cccd, String email, String phone) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.address = address;
        this.gender = gender;
        this.dob = dob;
        this.cccd = cccd;
        this.mail = email;
        this.phone = phone;
    }


}
