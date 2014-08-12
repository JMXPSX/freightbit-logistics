package com.sr.biz.freightbit.order.entity;
// Generated Jun 4, 2014 9:55:23 PM by Hibernate Tools 3.6.0


import javax.persistence.*;
import java.util.Date;

/**
 * Orderitems generated by hbm2java
 */
@Entity
@Table(name = "orderitems"
        , catalog = "freightbit"
)
public class OrderItems implements java.io.Serializable {


    private Integer orderItemId;
    private Integer clientId;
    private Orders order;
    private Integer orderId;
    private Integer quantity;
    private String classification;
    private String commodity;
    private Double declaredValue;
    private Double weight;
    private String comments;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;
    private Float rate;
    private String nameSize;
    private String status;
    private Float volume;

    public OrderItems() {
    }

    public OrderItems(Integer orderItemId, Integer clientId, Integer orderId, Integer quantity, String classification, String commodity, Double declaredValue, Double weight, String comments, Date createdTimestamp, String createdBy, Date modifiedTimestamp, String modifiedBy, Float rate, String nameSize, String status, Float volume) {
        this.orderItemId = orderItemId;
        this.clientId = clientId;
        this.orderId = orderId;
        this.quantity = quantity;
        this.classification = classification;
        this.commodity = commodity;
        this.declaredValue = declaredValue;
        this.weight = weight;
        this.comments = comments;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
        this.rate = rate;
        this.nameSize = nameSize;
        this.status = status;
        this.volume = volume;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "orderItemId", unique = true, nullable = false)
    public Integer getOrderItemId() {
        return this.orderItemId;
    }

    public void setOrderItemId(Integer orderItemId) {
        this.orderItemId = orderItemId;
    }


    @Column(name = "clientId", nullable = false)
    public Integer getClientId() {
        return this.clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "orderId", nullable = false)
    public Orders getOrder() {
        return this.order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    /*@Column(name = "orderId")
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }*/

    @Column(name = "quantity", nullable = false)
    public Integer getQuantity() {
        return this.quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }


    @Column(name = "classification", nullable = false, length = 10)
    public String getClassification() {
        return this.classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }


    @Column(name = "commodity", nullable = false, length = 100)
    public String getCommodity() {
        return this.commodity;
    }

    public void setCommodity(String commodity) {
        this.commodity = commodity;
    }


    @Column(name = "declaredValue", nullable = false, precision = 12, scale = 0)
    public Double getDeclaredValue() {
        return this.declaredValue;
    }

    public void setDeclaredValue(Double declaredValue) {
        this.declaredValue = declaredValue;
    }

    @Column(name = "weight", nullable = false, precision = 12, scale = 0)
    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    @Column(name = "comments", nullable = false)
    public String getComments() {
        return this.comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "createdTimestamp", nullable = false, length = 19)
    public Date getCreatedTimestamp() {
        return this.createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }


    @Column(name = "createdBy", nullable = false, length = 10)
    public String getCreatedBy() {
        return this.createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "modifiedTimestamp", nullable = false, length = 19)
    public Date getModifiedTimestamp() {
        return this.modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }


    @Column(name = "modifiedBy", nullable = false, length = 10)
    public String getModifiedBy() {
        return this.modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    @Column(name = "rate")
    public Float getRate() {
        return rate;
    }

    public void setRate(Float rate) {
        this.rate = rate;
    }

    @Column(name = "nameSize" , nullable = false)
    public String getNameSize() {
        return nameSize;
    }

    public void setNameSize(String nameSize) {
        this.nameSize = nameSize;
    }

    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "volume")
    public Float getVolume() {
        return volume;
    }

    public void setVolume(Float volume) {
        this.volume = volume;
    }
}


