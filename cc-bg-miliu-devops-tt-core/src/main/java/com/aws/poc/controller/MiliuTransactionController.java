package com.aws.poc.controller;

import java.net.URI;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.aws.poc.entity.AccountTransactionEntity;
import com.aws.poc.model.AccountTransaction;
import com.aws.poc.model.ResponseData;
import com.aws.poc.service.TransationService;


@RestController
@RequestMapping("/banking/")
public class MiliuTransactionController {

	@Autowired
	private TransationService service;

	@PostMapping(path="/services/transactions")
	public ResponseEntity<ResponseData> postTransaction(@Valid @RequestBody AccountTransaction transaction) {
		AccountTransactionEntity transactionOut= service.save(transaction);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(transactionOut.getId())
				.toUri();
		//return ResponseEntity.created(location).body(service.getEC2Data());
		return ResponseEntity.created(location).build();
	}
	@GetMapping(path="/services/transactions")
	public List<AccountTransaction> getTransaction() {
		return service.get();
	}
	
}
	