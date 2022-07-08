package com.shop.fashion.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Board {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "userId")
    @Column(nullable = false)
    private User user;
    @Column(nullable = false)
    private String title;
    private int reaction;
    @Column(nullable = false)
    @OneToMany
    private Image image;
    @Column(nullable = false)
    private int replyCount;
    @Column(nullable = false)
    private String itemLink;

    @CreationTimestamp
    private Timestamp createDate;
}
