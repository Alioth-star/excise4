package com.wcl.excise.dao;

import com.wcl.excise.tools.JdbcUtils;
import com.wcl.excise.vo.User;
import com.wcl.excise.vo.UserPage;
import com.wcl.excise.vo.UserVO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserManagerDao {
    /**
     * 多条件分页查询
     * <p>
     * select userName, chrName, emailAddress, province, city from tx_web.t_user where 1=1 and userName like '%z%' order by chrName limit 0,3
     *
     * @param user
     * @param page
     * @return
     */
    public List<UserVO> query(UserVO user, UserPage page) {

        String sql = "select u.userName, u.password, u.chrName, u.emailAddress, p.province, c.city\n" +
                "from excise.t_user u left join excise.t_province p on u.province = p.p_id left join excise.t_city c on u.city = c_id where 1=1";
        StringBuffer condition = new StringBuffer();//查询条件
        List<UserVO> users = new ArrayList<>();
        if (user.getUserName() != null && !"".equals(user.getUserName())) {
            condition.append(" and u.userName like '%").append(user.getUserName()).append("%'");
        }

        if (user.getChrName() != null && !"".equals(user.getChrName())) { //
            condition.append(" and u.chrName like '%").append(user.getChrName())
                    .append("%'");
        }
        if (user.getEmailAddress() != null && !"".equals(user.getEmailAddress())) { //
            condition.append(" and u.emailAddress like '%").append(user.getEmailAddress())
                    .append("%'");
        }
        if (user.getProvince() != null && !"".equals(user.getProvince())) { //
            condition.append(" and p.province like '%")
                    .append(user.getProvince()).append("%'");
        }

        sql += condition;
        if (page != null) {
            sql += " order by " + page.getSort() + " " + page.getSortOrder() + " limit " + page.getPageNumber() + "," + page.getPageSize();
        }

        System.out.println(sql);

        Connection conn = JdbcUtils.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserVO userResult = new UserVO();
                userResult.setUserName(rs.getString("userName"));
                userResult.setPassword(rs.getString("password"));
                userResult.setChrName(rs.getString("chrName"));
                userResult.setEmailAddress(rs.getString("emailAddress"));
                userResult.setProvince(rs.getString("province"));
                userResult.setCity(rs.getString("city"));
                users.add(userResult);
                System.out.println("查询成功！");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                JdbcUtils.close(conn, ps, rs);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return users;
    }

    /**
     * 查询总条数
     * @param user
     * @return
     */
    public int count(UserVO user){
        String sql = "select count(*) from excise.t_user t left join excise.t_province p on t.province = p.p_id where 1 = 1";
        StringBuffer sqlBuffer = new StringBuffer();
        if (user.getUserName() != null && !"".equals(user.getUserName())) {
            sqlBuffer.append(" and userName like '%").append(user.getUserName()).append("%'");
        }

        if (user.getChrName() != null && !"".equals(user.getChrName())) { //
            sqlBuffer.append(" and chrName like '%").append(user.getChrName())
                    .append("%'");
        }
        if (user.getEmailAddress() != null && !"".equals(user.getEmailAddress())) { //
            sqlBuffer.append(" and emailAddress like '%").append(user.getEmailAddress())
                    .append("%'");
        }
        if (user.getProvince() != null && !"".equals(user.getProvince())) { //
            sqlBuffer.append(" and p.province like '%")
                    .append(user.getProvince()).append("%'");
        }

        sql += sqlBuffer;
//        System.out.println("查询总数SQL: "+sql);
        int i = 0;
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            conn = JdbcUtils.getConnection();
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                i = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                JdbcUtils.close(conn, st, rs);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return i;
    }

    /**
     * 查询一个用户
     * @param name
     * @return
     */
    public UserVO getUser(String name){
        UserVO user = new UserVO();
        try {
            ResultSet resultSet = JdbcUtils.query("select u.userName, u.password, u.chrName, u.emailAddress, p.province, c.city\n" +
                    "from excise.t_user u left join excise.t_province p on u.province = p.p_id\n" +
                    "    left join excise.t_city c on u.city = c_id\n" +
                    "where u.userName = ?", name);
            if (resultSet.next()){
                user.setUserName(resultSet.getString(1));
                user.setPassword(resultSet.getString(2));
                user.setChrName(resultSet.getString(3));
                user.setEmailAddress(resultSet.getString(4));
                user.setProvince(resultSet.getString(5));
                user.setCity(resultSet.getString(6));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                JdbcUtils.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    /**
     * 删除一个用户
     * @param name
     * @return
     */
    public int deleteUser(String name){
        int i = 0;
        String sql = "delete from excise.t_user where userName='"+name+"'";
        Connection conn = JdbcUtils.getConnection();
        Statement st = null;
        try {
            st = conn.createStatement();
            i = st.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                JdbcUtils.close(conn,st,null);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return i;
    }

    /**
     * 修改一个用户的信息
     * @param name
     * @return
     */
    public int updateUser(User user,String name){
        int i = 0;
        String sql = "update excise.t_user t set userName =? ,password = ?, chrName = ?, emailAddress = ?, province =?, city = ? where userName =?";
        Connection conn = JdbcUtils.getConnection();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,user.getUserName());
            ps.setString(2,user.getPassword());
            ps.setString(3,user.getChrName());
            ps.setString(4,user.getEmailAddress());
            ps.setInt(5,user.getProvince());
            ps.setInt(6,user.getCity());
            ps.setString(7,name);
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                JdbcUtils.close(conn,ps,null);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return i;
    }

    public static void main(String[] args) {
        UserManagerDao userDao = new UserManagerDao();
        User user = new User("s12", "123456", "李白", "libai@qq.com", 3, 14);
        //User{userName='shm123456789', password='123456', chrName='李白', emailAddress='libai@qq.com', province='3', city='14'}

        int i = userDao.updateUser(user, "s123");
        System.out.println(i);
    }
}
