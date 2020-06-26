package com.claimcap.reader.model;

import javax.persistence.*;

@Entity
@Table(name="contactInfo")
public class ContactInfo {

	@Id
	private Long id;
	
	private String street;
	private String city;
	private String state;
	private String zip;
	private String phone;
	
	@OneToOne
	@MapsId		//maps to User.id
	private User user;
	
	
	//CONSTRUCTORS
	public ContactInfo() {}
	
	
	public ContactInfo(Long id, String street, String city, String state, String zip, String phone) {
		super();
		this.id = id;
		this.street = street;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.phone = phone;
	}
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}


	@Override
	public String toString() {
		return "ContactInfo [id=" + id + ", street=" + street + ", city=" + city + ", state=" + state + ", zip=" + zip
				+ ", phone=" + phone + ", user=" + user + "]";
	}


}//end class
