package model;

public class User {
    private String username;
    private String password;
    private boolean isGameMaster;

    public User(String username, String password, boolean isGameMaster) {
        this.username = username;
        this.password = password;
        this.isGameMaster = isGameMaster;
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

}
