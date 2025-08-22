/*
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
 */

package beans;
import  java.sql.Time ;
import java.util.Date;

public class FeedbackBean {
    private int feedbackID, userId;
    private String feedbackTime, feedbackDate, content;

    public FeedbackBean() {
    }

    public FeedbackBean(int feedbackID, int userId, String feedbackTime, String feedbackDate, String content) {
        this.feedbackID = feedbackID;
        this.userId = userId;
        this.feedbackTime = feedbackTime;
        this.feedbackDate = feedbackDate;
        this.content = content;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFeedbackTime() {
        return feedbackTime;
    }

    public void setFeedbackTime(String feedbackTime) {
        this.feedbackTime = feedbackTime;
    }

    public String getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(String feedbackDate) {
        this.feedbackDate = feedbackDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    

}
