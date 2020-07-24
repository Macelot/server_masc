package org.example.server_masc;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {

    static Connection connection;

    public static Connection getConnection(){
        connection=null;
        try {
            String user="root";
            String password="usbw";
            String url = "jdbc:mysql://localhost:3307/test?serverTimezone=UTC&useLegacyDatetimeCode=false";
//            String url = "jdbc:mysql://192.168.25.99:3306/test?serverTimezone=UTC&useLegacyDatetimeCode=false";
//            String user = "user_example";
//            String password = "123";
            connection = DriverManager.getConnection(url,user,password);
        }catch (Exception e){
            e.printStackTrace();
            System.out.println(e);
            System.out.println("Erro de conexão no método getConnection");
        }

        return connection;
    }
    public static Connection getConnection(String base){
        connection=null;
        try {
            String user="root";
            String password="usbw";
            String url = "jdbc:mysql://localhost:3307/"+base+"?serverTimezone=UTC&useLegacyDatetimeCode=false";
//            String url = "jdbc:mysql://192.168.25.99:3306/test?serverTimezone=UTC&useLegacyDatetimeCode=false";
//            String user = "user_example";
//            String password = "123";
            connection = DriverManager.getConnection(url,user,password);
        }catch (Exception e){
            e.printStackTrace();
            System.out.println(e);
            System.out.println("Erro de conexão no método getConnection");
        }

        return connection;
    }

}
