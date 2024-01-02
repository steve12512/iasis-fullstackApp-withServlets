package Java_Omadikh;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    
    /**
     * @param customer
     * @throws Exception
     */
    public void register(Customer customer) throws Exception {

        String sql = "INSERT INTO ismgroup39.customer"
				+ "(name, surname, username, password, age) VALUES (?, ?, ?, ?, ?);";
        String sqlCheck = "SELECT * FROM ismgroup39.customer WHERE username=?";

        Connection con = null;
		DB db = new DB();

        try {

            con = db.getConnection();
			PreparedStatement stmtCheck = con.prepareStatement(sqlCheck);
			stmtCheck.setString(1, customer.getUsername());
			
            ResultSet rs = stmtCheck.executeQuery();

            if (rs.next()) {

				if (rs.getString("username").equals(customer.getUsername()) ) {

					throw new Exception("Sorry, username already registered");
				}
			}
            
            //setting parameters
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, customer.getName());
			stmt.setString(2, customer.getSurname());
			stmt.setString(3, customer.getUsername());
			stmt.setString(4, customer.getPassword());
			stmt.setString(5, customer.getAge());


            stmt.executeUpdate();
			stmt.close();
			db.close();



        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
				db.close();
			} catch (Exception e) {
				
			}

        }
    
    
    }   //end of register


    public Customer findCustomer(String username) throws Exception {
        
        String sql = "SELECT * FROM ismgroup39.customer WHERE username=?;"; 
		Connection con = null;
		DB db =  new DB();

        try {

            con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql); 
			stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();

            if (!rs.next()) {

				rs.close();
				stmt.close();
				db.close();
				
				throw new Exception("No user found");
				
			}

            Customer customer = new Customer(rs.getString("name"), rs.getString("surname"), rs.getString("username"), rs.getString("password"), rs.getString("age"));
			rs.close();
			stmt.close();
			db.close();

            return customer;


        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
				db.close();
			} catch (Exception e) {
				
			}
        }

    } //end of findCustomer



    public Customer authenticate(String username, String password) throws Exception {
        
        String sql = "SELECT * FROM ismgroup39.customer WHERE username=? AND password=?;";
		Connection con = null;
		DB db = new DB();

        try {

            con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);

            ResultSet rs= stmt.executeQuery();

            if (!rs.next()) {

				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Wrong username or password");
			}
            Customer customer = findCustomer(username);
            return customer;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
				db.close();
			} catch (Exception e) {
				
			}
        }


    } //end of authenticate


    public List<Customer> getCustomers() throws Exception {
        
        List<Customer> customers = new ArrayList<Customer>();

        String sql = "SELECT * FROM ismgroup39.customer;";
        Connection con = null;
		DB db =  new DB();

        try {
            con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql); 
			ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

				Customer customer = new Customer(rs.getString("name"), rs.getString("surname"), rs.getString("username"), rs.getString("password"), rs.getString("age"));
    			customers.add(customer);
			}
            rs.close();
			stmt.close();
			db.close();
            return customers;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
				db.close();
			} catch (Exception e) {
				
			}
        }
    } //End of getCustomers

} // End of class
