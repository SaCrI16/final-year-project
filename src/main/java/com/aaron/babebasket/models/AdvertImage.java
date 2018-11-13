package com.aaron.babebasket.models;


import java.util.Date;

public class AdvertImage {

	private String name;
	private String path;
	private Date creationDate = new Date();
	private long size;

	public AdvertImage(String name, String path, long size) {
		this.name = name;
		this.path = path;
		this.size = size;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "AdvertImage{" +
				"name='" + name + '\'' +
				", path='" + path + '\'' +
				", creationDate=" + creationDate +
				", size=" + size +
				'}';
	}
}
