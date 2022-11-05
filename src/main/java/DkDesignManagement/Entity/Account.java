package DkDesignManagement.Entity;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Account {
    private int id;
    private String username;
    private String password;
    private int role_id;
    private int status;

    public Account(String nameAcc, String passAcc) {
        this.username = nameAcc;
        this.password = passAcc;
    }
}
