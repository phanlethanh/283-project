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
 * Gallery generated by hbm2java
 */
@Entity
@Table(name = "gallery", schema = "public")
public class Gallery implements java.io.Serializable {

	private int id;
	private String name;
	private Date createDate;
	private Date writeDate;
	private Boolean active;
	private Set<Product> products = new HashSet<Product>(0);
	private Set<Image> images = new HashSet<Image>(0);

	public Gallery() {
	}

	public Gallery(int id) {
		this.id = id;
	}

	public Gallery(int id, String name, Date createDate, Date writeDate,
			Boolean active, Set<Product> products, Set<Image> images) {
		this.id = id;
		this.name = name;
		this.createDate = createDate;
		this.writeDate = writeDate;
		this.active = active;
		this.products = products;
		this.images = images;
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

	@Column(name = "name", length = 32)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "gallery")
	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "gallery")
	public Set<Image> getImages() {
		return this.images;
	}

	public void setImages(Set<Image> images) {
		this.images = images;
	}

}
