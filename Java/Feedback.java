package Java_Omadikh;

public class Feedback {

    private String username;
    private String exam_name;
    private String day;
    private String month;
    private String year;
    private String details;
    
    public Feedback(String username, String exam_name, String day, String month, String year, String gnwmateush) {
        this.username = username;
        this.exam_name = exam_name;
        this.day = day;
        this.month = month;
        this.year = year;
        this.details = gnwmateush;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getDetails() {
        return details;
    }

    public void setDetails(String gnwmateush) {
        this.details = gnwmateush;
    }

    
}