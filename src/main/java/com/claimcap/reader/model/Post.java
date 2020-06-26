package com.claimcap.reader.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.lang.NonNull;

@Entity
@Table(name="post")
public class Post {
	
    @Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    private Long postId;

    @NonNull
    private String postTitle;

    @NonNull
    private String postAuthor;
    
    private boolean staffPick;
    
    private Date postDate;
    
    private String quote;
    
    private String postContent;

 
    
    
	public Long getPostId() {
		return postId;
	}
	public void setPostId(Long postId) {
		this.postId = postId;
	}

	
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	
	public String getPostAuthor() {
		return postAuthor;
	}
	public void setPostAuthor(String postAuthor) {
		this.postAuthor = postAuthor;
	}


	public boolean getStaffPick() {
		return staffPick;
	}
	public void setStaffPick(boolean staffPick) {
		this.staffPick = staffPick;
	}
	
	
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
		
	public String getQuote() {
		return quote;
	}
	public void setQuote(String quote) {
		this.quote = quote;
	}
	
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	
	
	@Override
	public String toString() {
		return "Post [postId=" + postId + ", postTitle=" + postTitle + ", postAuthor=" + postAuthor + ", staffPick="
				+ staffPick + ", postDate=" + postDate + ", quote=" + quote + ", postContent=" + postContent + "]";
	}

}