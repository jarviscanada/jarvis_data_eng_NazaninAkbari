package ca.jrvs.apps.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCExecutor {
  public static void main(String[] args) {
    DatabaseConnectionManager dcm = new DatabaseConnectionManager("localhost", "hplussport", "postgres", "password");

    try {
      Connection connection =dcm.getConnection();
      CustomerDAO customerDAO = new CustomerDAO(connection);

      Customer customer = new Customer();

      customer.setFirstName("Goege");
      customer.setLastName("Pitt");
      customer.setEmail("Goerge.p@gmail.com");
      customer.setPhone("(123) 456-7891");
      customer.setAddress("200 Soho st");
      customer.setCity("New York");
      customer.setState("NA");
      customer.setZipCode("45612");
      Customer dbCustomer = customerDAO.create(customer);
      System.out.println(dbCustomer);

      dbCustomer =customerDAO.findById(customer.getId());
      System.out.println(dbCustomer);

      dbCustomer.setEmail("Goerge.p@gmail.com");
      dbCustomer =customerDAO.update(dbCustomer);

      System.out.println(dbCustomer);
      customerDAO.delete(dbCustomer.getId());

    } catch (SQLException ex) {
      ex.printStackTrace();

    }
  }
}