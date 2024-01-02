package Java_Omadikh;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackService {
 
    /**
     * @param feedback
     * @throws Exception
     */
    public void create_feedback(Feedback feedback) throws Exception {

        String sql = "INSERT INTO ismgroup39.feedbackTemp"
				+ "(customer_username, exam_name, day, month, year, details) VALUES (?, ?, ?, ?, ?, ?);";

        String sqlCheck = "SELECT * FROM ismgroup39.feedbackTemp WHERE customer_username=? AND exam_name=? AND day=? AND month=? AND year=?";
  
        Connection con = null;
        DB db = new DB();

        try {

            con = db.getConnection();
			PreparedStatement stmtCheck = con.prepareStatement(sqlCheck);
            stmtCheck.setString(1, feedback.getUsername());
            stmtCheck.setString(2, feedback.getExam_name());
            stmtCheck.setString(3, feedback.getDay());
            stmtCheck.setString(4, feedback.getMonth());
            stmtCheck.setString(5, feedback.getYear());
            
            ResultSet rs = stmtCheck.executeQuery();

            if (rs.next()) {

				if (rs.getString("customer_username").equals(feedback.getUsername()) && rs.getString("exam_name").equals(feedback.getExam_name()) && rs.getString("day").equals(feedback.getDay()) && rs.getString("month").equals(feedback.getMonth()) && rs.getString("year").equals(feedback.getYear())) {

					throw new Exception("Sorry, this feedback is already created.");
				}
			}

            //setting parameters
			PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, feedback.getUsername());
            stmt.setString(2, feedback.getExam_name());
            stmt.setString(3, feedback.getDay());
            stmt.setString(4, feedback.getMonth());
            stmt.setString(5, feedback.getYear());
            stmt.setString(6, feedback.getDetails());

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

    } //End of create_feedback


    public List<Feedback> getFeedbacks() throws Exception {

        List<Feedback> feedbacks = new ArrayList<Feedback>();

        String sql = "SELECT * FROM ismgroup39.feedbackTemp;";
        
        Connection con = null;
		DB db =  new DB();

        try {
            
            con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql); 
			ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

				Feedback feedback = new Feedback(rs.getString("customer_username"), rs.getString("exam_name"), rs.getString("day"), rs.getString("month"), rs.getString("year"), rs.getString("details"));
				feedbacks.add(feedback);
			}
            rs.close();
			stmt.close();
			db.close();
            
            return feedbacks;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
				db.close();
			} catch (Exception e) {
				
			}
        }
    } //End of getFeedbacks

}
