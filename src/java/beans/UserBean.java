/*
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
 */

package beans;

import java.util.Date;

public class UserBean {
    private int userId;
    private String userName, email, contactNumber, address, gender,
            role,organizationName, userPassword,dob;

    public UserBean() {
    }

    
    public UserBean(int userId, String userName, String email, String contactNumber, String address, String gender, String role, String organizationName, String userPassword, String dob) {
        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.contactNumber = contactNumber;
        this.address = address;
        this.gender = gender;
        this.role = role;
        this.organizationName = organizationName;
        this.userPassword = userPassword;
        this.dob = dob;
    }



    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }


    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    
    
}
