package com.aws.poc.controller;

import java.util.Date;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aws.poc.model.ResponseData;

@RestController
@RequestMapping("/banking/")
public class HealthCheckController {
	@GetMapping(path = "/health")
	public ResponseEntity<?> ok() {
		return ResponseEntity.ok().build();
	}

	@GetMapping(path = "/data")
	public ResponseEntity<ResponseData> data() {
		// return ResponseEntity.ok().body(service.getEC2Data());
		// its a dummy change to check
		ResponseData data = new ResponseData("aws-api-blue-green-0.0.21", "Here I'm being deployed thru code pipeline",
				new Date().toString(), 0);
		return ResponseEntity.ok().body(data);
	}

}
