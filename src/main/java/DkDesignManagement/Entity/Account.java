package DkDesignManagement.Entity;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Account {
    private int idAcc;
    private String nameAcc;
    private String passAcc;
    private int roleInWeb;
    private boolean status;

    public Account(String nameAcc, String passAcc) {
        this.nameAcc = nameAcc;
        this.passAcc = passAcc;
    }
}
