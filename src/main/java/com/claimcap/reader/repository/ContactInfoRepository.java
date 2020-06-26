package com.claimcap.reader.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.claimcap.reader.model.ContactInfo;

public interface ContactInfoRepository extends JpaRepository<ContactInfo, Long> {

}
