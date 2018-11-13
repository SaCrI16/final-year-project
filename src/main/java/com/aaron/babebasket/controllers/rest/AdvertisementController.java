package com.aaron.babebasket.controllers.rest;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import com.aaron.babebasket.models.Advertisement;
import com.aaron.babebasket.services.AdvertisementService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import org.springframework.web.multipart.MultipartFile;

@Api
@RestController
@RequestMapping("advertisement")
public class AdvertisementController {

	@Autowired
	private AdvertisementService adsService;

	@PostMapping(value = "/add")
	@ApiOperation("add new ads to collection")
	public Advertisement createAds(@RequestBody Advertisement ads, HttpSession session) {
		return adsService.createAds(ads);
	}

	@GetMapping
	@ApiOperation("retrieve all ads")
	public List<Advertisement> getAllAds() {
		return adsService.getAllAds();
	}

	@GetMapping("by-range")
	@ApiOperation("retrieve all ads")
	public Set<Advertisement> getAdsByDistance(String postcode, int maxRange, HttpSession session) {
		return adsService.getAdsByDistance(postcode, maxRange);
	}

	@GetMapping("creationDate")
	@ApiOperation("get category by creationDate")
	public List<Advertisement> getAdsDate(
			@RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date creationDate) {
		return adsService.getAdsCreationDate(creationDate);
	}

	@GetMapping("categoryName")
	// @ApiOperation("get category by id")
	public List<Advertisement> getAdsByName(String categoryName, HttpSession session) {
		return adsService.getAdsName(categoryName);
	}

	@GetMapping("title")
	// @ApiOperation("get category by id")
	public List<Advertisement> getAdsByTitleName(String title, HttpSession session) {
		return adsService.getAdsTitleName(title);
	}

	@GetMapping("condition")
	@ApiOperation("get ads by condition")
	public List<Advertisement> getAdsBycondition(String condition, HttpSession session) {
		return adsService.getAdsCondition(condition);
	}

	@GetMapping("subcategory")
	@ApiOperation("get subcategory by name")
	public List<Advertisement> getAdsBySubCategory(String subcategories, HttpSession session) {
		return adsService.getSubCategoryName(subcategories);
	}

	@GetMapping("count")
	public long getCategoryCount(String categoryName) {
		return adsService.getAdsCount(categoryName);
	}

	@GetMapping("{advertId}")
	public Advertisement getAdvertById(@PathVariable String advertId) {
		return adsService.getAdsById(advertId);
	}

	@GetMapping("user-ads")
	public List<Advertisement> getAdvertsByEmail(@RequestParam String email) {
		return adsService.getAdvertsByEmail(email);
	}

	@PostMapping("{advertId}/addd-image")
	public boolean addImagesToAdvert(@PathVariable String advertId, @RequestParam String name,
	                                 @RequestParam MultipartFile image) throws IOException {
		return adsService.addImagesToAdvert(advertId, name, image.getInputStream());
	}

	@PostMapping("{advertId}/offer/new/point")
	public boolean makePointOffer(@PathVariable String advertId, @RequestParam String userId, @RequestParam double amount) {
		return adsService.offerWithPoints(advertId, userId, amount);
	}


	@PostMapping("{advertId}/offer/new/swap")
	public boolean makeAdvertSwapOffer(@PathVariable String advertId, @RequestParam String userId, @RequestParam String offeredAdvertId) {
		return adsService.offerWithAdvert(advertId, userId, offeredAdvertId);
	}


	@PostMapping("{advertId}/offer/reject")
	public boolean rejectOffer(@PathVariable String advertId, @RequestParam String offerId) {
		return adsService.rejectAdvertOffer(advertId, offerId);
	}


	@PostMapping("{advertId}/offer/accept")
	public boolean acceptOffer(@PathVariable String advertId, @RequestParam String offerId) {
		return adsService.acceptOffer(advertId, offerId);
	}


}
