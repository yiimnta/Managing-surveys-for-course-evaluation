package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
    private static String driver = "net.sourceforge.jtds.jdbc.Driver";
    private static String stringConnect = "jdbc:jtds:sqlserver://localhost:1433;databaseName=DGDayHoc;";
    private static String user = "sa";
    private static String pass = "12345678";
    private static Connection con = null;

    public static Connection getInstance() {
        try {
            if (con == null || con.isClosed()) {
                Class.forName(driver);
                con = DriverManager.getConnection(stringConnect, user, pass);
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Loi dirver.");
        } catch (SQLException e) {
            System.err.println("Loi ket noi database");
        }
        return con;
    }

    public static void closeConnect() {
        try {
            con.close();
        } catch (SQLException e) {
            System.out.println("Dong ket noi database that bai!");
        }
    }
}
