package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import pojo.Nation;
import util.DBUtil;


public class NationDAO {

	public void insert(Nation nation) {
		try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement()) {
            String sql = "insert into nation values(" +
            			"\'" + nation.getDate() + "\'," +
            			nation.getIp() + "," +
            			nation.getN_ip() + "," + 
            			nation.getC_ip() + "," +
            			nation.getCure() + "," +
            			nation.getN_cure() + "," +
            			nation.getDead() + "," + 
            			nation.getN_dead() + "," +
            			nation.getSp() + "," + 
            			nation.getN_sp() + ");";
            s.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
	
	public Nation get(String date) {
		Nation nation = null;
		
		try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement()) {
            String sql = "select * from nation where n_date = \'" + date + "\';";
            ResultSet rs = s.executeQuery(sql);
            
            if(rs.next()) {
            	nation = new Nation(rs.getString(1),
            						rs.getInt(2), rs.getInt(3),
            						rs.getInt(4), rs.getInt(5),
            						rs.getInt(6), rs.getInt(7),
            						rs.getInt(8), rs.getInt(9),
            						rs.getInt(10));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return nation;
	}
}
