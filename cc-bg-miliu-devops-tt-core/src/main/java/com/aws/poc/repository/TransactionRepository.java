package com.aws.poc.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aws.poc.entity.AccountTransactionEntity;


@Transactional
public interface TransactionRepository extends JpaRepository<AccountTransactionEntity, Long>{
	public AccountTransactionEntity findByAccountNumber(String accountNumber);
}
