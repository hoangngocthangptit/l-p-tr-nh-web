/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Slider;

/**
 *
 * @author Duc Huy
 */
public class SliderDAO extends DBContext {

    public Slider getSliderDetails(int id) {
        String sql = "select * from Slider where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Slider slider = new Slider();
                slider.setId(rs.getInt("id"));
                slider.setTitle(rs.getString("title"));
                slider.setImage(rs.getString("image"));
                slider.setBacklink(rs.getString("backlink"));
                slider.setStatus(rs.getString("status"));
                slider.setNote(rs.getString("note"));
                return slider;
            }
            return null;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<Slider> getAllSlider() {
        List<Slider> list = new ArrayList<>();
        String sql = "select * from Slider";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setId(rs.getInt("id"));
                slider.setTitle(rs.getString("title"));
                slider.setImage(rs.getString("image"));
                slider.setBacklink(rs.getString("backlink"));
                slider.setStatus(rs.getString("status"));
                list.add(slider);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public boolean UpdateSlider(Slider slide) {
        boolean f = false;
        String sql = "update Slider set title = ?,image = ? ,backlink= ? ,status = ? , Note = ? where id = ?" ; 
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, slide.getTitle());
            ps.setString(2,slide.getImage());
            ps.setString(3, slide.getBacklink());
            ps.setString(4,slide.getStatus());
            ps.setString(5, slide.getNote());
            ps.setInt(6, slide.getId());
            ps.executeUpdate();
            f = true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }
    public List<Slider> getSliderbyStatus(String status){
    List<Slider> list = new ArrayList<>();
        String sql = "select * from Slider where status = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setId(rs.getInt("id"));
                slider.setTitle(rs.getString("title"));
                slider.setImage(rs.getString("image"));
                slider.setBacklink(rs.getString("backlink"));
                slider.setStatus(rs.getString("status"));
                list.add(slider);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    
    
    }

    public static void main(String[] args) {
        SliderDAO slide = new SliderDAO();
        //System.out.println(slide.getAllSlider());
        //System.out.println(slide.getSliderDetails(1));
        System.out.println(slide.getSliderDetails(1));
    }
}
