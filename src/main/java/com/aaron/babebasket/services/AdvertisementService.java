package com.aaron.babebasket.services;

import com.aaron.babebasket.exception.AdvertNotFoundException;
import com.aaron.babebasket.models.*;
import com.aaron.babebasket.repositories.AdvertisementRepository;
import com.google.maps.DistanceMatrixApi;
import com.google.maps.GeoApiContext;
import com.google.maps.errors.ApiException;
import com.google.maps.model.DistanceMatrixElement;
import com.google.maps.model.DistanceMatrixRow;
import com.mongodb.client.result.UpdateResult;
import org.bson.types.ObjectId;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;


@Service
public class AdvertisementService {

	private static final Logger LOG = LoggerFactory.getLogger(AdvertisementService.class);

	private static final double METRES_IN_MILE = 0.000621371;

	@Autowired
	private AdvertisementRepository adsRepository;

	@Autowired
	private UsersService userservice;

	@Autowired
	private MongoTemplate mongoTemplate;

	@Value("${google.api.key}")
	private String apiKey;

	@Value("${upload.path}")
	private String uploadPath;

	public Advertisement createAds(Advertisement ads) {
		return adsRepository.save(ads);
	}

	public List<Advertisement> getAllAds() {
		return adsRepository.findByStatus(AdvertStatus.AVAILABLE);
	}

	/**
	 * get category by categoryName
	 *
	 * @param categoryName the ads
 	 */
	public List<Advertisement> getAdsName(String categoryName) {
		return adsRepository.findByCategoryNameAndStatus(categoryName, AdvertStatus.AVAILABLE);
	}

	public List<Advertisement> getAdsTitleName(String title) {
		return adsRepository.findBytitleAndStatus(title, AdvertStatus.AVAILABLE);
	}

	public List<Advertisement> getAdsCondition(String condition) {
		return adsRepository.findByConditionAndStatus(condition, AdvertStatus.AVAILABLE);
	}

	/**
	 * get category by creation date
	 *
	 * @param creationDate the ads
 	 */
	public List<Advertisement> getAdsCreationDate(Date creationDate) {
		return adsRepository.findByCreationDateGreaterThanAndStatus(creationDate, AdvertStatus.AVAILABLE);
	}

	public List<Advertisement> getSubCategoryName(String subcategories) {
		return adsRepository.findBySubcategoriesAndStatus(subcategories, AdvertStatus.AVAILABLE);
	}

	public Advertisement getAdsById(String id) {
		return adsRepository.findById(id).orElseThrow(AdvertNotFoundException::new);
	}

	public List<Advertisement> getAdvertsByEmail(String email) {
		System.out.println("emaaaail"+email);
		return adsRepository.findByEmail(email);
	}

	public long getAdsCount(String categoryName) {
		return adsRepository.countByCategoryName(categoryName);
	}

	public boolean addImagesToAdvert(String advertId, String name, InputStream image) {

		Advertisement advert = getAdsById(advertId);
		List<AdvertImage> toAdd = advert.getImages();
		LOG.info("current images = {}", toAdd.size());

		try {
			String tempPath = name + new ObjectId().toHexString();
			Path path = Paths.get(uploadPath, advertId, tempPath);
			if (!Files.exists(path)) {
				Files.createDirectories(path);
			}

			long size = Files.copy(image, path, StandardCopyOption.REPLACE_EXISTING);
			toAdd.add(new AdvertImage(name, tempPath, size));
		} catch (Exception e) {
			LOG.error("{}{}", e.getMessage(), e.getCause());
			return false;
		} finally {
			if (image != null) {
				try {
					image.close();
				} catch (IOException e) {
					LOG.error(e.getMessage());
				}
			}
		}

		// do the update
		Update update = new Update().set("images", toAdd);
		UpdateResult updated = mongoTemplate.updateFirst(new Query(Criteria.where("_id").is(advertId)), update,
				"advertisements");
		LOG.info("update result = {}", updated.wasAcknowledged());
		LOG.info("current size of images = {}", toAdd.size());
		return updated.wasAcknowledged();
	}

	private boolean swapAdvertisements(String offeredItemId, String recievedItemId) {
		Advertisement offeredAd = getAdsById(offeredItemId);
		Advertisement advToRecieve = getAdsById(recievedItemId);

		UpdateResult offerdUpdate = mongoTemplate.updateFirst(new Query(Criteria.where("_id").is(offeredAd.getId())),
				acceptAvert(), "advertisements");

		UpdateResult recievedUpdate = mongoTemplate.updateFirst(
				new Query(Criteria.where("_id").is(advToRecieve.getId())), acceptAvert(), "advertisements");

		return offerdUpdate.wasAcknowledged() && recievedUpdate.wasAcknowledged();
	}

