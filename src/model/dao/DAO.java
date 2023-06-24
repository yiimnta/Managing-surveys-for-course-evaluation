package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.BaseBean;

public class DAO {
	
	//phục vụ cho các nghiệp vụ bình thường
	private Connection con = null;
	private ResultSet result = null;
	
	//phục vụ cho generic class
	private static Connection con2 = null;
	private static ResultSet result2 = null;
	
	@SuppressWarnings("unused")
    	private ArrayList<ArrayList<String>> getTable(String tableName, String whereCondition) {
		ArrayList<ArrayList<String>> array = new ArrayList<ArrayList<String>>();	
		con = ConnectDB.getInstance();
		try {
			PreparedStatement statement;
			String where = "".equals(whereCondition)?"":" "+whereCondition;
			String query = "SELECT * FROM " + tableName+where;
			statement = con.prepareStatement(query);
			result = statement.executeQuery();
			try {
				ResultSetMetaData metaData = result.getMetaData();
				ArrayList<String> temp = new ArrayList<String>();
				while (result.next()) {
					temp = new ArrayList<String>();
					for (int j = 1; j <= metaData.getColumnCount(); j++) {
						temp.add(result.getObject(j) == null?"":result.getString(j));
					}
					array.add(temp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnect();
		}
		return array;
	}
	
	public boolean checkExist(String table, String condition) {
		ResultSet result = null;
		con = ConnectDB.getInstance();
		boolean check = true;
		try {
			PreparedStatement statement;
			String query = "SELECT count(*) FROM " + table + " where "+condition;
			System.out.println(query);
			statement = con.prepareStatement(query);
			result = statement.executeQuery();
			result.next();
			if (result.getInt(1) == 0) {
				check = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnect();
		}
		return check;
	}
	
	public static boolean executeUpdate(String query){
	    con2 = ConnectDB.getInstance();
	    try{
	        System.out.println(query);
	        PreparedStatement statement = con2.prepareStatement(query);
	        if(statement.executeUpdate() > 0){
	            return true;
	        }else{
	            return false;
	        }
	    }catch(SQLException e){
	        return false;
	    }finally{
	       closeConnect2();
	    }
	}
	
	//-----các phương thức phục vụ cho generic class 
	
	public static <T extends BaseBean> ArrayList<T> getList(String tableName, Class<T> cl, String condition){
		con2 = ConnectDB.getInstance();
		ArrayList<T> arr = new ArrayList<T>();
		try {
			PreparedStatement statement;
			String query = "SELECT * FROM " + tableName+" "+condition;
			System.out.println(query);
			statement = con2.prepareStatement(query);
			result2 = statement.executeQuery();
			T t = (T)cl.newInstance();
			arr = t.parse(result2);
		}
		catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnect2();
		}
		return arr;
	}
	
	public static <T extends BaseBean> ArrayList<T> getList(String query, Class<T> cl){
        con2 = ConnectDB.getInstance();
        ArrayList<T> arr = new ArrayList<T>();
        try {
            PreparedStatement statement;
            System.out.println(query);
            statement = con2.prepareStatement(query);
            result2 = statement.executeQuery();
            T t = (T)cl.newInstance();
            arr = t.parse(result2);
        }
        catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnect2();
        }
        return arr;
    }
	
	public static boolean add(String table, String data) {
		con2 = ConnectDB.getInstance();
		String query = "insert into "+table+" values ( " + data + ")";
		System.out.println(query);
		try {
			PreparedStatement statement = con2.prepareStatement(query);
			if (statement.executeUpdate() > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			closeConnect2();
		}
		return false;
	}
	
	public static boolean remove(String table, String condition) {
		con2 = ConnectDB.getInstance();
		String where = "".equals(condition)?"":" "+condition;
		String query = "Delete from " + table + where ;
		System.out.println(query);
		try {
			PreparedStatement statement = con2.prepareStatement(query);
			if (statement.executeUpdate() > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			closeConnect2();
		}
		return false;
	}
	
	public static boolean removeForeign(String table, String condition) {
        con2 = ConnectDB.getInstance();
        String where = "".equals(condition)?"":" "+condition;
        String query = "Delete from " + table + where ;
        System.out.println(query);
        try {
            PreparedStatement statement = con2.prepareStatement(query);
            if (statement.executeUpdate() >= 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closeConnect2();
        }
        return false;
    }
	
	
	
	public static boolean update(String table, String value, String condition) {
		con2 = ConnectDB.getInstance();
		String where = "".equals(condition)?"":" "+condition;
		String query = "Update " + table + " set " + value + where;
		System.out.println(query);
		try {
			PreparedStatement statement = con2.prepareStatement(query);
			if (statement.executeUpdate() > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			closeConnect2();
		}
		return false;
	}
	
	private static void closeConnect2() {
		try {
			con2.close();
			if(result2!=null){
				result2.close();
			}
		} catch (SQLException e) {
			System.out.println("Dong ket noi database that bai!");
		}
	}
	
	//---ket thúc generic
	
	private void closeConnect() {
		try {
			con.close();
			if(result!=null){
				result.close();
			}
		} catch (SQLException e) {
			System.out.println("Dong ket noi database that bai!");
		}
	}

}
