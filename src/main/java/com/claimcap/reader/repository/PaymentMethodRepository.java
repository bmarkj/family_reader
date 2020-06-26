package com.claimcap.reader.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.claimcap.reader.model.PaymentMethod;

public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Long> {
	

}
