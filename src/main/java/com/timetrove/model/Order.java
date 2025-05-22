package com.timetrove.model;

import java.sql.Timestamp;

/**
 * Represents an order in the TimeTrove system.
 */
public class Order {
    private int orderId;
    private String fullName;
    private String email;
    private double totalAmount;
    private String status;
    private Timestamp orderDate;

    // No-argument constructor
    public Order() {}

    // Full-argument constructor (optional for convenience)
    public Order(int orderId, String fullName, String email, double totalAmount, String status, Timestamp orderDate) {
        this.orderId = orderId;
        this.fullName = fullName;
        this.email = email;
        this.totalAmount = totalAmount;
        this.status = status;
        this.orderDate = orderDate;
    }

    // ✅ Getters and Setters
    public int getOrderId() {
        return orderId;
    }
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public double getTotalAmount() {
        return totalAmount;
    }
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", totalAmount=" + totalAmount +
                ", status='" + status + '\'' +
                ", orderDate=" + orderDate +
                '}';
    }
}
