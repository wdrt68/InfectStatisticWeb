package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pojo.Province;
import util.DBUtil;

public class ProvinceDAO {
	
	public void insert(Province province) {
		try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement()) {
            String sql = "insert into province values(" +
            			"\'" + province.getName() + "\'," +
            			"\'" + province.getDate() + "\'," +
            			province.getIp() + "," + 
            			province.getN_ip() + "," +
            			province.getC_ip() + "," +
            			province.getCure() + "," +
            			province.getN_cure() + "," + 
            			province.getDead() + "," +
            			province.getN_dead() + ");";
            s.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
	
	public int remove(String name, String date) {
		try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement()) {
            String sql = "delete from province where p_name = \'" + name + "\' and p_date = \'" + date + "\'";		
            return s.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return 0;
	}
	
	public Province getProvince(String name, String date) {
		
		Province province = null;
		
		try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement()) {
            String sql = "select * from province where p_name = \'" + name + "\' and p_date = \'" + date + "\'";
            ResultSet rs = s.executeQuery(sql);
            
            if(rs.next()) {
            	province = new Province(rs.getString(1), rs.getString(2),
            							rs.getInt(3), rs.getInt(4),
            							rs.getInt(5), rs.getInt(6),
            							rs.getInt(7),rs.getInt(8),
            							rs.getInt(9));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return province;
	}
	
	public Map<String, Integer> getIpMap(String date) {
		Map<String, Integer> ipMap = new HashMap();
		
		try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement()) {
            String sql = "select * from province where p_date = \'" + date + "\'";
            ResultSet rs = s.executeQuery(sql);
            
            while(rs.next()) {
            	ipMap.put(rs.getString(1), rs.getInt(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return ipMap;
	} 
	
	public List<String> getDateStrings() {
		
		List<String> dateStrings = new ArrayList<String>();
		
		try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement()) {
			String sql = "select distinct n_date from nation;";
            ResultSet rs = s.executeQuery(sql);
            
            while(rs.next()) {
            	String date = rs.getString(1);
            	dateStrings.add(date.substring(date.indexOf('-')+1, date.length()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return dateStrings;
		
	}
	
	public List<Integer> getCIpList(String name) {
		
		List<Integer> cIpList = new ArrayList<Integer>();
		
		try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement()) {
			String sql = "select c_ip from province where p_name = \'" + name + "\';";
            ResultSet rs = s.executeQuery(sql);
            
            while(rs.next()) {
            	cIpList.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return cIpList;
	}
	
	public List<Integer> getIpList(String name) {
		
		List<Integer> ipList = new ArrayList<Integer>();
		
		try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement()) {
			String sql = "select ip from province where p_name = \'" + name + "\';";
            ResultSet rs = s.executeQuery(sql);
            
            while(rs.next()) {
            	ipList.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return ipList;
	}
	
	public List<Integer> getCureList(String name) {
		
		List<Integer> cureList = new ArrayList<Integer>();
		
		try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement()) {
			String sql = "select cure from province where p_name = \'" + name + "\';";
            ResultSet rs = s.executeQuery(sql);
            
            while(rs.next()) {
            	cureList.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return cureList;
	}
	
	public List<Integer> getDeadList(String name) {
		
		List<Integer> deadList = new ArrayList<Integer>();
		
		try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement()) {
			String sql = "select dead from province where p_name = \'" + name + "\';";
            ResultSet rs = s.executeQuery(sql);
            
            while(rs.next()) {
            	deadList.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return deadList;
	}
	
}
