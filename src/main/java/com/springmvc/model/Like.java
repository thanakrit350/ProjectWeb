package com.springmvc.model;

import java.util.Calendar;
import javax.persistence.*;

@Entity
@Table(name = "likes") // ใช้ชื่อ 'likes' สำหรับตาราง
public class Like {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "liked_at", nullable = false)
    private Calendar likedAt;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "post_id", nullable = false)
    private Post post;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_email", nullable = false)
    private User user;

    public Like() {
        super();
    }

    public Like(Post post, Calendar likedAt) {
        this.post = post;
        this.likedAt = likedAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Calendar getLikedAt() {
        return likedAt;
    }

    public void setLikedAt(Calendar likedAt) {
        this.likedAt = likedAt;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
    
}
