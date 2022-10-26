package com.entities;

public class Accounts {

    private int idAccount;
    private String username;
    private String password;
    private int roleInWebsite;
    private String status;

    public int getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(int idAccount) {
        this.idAccount = idAccount;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleInWebsite() {
        return roleInWebsite;
    }

    public void setRoleInWebsite(int roleInWebsite) {
        this.roleInWebsite = roleInWebsite;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Accounts() {
    }

    public Accounts(int idAccount, String username, String password, int roleInWebsite, String status) {
        this.idAccount = idAccount;
        this.username = username;
        this.password = password;
        this.roleInWebsite = roleInWebsite;
        this.status = status;
    }
}
