package com.aaron.babebasket.models;

import org.bson.types.ObjectId;

import java.util.Date;
import java.util.Objects;

public class AdvertOffer {

	private String id = new ObjectId().toHexString();
	private String from;

	public enum Type {
		POINT, ADVERT
	}

	private Type type;

	private double amountOffered;
	private String advertIdOffered;
	private OfferStatus status = OfferStatus.PENDING;
	private Date offerDate = new Date();


	public AdvertOffer() {
	}

	public AdvertOffer(String from, Type type, double amountOffered, String advertIdOffered) {
		this.from = from;
		this.type = type;
		this.amountOffered = amountOffered;
		this.advertIdOffered = advertIdOffered;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public double getAmountOffered() {
		return amountOffered;
	}

	public void setAmountOffered(double amountOffered) {
		this.amountOffered = amountOffered;
	}

	public String getAdvertIdOffered() {
		return advertIdOffered;
	}

	public void setAdvertIdOffered(String advertIdOffered) {
		this.advertIdOffered = advertIdOffered;
	}

	public OfferStatus getStatus() {
		return status;
	}

	public void setStatus(OfferStatus status) {
		this.status = status;
	}


	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public Date getOfferDate() {
		return offerDate;
	}

	public void setOfferDate(Date offerDate) {
		this.offerDate = offerDate;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		AdvertOffer that = (AdvertOffer) o;
		return Objects.equals(id, that.id);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}


	@Override
	public String toString() {
		return "AdvertOffer{" +
				"id='" + id + '\'' +
				", from='" + from + '\'' +
				", type=" + type +
				", amountOffered=" + amountOffered +
				", advertIdOffered='" + advertIdOffered + '\'' +
				", status=" + status +
				", offerDate=" + offerDate +
				'}';
	}
}
