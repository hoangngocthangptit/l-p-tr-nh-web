/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Contract;

/**
 *
 * @author Duc Huy
 */
public class ContractDAO extends DBContext {

    public List<Contract> getContractListByStaffId(int id) {
        List<Contract> list = new ArrayList();
        String sql = "select * from Contract where user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contract contract = new Contract();
                contract.setId(rs.getInt("id"));
                contract.setUser_id(new UserDAO().getUserInformation(rs.getInt("user_id")));
                contract.setStart_date(rs.getDate("start_date"));
                contract.setEnd_date(rs.getDate("end_date"));
                contract.setStatus(rs.getString("status"));
                list.add(contract);
            }
            st.close();
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public void AddNewContract(int id, Date datestart, Date dateend, String status) {
        String sql = "insert into Contract (start_date , end_date ,status,user_id) values (? , ? , ? , ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, datestart);
            st.setDate(2, dateend);
            st.setString(3, status);
            st.setInt(4, id);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
        }
    }

    public void UpdateContract(int id, Date datestart, Date dateend, String status) {
        String sql = "update Contract set start_date = ? , end_date = ? , status = ? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, datestart);
            st.setDate(2, dateend);
            st.setString(3, status);
            st.setInt(4, id);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
        }

    }

    public static void main(String[] args) {
        ContractDAO a = new ContractDAO();
//        a.AddNewContract(131, 02-03-2021, 02-03-2021, "Active");
    }
}
