package com.shop.fashion.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Board {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userId")
    private User user;
    @Column(nullable = false)
    private String title;
    private int reaction;
    @Column(nullable = false)
    @OneToMany(mappedBy = "board", cascade = CascadeType.REMOVE)
    private List<Image> images;
    @Column(nullable = false)
    private int replyCount;
    @Column(nullable = false)
    private String itemLink;
    @OneToMany(mappedBy = "board", cascade = CascadeType.REMOVE)
    private List<Reply> replies;

    @CreationTimestamp
    private Timestamp createDate;
}
