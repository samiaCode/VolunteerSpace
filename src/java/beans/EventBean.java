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

public class EventBean {
    private int eventId, numberOfVolunteers, organizerId, adminId;
    private String title, eventStatus, description, eventAdress,
            coordinatorContactNumber, volunteersGender, eventPicture,
            eventApproval;
    private String startingTime, endingTime, startingDate, endingDate;

     public EventBean( ) {

    }

    public EventBean(int eventId, int numberOfVolunteers, int organizerId, int adminId, String title, String eventStatus, String description, String eventAdress, String coordinatorContactNumber, String volunteersGender, String eventPicture, String eventApproval, String startingTime, String endingTime, String startingDate, String endingDate) {
        this.eventId = eventId;
        this.numberOfVolunteers = numberOfVolunteers;
        this.organizerId = organizerId;
        this.adminId = adminId;
        this.title = title;
        this.eventStatus = eventStatus;
        this.description = description;
        this.eventAdress = eventAdress;
        this.coordinatorContactNumber = coordinatorContactNumber;
        this.volunteersGender = volunteersGender;
        this.eventPicture = eventPicture;
        this.eventApproval = eventApproval;
        this.startingTime = startingTime;
        this.endingTime = endingTime;
        this.startingDate = startingDate;
        this.endingDate = endingDate;
    }
     


    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public int getNumberOfVolunteers() {
        return numberOfVolunteers;
    }

    public void setNumberOfVolunteers(int numberOfVolunteers) {
        this.numberOfVolunteers = numberOfVolunteers;
    }

    public int getOrganizerId() {
        return organizerId;
    }

    public void setOrganizerId(int organizerId) {
        this.organizerId = organizerId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getEventStatus() {
        return eventStatus;
    }

    public void setEventStatus(String eventStatus) {
        this.eventStatus = eventStatus;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEventAdress() {
        return eventAdress;
    }

    public void setEventAdress(String eventAdress) {
        this.eventAdress = eventAdress;
    }

    public String getCoordinatorContactNumber() {
        return coordinatorContactNumber;
    }

    public void setCoordinatorContactNumber(String coordinatorContactNumber) {
        this.coordinatorContactNumber = coordinatorContactNumber;
    }

    public String getVolunteersGender() {
        return volunteersGender;
    }

    public void setVolunteersGender(String volunteersGender) {
        this.volunteersGender = volunteersGender;
    }

    public String getEventPicture() {
        return eventPicture;
    }

    public void setEventPicture(String eventPicture) {
        this.eventPicture = eventPicture;
    }

    public String getEventApproval() {
        return eventApproval;
    }

    public void setEventApproval(String eventApproval) {
        this.eventApproval = eventApproval;
    }

    public String getStartingTime() {
        return startingTime;
    }

    public void setStartingTime(String startingTime) {
        this.startingTime = startingTime;
    }

    public String getEndingTime() {
        return endingTime;
    }

    public void setEndingTime(String endingTime) {
        this.endingTime = endingTime;
    }

    public String getStartingDate() {
        return startingDate;
    }

    public void setStartingDate(String startingDate) {
        this.startingDate = startingDate;
    }

    public String getEndingDate() {
        return endingDate;
    }

    public void setEndingDate(String endingDate) {
        this.endingDate = endingDate;
    }



    
}
