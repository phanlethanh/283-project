package com.onlinestore.model;

// Generated Nov 29, 2014 12:31:44 PM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * OsUser generated by hbm2java
 */
@Entity
@Table(name = "os_user", schema = "public", uniqueConstraints = @UniqueConstraint(columnNames = "username"))
public class OsUser implements java.io.Serializable {

	private int id;
	private UserGroup userGroup;
	private String username;
	private String password;
	private String fullName;
	private String address;
	private String phone;
	private Date createDate;
	private Date writeDate;
	private Boolean active;
	private Set<OsOrder> osOrders = new HashSet<OsOrder>(0);

	public OsUser() {
	}

	public OsUser(int id) {
		this.id = id;
	}

	public OsUser(int id, UserGroup userGroup, String username,
			String password, String fullName, String address, String phone,
			Date createDate, Date writeDate, Boolean active,
			Set<OsOrder> osOrders) {
		this.id = id;
		this.userGroup = userGroup;
		this.username = username;
		this.password = password;
		this.fullName = fullName;
		this.address = address;
		this.phone = phone;
		this.createDate = createDate;
		this.writeDate = writeDate;
		this.active = active;
		this.osOrders = osOrders;
	}

	@Id
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "group_id")
	public UserGroup getUserGroup() {
		return this.userGroup;
	}

	public void setUserGroup(UserGroup userGroup) {
		this.userGroup = userGroup;
	}

	@Column(name = "username", unique = true, length = 16)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", length = 16)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "full_name", length = 32)
	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	@Column(name = "address", length = 256)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "phone", length = 16)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "osUser")
	public Set<OsOrder> getOsOrders() {
		return this.osOrders;
	}

	public void setOsOrders(Set<OsOrder> osOrders) {
		this.osOrders = osOrders;
	}

}
