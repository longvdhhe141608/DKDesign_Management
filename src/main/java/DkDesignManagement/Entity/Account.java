package DkDesignManagement.Entity;

import lombok.*;
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Account {
    private int id;
    private String username;
    private String password;
    private int role_id;
    private int status;
    private String avatar_url;

    public Account(String nameAcc, String passAcc) {
        this.username = nameAcc;
        this.password = passAcc;
    }
}
