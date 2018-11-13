package com.aaron.babebasket.models;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import io.swagger.annotations.ApiParam;

@Document(collection = "advertisements")
public class Advertisement {

	@Id
	@ApiParam(hidden = true)
	private String id;

	@ApiParam(required = true, value = "title of ads")
	private String title;

	@ApiParam(required = true, value = "ads description")
	private String description;

	@ApiParam(required = true, value = "address of ads")
	private Address address;

	@ApiParam(required = true, value = "get credit for posting ads")
	private int price;

	@ApiParam(required = true, value = "ads email")
	private String email;

	@ApiParam(required = true, value = "phone ads")
	private String phone;

	@ApiParam(required = true, value = "ads status", example = "AVAILABLE")
	private AdvertStatus status = AdvertStatus.AVAILABLE;

	@ApiParam(required = true, value = "ads small description")
	private String smalldescription;

	@ApiParam(required = true, value = "ads category")
	private String categoryName;

	@ApiParam(required = true, value = "ads subcategories")
	private String subcategories;

	@ApiParam(required = true, value = "ads condition")
	private String condition;

	@ApiParam(required = true, value = "ads  date Of Purchase")
	private String dateOfPurchase;

	private List<AdvertImage> images = new ArrayList<>();

	private List<byte[]> imageContents = new ArrayList<>();

	@ApiParam(required = true, value = "ads  date Of creation")
	private Date creationDate = new Date();

	private List<AdvertMessage> message = new ArrayList<>();

	private List<AdvertOffer> offers = new ArrayList<>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public AdvertStatus getStatus() {
		return status;
	}

	public void setStatus(AdvertStatus status) {
		this.status = status;
	}

	public String getSmalldescription() {
		return smalldescription;
	}

	public void setSmalldescription(String smalldescription) {
		this.smalldescription = smalldescription;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getSubcategories() {
		return subcategories;
	}

	public void setSubcategories(String subcategories) {
		this.subcategories = subcategories;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getDateOfPurchase() {
		return dateOfPurchase;
	}

	public void setDateOfPurchase(String dateOfPurchase) {
		this.dateOfPurchase = dateOfPurchase;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public List<byte[]> getImageContents() {
		images.forEach(i -> {
			if (i.getPath() != null && !i.getPath().isEmpty()) {
				try {
					imageContents.add(Files.readAllBytes(Paths.get("/Users/Aaron/Desktop/", id, i.getPath())));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		});
		return imageContents;
	}

	public List<AdvertImage> getImages() {
		return images;
	}

	public void setImages(List<AdvertImage> images) {
		this.images = images;
	}

	public List<AdvertOffer> getOffers() {
		return offers;
	}

	public void setOffers(List<AdvertOffer> offers) {
		this.offers = offers;
	}

	public List<AdvertMessage> getMessage() {
		return message;
	}

	public void setMessage(List<AdvertMessage> message) {
		this.message = message;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		Advertisement that = (Advertisement) o;
		return Objects.equals(id, that.id);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public String toString() {
		return "Advertisement [id=" + id + ", title=" + title + ", description=" + description + ", address=" + address
				+ ", price=" + price + ", email=" + email + ", phone=" + phone + ", status=" + status
				+ ", smalldescription=" + smalldescription + ", categoryName=" + categoryName + ", subcategories="
				+ subcategories + ", condition=" + condition + ", dateOfPurchase=" + dateOfPurchase + ", images="
				+ images + ", creationDate=" + creationDate + ", message=" + message + ", offers=" + offers + "]";
	}

}
