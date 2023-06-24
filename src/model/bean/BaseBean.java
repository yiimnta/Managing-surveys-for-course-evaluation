package model.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class BaseBean {

	public abstract <T> T convert(ResultSet rs);

	public abstract String getArgsAdd();

	public abstract String getArgsUpdate();

	public abstract String getCondition();

	private ArrayList<String> listValue = new ArrayList<String>();
	private String condition = "";

	@SuppressWarnings("unchecked")
	public <T> ArrayList<T> parse(ResultSet rs) {
		ArrayList<T> arr = new ArrayList<T>();
		try {
			while (rs.next()) {
				arr.add((T) convert(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}

	public ArrayList<String> getListValue() {
		return listValue;
	}

	public void setListValue(ArrayList<String> listValue) {
		this.listValue = listValue;
	}

	public void addValue(String value) {
		if ("".equals(value) || value == null) {
			listValue.add("null");
		} else {
			listValue.add("N'"+value+"'");
		}
	}

	public void addValue(String field, String value) {
		if ("".equals(value) || value == null) {
			listValue.add(field + "=null");
		} else {
			listValue.add(field + "=N'" + value + "'");
		}
	}

	public void addCondition(String column, String value) {
		condition +=  column + "=N'" + value + "' ";
	}

	public String toStringCondition() {
		String con =  "where "+condition;
		condition ="";
		return con;
	}

	public String toStringArgs() {
		StringBuffer sb = new StringBuffer();
		for (String val : listValue) {
			sb.append(val + ",");
		}
		listValue = new ArrayList<String>();
		return sb.toString().substring(0, sb.toString().length() - 1);
	}
}
