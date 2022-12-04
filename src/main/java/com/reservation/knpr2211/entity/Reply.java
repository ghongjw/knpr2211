package com.reservation.knpr2211.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Data
@Entity(name = "reply")
public class Reply {

    @Id
    @GeneratedValue
    private Long rno;

    @Column(nullable = false, length = 120)
    String content;

    @OneToOne
    @JoinColumn(name="bno", referencedColumnName = "bno", insertable = true, updatable = true)
    private Board board;

//    @ManyToOne
//    @JoinColumn(name="id")
//    private User user;

    @CreationTimestamp
    private Timestamp createDate;
};


