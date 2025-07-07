package controller;

import dao.UserDAO;
import model.User;

import java.sql.SQLException;

public class UserController {
    private UserDAO userdao;

    {
        try {
            userdao = new UserDAO();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean signUp(String username, String password)
    {
        boolean isSignedUp = false;
        User user = new User(username, password);
        isSignedUp = userdao.insertUser(user);
        if(isSignedUp){
            return true;
        }else{
            return false;
        }
    }

    //TODO user login
    public boolean logIn(String username, String password)
    {
        User user = userdao.checkUser(username, password);
        if(user != null){
            return true;
        }else{
            return false;
        }
    }
}
