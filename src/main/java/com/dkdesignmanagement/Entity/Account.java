package com.dkdesignmanagement.Entity;

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
    private String accName;
    private String accPass;
    private int roleInWeb;
    private boolean accStatus;
}
