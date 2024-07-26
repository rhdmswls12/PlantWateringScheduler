package com.ureca.plant.dto;

import java.sql.Date;

public class Plant {
	private int id;
	private String file;
	private String name;
	private int period;
	private Date date;
	
	public Plant() {
		
	}

	public Plant(int id, String file, String name, int period, Date date) {
		super();
		this.id = id;
		this.file = file;
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

	public String getFile() {
		return file;
	}

	public void setImage(String file) {
		this.file = file;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
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
		return "Plant [id=" + id + ", file=" + file + ", name=" + name + ", period=" + period + ", date=" + date + "]";
	}
	
}
