package com.claimcap.reader.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;


@Entity
@Table(name="user")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	private String fname;
	private String lname;
	private String email;
	private String password;
	@Transient //i.e., don't persist the following field
	private String password2;
	private String role;
	private String image;
	private String token;
	
	@OneToOne(mappedBy="user", cascade=CascadeType.ALL) //mapped by ContactInfo.user
	ContactInfo contactInfo;
	
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL)
	private List<PaymentMethod> paymentMethod;
	
	@ManyToMany()
	@JoinTable(
			  name = "user_books", 
			  joinColumns = @JoinColumn(name = "user_id"), 
			  inverseJoinColumns = @JoinColumn(name = "book_id"))
	private List<Book> books = new ArrayList<Book>();
	
	
	//No-arg constructor
	public User() {
	}


	//GET-SET
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}

	
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}

	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	
	public ContactInfo getContactInfo() {
		return contactInfo;
	}
	public void setContactInfo(ContactInfo contactInfo) {
		this.contactInfo = contactInfo;
	}
	
	
	public List<PaymentMethod> getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(List<PaymentMethod> paymentMethod) {
		this.paymentMethod = paymentMethod;
	}


	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}


	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}


	//ToString
	@Override
	public String toString() {
		return "Users [id=" + id + ", email=" + email + ", fname=" + fname + ", lname=" + lname + ", password="
				+ password + ", password2=" + password2 + ", role=" + role + ", image=" + image + ", token=" + token
				+ ", contactInfo=" + contactInfo + ", paymentMethod=" + paymentMethod + "]";
	}
		
	
}//end class
