package com.timetrove.model;

/**
 * Represents a user of the TimeTrove system.
 * Includes attributes for authentication, contact info, and role.
 */
public class User {
    private int id;                // Primary key, used as foreign key in other tables
    private String firstName;
    private String lastName;
    private String username;
    private String birthday;
    private String gender;
    private String phone;
    private String email;
    private String role;
    private String password;
    private String address;

    /** No-arg constructor (required for servlet/JSP binding) */
    public User() {}

    /** Optional all-args constructor */
    public User(int id, String firstName, String lastName, String username, String birthday,
                String gender, String phone, String email, String role, String password, String address) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.birthday = birthday;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.role = role;
        this.password = password;
        this.address = address;
    }

    // ✅ Getters and Setters

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getBirthday() { return birthday; }
    public void setBirthday(String birthday) { this.birthday = birthday; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    @Override
    public String toString() {
        return "User{" +
            "id=" + id +
            ", username='" + username + '\'' +
            ", role='" + role + '\'' +
            ", email='" + email + '\'' +
            '}';
    }
}
