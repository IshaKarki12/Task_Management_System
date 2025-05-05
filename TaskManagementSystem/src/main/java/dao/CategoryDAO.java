package dao;

import model.Category;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.DBUtil;

public class CategoryDAO {
    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM category")) {

            while (rs.next()) {
                Category cat = new Category();
                cat.setId(rs.getInt("CategoryID"));
                cat.setName(rs.getString("CategoryName"));
                list.add(cat);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
