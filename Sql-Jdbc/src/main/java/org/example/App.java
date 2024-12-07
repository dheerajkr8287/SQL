package org.example;


import java.sql.*;

public class App
{

    public static  void callProcedure1() throws SQLException {
        Connection connection=ConnectionProvider.getConnection();

        CallableStatement callableStatement=connection.prepareCall("call CountByLast(?,?)");
        //yaha par abb hme INOUT dono parameter ko handle karna parega

        //handle IN type parameters
        //setXYZType(position ,value)

        callableStatement.setString(1,"jha");
        //handle out type parameters
        callableStatement.registerOutParameter(2, Types.INTEGER);

        //execute the callable

        callableStatement.execute();

      int countValue=  callableStatement.getInt(2);
        System.out.println("Number of rows :"+countValue);



    }
    public static  void callProcedure() throws SQLException {
        System.out.println("calling procedure");
// connection create karenge
        Connection connection=ConnectionProvider.getConnection();

        //prepare either statement and prepare statement

        //->statement-static queries
        //->PrepareStatement-dynamic queries
        //->CallableStatement-Stored procedure and functions

        //prepare call ka use isiliye hua hai kyo ki store procedure ke queries call karna hai
        CallableStatement callableStatement=connection.prepareCall("CALL selectByLast(?)");


        /*
        ?--->parameter
        ye tin tarika ka h

        -IN
        -OUT
        -INOUT

         */

        //yaha par value pass karna h .(IN KE BAJASE) so,
// all in parameter ko aise hi set karna h
        callableStatement.setString(1,"ji");


        // time to execute
         ResultSet resultSet=callableStatement.executeQuery();

         while (resultSet.next()){
             //row ki value

             System.out.println(resultSet.getString("first_name")+" "+resultSet.getString("last_name")+"->"+resultSet.getString("city"));
         }

    }
    public static void main( String[] args ) throws SQLException {
       // callProcedure();
          callProcedure1();
    }
}
