package app.dao;


import app.model.User;

import java.util.List;

public interface UserDao extends GenericDao<Long, User> {
    User getUserByName(String name);
}
