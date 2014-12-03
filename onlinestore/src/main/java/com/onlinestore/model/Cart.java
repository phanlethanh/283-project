package com.onlinestore.model;

// Generated Dec 4, 2014 2:47:04 AM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Cart generated by hbm2java
 */
@Entity
@Table(name = "cart", schema = "public")
public class Cart implements java.io.Serializable {

	private int id;
	private Date createDate;
	private Date writeDate;
	private Boolean active;
	private Set<CartProduct> cartProducts = new HashSet<CartProduct>(0);
	private Set<OsUser> osUsers = new HashSet<OsUser>(0);

	public Cart() {
	}

	public Cart(int id) {
		this.id = id;
	}

	public Cart(int id, Date createDate, Date writeDate, Boolean active,
			Set<CartProduct> cartProducts, Set<OsUser> osUsers) {
		this.id = id;
		this.createDate = createDate;
		this.writeDate = writeDate;
		this.active = active;
		this.cartProducts = cartProducts;
		this.osUsers = osUsers;
	}

	@Id
	@Column(name = "id", unique = true, nullable = false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date", length = 29)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "write_date", length = 29)
	public Date getWriteDate() {
		return this.writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Column(name = "active")
	public Boolean getActive() {
		return this.active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cart")
	public Set<CartProduct> getCartProducts() {
		return this.cartProducts;
	}

	public void setCartProducts(Set<CartProduct> cartProducts) {
		this.cartProducts = cartProducts;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cart")
	public Set<OsUser> getOsUsers() {
		return this.osUsers;
	}

	public void setOsUsers(Set<OsUser> osUsers) {
		this.osUsers = osUsers;
	}

}
