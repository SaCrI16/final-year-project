package com.aaron.babebasket.services;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import com.aaron.babebasket.models.AdvertMessage;
import com.aaron.babebasket.repositories.AdvertisementRepository;


@Service
public class MessageService {

	@Autowired
	private AdvertisementRepository advertisementRepository;

	@Autowired
	private MongoTemplate mongoTemplate;

	public AdvertMessage sendMessage(AdvertMessage message, String advertId) {
		Update update = new Update().addToSet("message", message);
		Query query = new Query(Criteria.where("_id").is(advertId));
		return mongoTemplate.updateFirst(query, update, "advertisements").wasAcknowledged() ? message : null;
	}

	/**
	 * get messages sent to a user
	 * 
	 * @param userId
	 *            the user to get messages sent
	 * @return
	 */
	public List<AdvertMessage> getMessages(String userId) {
		System.out.println(userId);
 		return advertisementRepository.findByMessageSendTo(userId).stream()
				.map(m -> m.getMessage())
				.flatMap(f -> f.stream())
				.filter(f -> f.getSendTo().equals(userId))
				.collect(Collectors.toList());
	}

}
