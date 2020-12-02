package com.wcl.excise.dao;

import com.wcl.excise.vo.User;
import com.wcl.excise.tools.JdbcUtils;

import java.sql.SQLException;

public class RegisterDao {

    public int addUser(User user) {
        int update = 0;
        try {
            // 添加用户
            update = JdbcUtils.dataInsert("INSERT INTO t_user VALUES (?,?,?,?,?,?)",user.getUserName(),user.getPassword(),user.getChrName(),user.getEmailAddress(),user.getProvince(),user.getCity());
            // 给用户添加权限
            if(update != 0) update = JdbcUtils.dataInsert("INSERT INTO t_user_role (roleId,userName) VALUES (?,?)",2,user.getUserName());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.err.println("用户添加失败！！");
        }
        return update;
    }

}
