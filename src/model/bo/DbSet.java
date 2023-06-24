package model.bo;

import java.util.ArrayList;
import model.bean.*;
import model.dao.DAO;

public class DbSet<T extends BaseBean> {

	private final Class<T> cl;
	private final String tableName;

	public DbSet(Class<T> cl1) {
		this.cl = cl1;
		tableName = cl.getSimpleName();
	}
	
	public DbSet(Class<T> cl1, String tableName) {
		this.cl = cl1;
		this.tableName = tableName;
	}
	
	public ArrayList<T> getList() {
		return (ArrayList<T>)DAO.<T> getList(tableName, cl,"");
	}
	
	public ArrayList<T> getList(String query) {
        	return (ArrayList<T>)DAO.<T> getList(query,cl);
    	}
	
	public ArrayList<T> where(String condition) {
		return (ArrayList<T>)DAO.<T> getList(tableName, cl, condition);
	}
	
	public boolean add(T obj){
		return DAO.add(tableName, obj.getArgsAdd());
	}
	
	public boolean remove(T obj){
		return DAO.remove(tableName, obj.getCondition());
	}
	
	public boolean remove(String condition){
		return DAO.remove(tableName, "where "+condition);
	}
	
	public boolean removeForeign(String condition){
        	return DAO.removeForeign(tableName, "where "+condition);
    	}
	
	public boolean update(T obj){
		return DAO.update(tableName,  obj.getArgsUpdate(), obj.getCondition());
	}
	
	public T find(String condition){
		ArrayList<T> arr = DAO.<T> getList(tableName, cl, "where "+condition);
		return arr.size() == 0?null:arr.get(0);
	}
	
	public T getObjectEndList(){
        ArrayList<T> arr = getList();
        return arr.size() == 0?null:arr.get(arr.size()-1);
    }
	
}
