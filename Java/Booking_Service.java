package Java_Omadikh;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Booking_Service {


    /**
     * @param booking
     * @throws Exception
     */
    public void create_appointment(Booking booking) throws Exception { 
    

        String sql = "INSERT INTO ismgroup39.bookingsTemp"
				+ "(customer_username, exam_name, day, month, year, time) VALUES (?, ?, ?, ?, ?, ?);";

        String sqlCheck = "SELECT * FROM ismgroup39.bookingsTemp WHERE day=? AND month=? AND year=? AND time=?";

        Connection con = null;
		DB db = new DB();

        try {

            con = db.getConnection();
			PreparedStatement stmtCheck = con.prepareStatement(sqlCheck);
			stmtCheck.setString(1, booking.getDay());
            stmtCheck.setString(2, booking.getMonth());
            stmtCheck.setString(3, booking.getYear());
            stmtCheck.setString(4, booking.getTime());

            ResultSet rs = stmtCheck.executeQuery();

            if (rs.next()) {

				if (rs.getString("day").equals(booking.getDay()) && rs.getString("month").equals(booking.getMonth()) && rs.getString("year").equals(booking.getYear()) && rs.getString("time").equals(booking.getTime())) {

					throw new Exception("Sorry, this date is already booked.");
				}
			}

            //setting parameters
			PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, booking.getCustomer_username());
            stmt.setString(2, booking.getExam_name());
			stmt.setString(3, booking.getDay());
			stmt.setString(4, booking.getMonth());
            stmt.setString(5, booking.getYear());
            stmt.setString(6, booking.getTime());
            

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

    } //End of create_appointment

    /**
     * @return
     * @throws Exception
     */
    public List<Booking> getBookings() throws Exception {

        List<Booking> bookings = new ArrayList<Booking>();

        String sql = "SELECT * FROM ismgroup39.bookingsTemp;";
        Connection con = null;
		DB db =  new DB();

        try {
            con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql); 
			ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

				Booking booking = new Booking(rs.getString("customer_username"), rs.getString("exam_name"), rs.getString("day"), rs.getString("month"), rs.getString("year"), rs.getString("time"));
				bookings.add(booking);
			}
            rs.close();
			stmt.close();
			db.close();

            return bookings;
        } catch (Exception e) {
	
			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {
				
			}
			
		}

    } //End of getBookings


    /**
     * @throws Exception
     */
    public void cancel(String examName, String day, String month, String year, String time) throws Exception {

        String sql = "DELETE FROM ismgroup39.bookingsTemp WHERE exam_name=? AND day=? AND month=? AND year=? AND time=?;";
        Connection con = null;
		DB db =  new DB();

        try {
            con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql); 
            stmt.setString(1, examName);
            stmt.setString(2, day);
            stmt.setString(3, month);
            stmt.setString(4, year);
            stmt.setString(5, time);
			stmt.executeUpdate();
            System.out.println("done");
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

    }
}