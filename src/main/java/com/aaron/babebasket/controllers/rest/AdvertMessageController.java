package com.aaron.babebasket.controllers.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aaron.babebasket.models.AdvertMessage;
import com.aaron.babebasket.services.MessageService;

import io.swagger.annotations.Api;

@Api
@RestController
@RequestMapping("message")
public class AdvertMessageController {
	
	@Autowired
	private MessageService messageservice; 
	
	@PostMapping("send-message")
	public AdvertMessage sendMessage(AdvertMessage message, String advertId) {
	
		return messageservice.sendMessage(message, advertId);
		
	}
	
	@GetMapping("messageByUserId")
	public List<AdvertMessage> getmessageByUserId(String userId) {
		return messageservice.getMessages(userId);
	}

	

}
