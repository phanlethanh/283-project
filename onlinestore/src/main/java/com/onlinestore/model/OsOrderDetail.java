package com.onlinestore.model;

// Generated Nov 29, 2014 12:31:44 PM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * OsOrderDetail generated by hbm2java
 */
@Entity
@Table(name = "os_order_detail", schema = "public")
public class OsOrderDetail implements java.io.Serializable {

	private int id;
	private OsOrder osOrder;
	private Product product;
	private Integer quantity;
	private Double price;
	private Boolean active;

	public OsOrderDetail() {
	}

	public OsOrderDetail(int id) {
		this.id = id;
	}

	public OsOrderDetail(int id, OsOrder osOrder, Product product,
			Integer quantity, Double price, Boolean active) {
		this.id = id;
		this.osOrder = osOrder;
		this.product = product;
		this.quantity = quantity;
		this.price = price;
		this.active = active;
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
	@JoinColumn(name = "order_id")
	public OsOrder getOsOrder() {
		return this.osOrder;
	}

	public void setOsOrder(OsOrder osOrder) {
		this.osOrder = osOrder;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id")
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Column(name = "quantity")
	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@Column(name = "price", precision = 17, scale = 17)
	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Column(name = "active")
	public Boolean getActive() {
		return this.active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

}
