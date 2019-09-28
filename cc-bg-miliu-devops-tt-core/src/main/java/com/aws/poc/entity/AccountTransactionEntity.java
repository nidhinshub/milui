package com.aws.poc.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "t_account_transaction")
public class AccountTransactionEntity {

	@Id
	private int id ; 
	
	@Column(name="ACCOUNT_ID")
	private int accountId; 
	
	@Pattern(regexp="^[\\sa-zA-Z0-9]+$", message="name must include only alphanumeric.")
	@Column(name="ACCOUNT_NUMBER")
	private String accountNumber;
	
	@Pattern(regexp="^[0-9]+$", message="name must include only numeric.")
	@Column(name="CUSTOMER_NUMBER")
	private String customerNumber;
	
	@Column(name="TX_DATE")
	private Date transactionDate; 
	
	@Size(max=5)
	@Pattern(regexp="^[\\sa-zA-Z0-9]+$", message="name must include only alphanumeric.")
	@Column(name="MCC_CODE")
	private String mccCode;
	
	@Pattern(regexp="^[\\sa-zA-Z0-9]+$", message="name must include only alphanumeric.")
	@Column(name="TX_REFERENCE")
	private String txnReference;
	
	@Pattern(regexp="^[\\sa-zA-Z0-9_ ]+$", message="name must include only alphanumeric.")
	@Column(name="TX_DESC")
	private String txnDescription;
	
	@Pattern(regexp="^[\\sa-zA-Z0-9]+$", message="name must include only alphanumeric.")
	@Column(name="TX_TYPE")
	private String txnType;
	
	
	@Column(name="TX_AMOUNT")
	private Double txnAmount;
	
	@Size(min=5)
	@Pattern(regexp="^[\\sa-zA-Z0-9]+$", message="name must include only alphanumeric.")
	@Column(name="TX_STATUS_CODE")
	private String txnStatusCode;
	
	@Column(name="AVAILABLE_BALANCE")
	private Double availableBalance;	
	
	@Column(name="RECIPIENT")
	private String recipient;
	
	

}