	private boolean payForItemWithPoints(String advertId, String buyerId) {
		Advertisement advert = getAdsById(advertId);
		
 		Users buyer = userservice.getUserById(buyerId);
 		System.out.println("buyerIdfgfdsdfd ==" + advert);
 		Users advertOwner = userservice.getUserByEmail(advert.getEmail());
		

		boolean result = false;

		if (buyer.getPoints() >= advert.getPrice()) {

			Update advUpdate = new Update().set("status", AdvertStatus.ACCEPTED);
			UpdateResult adUpdated = mongoTemplate.updateFirst(new Query(Criteria.where("_id").is(advertId)), advUpdate,
					"advertisements");

			if (adUpdated.wasAcknowledged()) {
				Update buyerUpdate = new Update().set("points", buyer.getPoints() - advert.getPrice());
				result = mongoTemplate
						.updateFirst(new Query(Criteria.where("_id").is(buyer.getId())), buyerUpdate, "users")
						.wasAcknowledged();

				Update ownerUpdate = new Update().set("points", advertOwner.getPoints() + advert.getPrice());
				result = result && mongoTemplate
						.updateFirst(new Query(Criteria.where("_id").is(advertOwner.getId())), ownerUpdate, "users")
						.wasAcknowledged();
			}
		}

		return result;
	}


	public boolean acceptOffer(String advertId, String offerId) {

		Advertisement advert = getAdsById(advertId);
		List<AdvertOffer> offers = advert.getOffers().stream()
 				.filter(f -> f.getId().equalsIgnoreCase(offerId))
				.collect(Collectors.toList());
		if (offers.isEmpty())
			throw new IllegalArgumentException("offer " + offerId + " not present in offers");

		AdvertOffer offer = offers.get(0);
		offer.setStatus(OfferStatus.ACCEPTED);
		mongoTemplate.updateFirst(
				new Query(Criteria.where("_id").is(advertId)),
				new Update().set("offers", offers),
				"advertisements");

		if (offer.getType().equals(AdvertOffer.Type.ADVERT))
			return swapAdvertisements(advertId, offer.getAdvertIdOffered());
		else
			return payForItemWithPoints(advertId, offer.getFrom());
	}


	public boolean offerWithPoints(String advertId, String userId, double amount) {
		Advertisement advert = getAdsById(advertId);
		advert.getOffers().add(new AdvertOffer(userId, AdvertOffer.Type.POINT, amount, null));
		return mongoTemplate.updateFirst(
				new Query(Criteria.where("_id").is(advertId)),
				new Update().set("offers", advert.getOffers()),
				"advertisements"
		).wasAcknowledged();
	}


	public boolean offerWithAdvert(String advertId, String userId, String offeredAdvertId) {
		Advertisement advert = getAdsById(advertId);
		advert.getOffers().add(new AdvertOffer(userId, AdvertOffer.Type.ADVERT, 0, offeredAdvertId));
		return mongoTemplate.updateFirst(
				new Query(Criteria.where("_id").is(advertId)),
				new Update().set("offers", advert.getOffers()),
				"advertisements"
		).wasAcknowledged();
	}


	public boolean rejectAdvertOffer(String advertId, String offerId) {
		Advertisement advert = getAdsById(advertId);
		List<AdvertOffer> offers = advert.getOffers();
		if (!offers.isEmpty()) {
			List<AdvertOffer> filterd = offers.stream().filter(f -> f.getId().equalsIgnoreCase(offerId)).collect(Collectors.toList());
			if (filterd.isEmpty())
				throw new IllegalArgumentException(offerId + " not among offers");

			AdvertOffer offer = filterd.get(0);
			offer.setStatus(OfferStatus.REJECTED);
		}


		return mongoTemplate.updateFirst(
				new Query(Criteria.where("_id").is(advertId)),
				new Update().set("offers", offers),
				"advertisements"
		).wasAcknowledged();
	}

	private Update acceptAvert() {
		return new Update().set("status", AdvertStatus.ACCEPTED);
	}

	public Set<Advertisement> getAdsByDistance(String postcode, long range) {

		Set<Advertisement> result = new HashSet<>();

		List<Advertisement> allAds = getAllAds();

		String[] allPostcodes = allAds.stream().map(map -> map.getAddress().getPostcode()).collect(Collectors.toSet())
				.toArray(new String[0]);

		GeoApiContext context = new GeoApiContext.Builder().apiKey(apiKey).build();

		try {
			DistanceMatrixRow row = DistanceMatrixApi.newRequest(context).origins(postcode).destinations(allPostcodes)
					.await().rows[0];

			for (int i = 0; i < allPostcodes.length - 1; i++) {
				DistanceMatrixElement elem = row.elements[i];
				if (elem.distance != null && (elem.distance.inMeters * METRES_IN_MILE) <= range) {
					final String code = allPostcodes[i];
					Set<Advertisement> ads = allAds.stream()
							.filter(f -> f.getAddress().getPostcode().equalsIgnoreCase(code))
							.collect(Collectors.toSet());
					result.addAll(ads);
				}
			}

		} catch (ApiException | InterruptedException | IOException e) {
			LOG.error(e.getMessage());
			throw new RuntimeException("error from map service." + e.getMessage());
		}

		return result;
	}

}
