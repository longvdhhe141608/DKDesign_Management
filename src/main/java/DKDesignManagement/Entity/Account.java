package DKDesignManagement.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Account {
    private int idAcc;
    private String nameAcc;
    private String passAcc;
    private int roleInWeb;
    private boolean status;
}
