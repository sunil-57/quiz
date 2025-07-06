package controller;

import dao.UserDAO;
import model.User;

public class UserController {
    private UserDAO userdao = new UserDAO();

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
}
