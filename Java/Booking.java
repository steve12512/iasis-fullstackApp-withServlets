package Java_Omadikh;


public class Booking {

    private String customer_username;
    private String exam_name;
    private String day;
    private String month;
    private String year;
    private String time;
    

    public Booking(String customer_username, String exam_name, String day, String month, String year, String time) {
        this.customer_username = customer_username;
        this.exam_name = exam_name;
        this.day = day;
        this.month = month;
        this.year = year;
        this.time = time;
    }

    public String getCustomer_username() {
        return customer_username;
    }

    public void setCustomer_username(String customer_username) {
        this.customer_username = customer_username;
    }

    public String getExam_name() {
        return exam_name;
    }

    public void setExam_name(String exam_name) {
        this.exam_name = exam_name;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }


}