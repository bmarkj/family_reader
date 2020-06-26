package com.claimcap.reader.model;

import javax.persistence.*;

@Entity
@Table(name="paymethod")
public class PaymentMethod {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String expiry;
	private String cardNo;
	private String secCode;
	private String cardType;
	
	@ManyToOne(cascade=CascadeType.DETACH) //deleting card does not delete user
	@JoinColumn(name="users_id")
	private User user;
	
	
	public PaymentMethod() {}


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}


	public String getExpiry() {
		return expiry;
	}
	public void setExpiry(String expiry) {
		this.expiry = expiry;
	}


	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}


	public String getSecCode() {
		return secCode;
	}
	public void setSecCode(String secCode) {
		this.secCode = secCode;
	}


	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}


	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}


	@Override
	public String toString() {
		return "PaymentMethod [id=" + id + ", expiry=" + expiry + ", cardNo=" + cardNo + ", secCode=" + secCode
				+ ", cardType=" + cardType + ", user=" + user + "]";
	}

}
