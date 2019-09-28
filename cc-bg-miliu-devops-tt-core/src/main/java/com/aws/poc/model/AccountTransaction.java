package com.aws.poc.model;

import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class AccountTransaction {
	private int accountId; 
	
	@Pattern(regexp="^[a-zA-Z0-9]+$", message="name must include only alphanumeric.")
	private String accountNumber;
	
	@Pattern(regexp="^[0-9]+$", message="name must include only numeric.")
	private String customerNumber;
	
	private Date transactionDate; 
	
	@Size(max=5)
	@Pattern(regexp="^[a-zA-Z0-9]+$", message="name must include only alphanumeric.")
	private String mccCode;
	
	@Pattern(regexp="^[a-zA-Z0-9]+$", message="name must include only alphanumeric.")
	private String txnReference;
	
	@Pattern(regexp="^[a-zA-Z0-9]+$", message="name must include only alphanumeric.")
	private String txnDescription;
	
	@Pattern(regexp="^[a-zA-Z0-9]+$", message="name must include only alphanumeric.")
	private String txnType;
	
	private Double txnAmount;
	
	@Size(min=5)
	@Pattern(regexp="^[a-zA-Z0-9]+$", message="name must include only alphanumeric.")
	private String txnStatusCode;
	
	private Double availableBalance;	
	
	private String recipient;
	
}
