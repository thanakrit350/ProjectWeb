package com.springmvc.model;

import java.util.*;
import javax.persistence.*;

@Entity
@Table(name = "post")
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "content", nullable = false,length = 10000)
    private String content;

    @Column(name = "created_date", nullable = false)
    private Calendar createdDate;

    @Column(name = "image_url")
    private String imageUrl;
   
    
    @Column(name = "like_count", nullable = false)
    private int likeCount = 0;
    
    @Column(name = "isLikedByUser", nullable = false)
    private boolean isLikedByUser = false;
    
    // ใช้ FetchType.EAGER เพื่อดึงข้อมูลผู้ใช้พร้อมกัน
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_email", nullable = false)
    private User user;

    // ใช้ FetchType.EAGER เพื่อดึงข้อมูลคอมเมนต์พร้อมกัน
    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    private List<Comment> comments = new ArrayList<>();

    public Post() {
        super();
    }

    public Post(String title, String content, Calendar createdDate, String imageUrl, User user) {
        this.title = title;
        this.content = content;
        this.createdDate = createdDate;
        this.imageUrl = imageUrl;
        this.user = user;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Calendar getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Calendar createdDate) {
        this.createdDate = createdDate;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public boolean isLikedByUser() {
	    return isLikedByUser;
	}

	public void setLikedByUser(boolean isLikedByUser) {
	    this.isLikedByUser = isLikedByUser;
	}
}
