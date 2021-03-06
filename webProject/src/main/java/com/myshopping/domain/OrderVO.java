package com.myshopping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	private String order_code;
	private String userid;
	private String order_address;
	private int order_allprice;
	private Date order_day;
	private boolean order_complete;
	private String order_name;
	private String order_phone;
}
