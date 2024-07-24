package com.ureca.plant.dto;

import java.sql.Date;

public class Plant {
	private int id;
//	private String image;
	private String name;
	private String period;
	private Date date;
	
	public Plant() {
		
	}

	public Plant(int id, String name, String period, Date date) {
		super();
		this.id = id;
//		this.image = image;
		this.name = name;
		this.period = period;
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

//	public String getImage() {
//		return image;
//	}
//
//	public void setImage(String image) {
//		this.image = image;
//	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Plant [id=" + id + ", name=" + name + ", period=" + period + ", date=" + date + "]";
	}
	
}
