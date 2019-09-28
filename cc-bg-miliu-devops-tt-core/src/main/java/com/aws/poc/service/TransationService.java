package com.aws.poc.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import com.aws.poc.entity.AccountTransactionEntity;
import com.aws.poc.model.AccountTransaction;
import com.aws.poc.repository.TransactionRepository;

@Service
@Configuration
public class TransationService implements CommandLineRunner{
	
	@Autowired
	private TransactionRepository repo;
	
	public AccountTransactionEntity save(@Valid AccountTransaction transaction) {
		AccountTransactionEntity acTxnEntity = repo.findByAccountNumber(transaction.getTxnReference());
		if(acTxnEntity != null && acTxnEntity.getId() != 0) {
			BeanUtils.copyProperties(transaction, acTxnEntity);
			 return repo.save(acTxnEntity);
		}else {
			acTxnEntity =  new AccountTransactionEntity();
			BeanUtils.copyProperties(transaction, acTxnEntity);
			return repo.save(acTxnEntity);
		}
	}
	public List<AccountTransaction> get() {
		List<AccountTransactionEntity> acTxnEntity = repo.findAll();
		List<AccountTransaction> list = 
		acTxnEntity.stream()
					.map(entity -> updateTxnType(entity))
					.map(entity -> copyFromEntityToBean(entity))
					.collect(Collectors.toList());;
		return list;
	}
	
	public List<AccountTransaction> getSevenDayTRansaction() {
		List<AccountTransactionEntity> acTxnEntity = repo.findAll();
		List<AccountTransaction> list = 
		acTxnEntity.stream()
					.filter(entity -> filterLastSevenDayTransaction(entity))
					.map(entity -> updateTxnType(entity))
					.map(entity -> copyFromEntityToBean(entity))
					.collect(Collectors.toList());;
		return list;
	}
	
	private boolean filterLastSevenDayTransaction(AccountTransactionEntity entity) {
		Calendar todayCal =  Calendar.getInstance();
		Calendar sevenDayCal = Calendar.getInstance();
		
		boolean includeToday = true;
		
		if(includeToday) {
			sevenDayCal.add(Calendar.DAY_OF_MONTH, -7);
		}else {
			todayCal.add(Calendar.DAY_OF_MONTH, -1);
			sevenDayCal.add(Calendar.DAY_OF_MONTH, -8);
		}
		if(entity.getTransactionDate().before(todayCal.getTime()) && 
				entity.getTransactionDate().after(sevenDayCal.getTime())) {
			return true;
		}
		return false;
	}
	
	
	private AccountTransaction copyFromEntityToBean(AccountTransactionEntity entity) {
		AccountTransaction bean =  new AccountTransaction();
		BeanUtils.copyProperties(entity, bean);
		return bean;
	}
	private AccountTransactionEntity updateTxnType(AccountTransactionEntity entity) {
		if(entity.getTxnType().equalsIgnoreCase("1")) {
			entity.setTxnType("CREDIT");
		}else {
			entity.setTxnType("DEBIT");
		}
		return entity;
	}
	
	@Override
	public void run(String... args) throws Exception {
		List<AccountTransactionEntity> list = repo.findAll();
		repo.deleteAll();
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, +1);
		list.stream()
				.map(entity -> decrementDate(entity, cal))
				.collect(Collectors.toList());
		repo.saveAll(list);
	}
		private AccountTransactionEntity decrementDate(AccountTransactionEntity entity, Calendar cal) {
			cal.add(Calendar.DAY_OF_MONTH, -1);
			entity.setTransactionDate(cal.getTime());
			return entity;
		}

}
