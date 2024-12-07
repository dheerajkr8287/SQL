package org.example;

import java.security.spec.ECField;
import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    private  static Connection connection;
    //method which provide the connection

    public  static  Connection getConnection(){
        //create kar lege connection
        try{
           if (connection==null){
               connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/storeProcedure","root","kakaji");
           }

        }catch (Exception e){
            e.printStackTrace();
        }
        return  connection;
    }
}
