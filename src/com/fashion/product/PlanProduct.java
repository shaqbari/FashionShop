package com.fashion.product;

import java.util.ArrayList;

public class PlanProduct {
	private int planproduct_id;
	private int plan_id;
	private int product_id;
	private Product product;

	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getPlanproduct_id() {
		return planproduct_id;
	}
	public void setPlanproduct_id(int planproduct_id) {
		this.planproduct_id = planproduct_id;
	}
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	
	
	
}
