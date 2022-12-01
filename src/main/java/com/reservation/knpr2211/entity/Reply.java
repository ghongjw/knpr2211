package com.reservation.knpr2211.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity(name = "reply")
public class Reply {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long rno;

   
    @Column(nullable = false, length = 120)
    String content;

    @ManyToOne
    @JoinColumn(name="bno")
    private Board board;

    @ManyToOne
    @JoinColumn(name="id")
    private User user;

    @CreationTimestamp
    private Timestamp createDate;
};


