package com.claimcap.reader.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown=true)
public class GBItemsWrapper {
	
	private GBVolumeWrapper volumeInfo;

	
	
	
	public GBVolumeWrapper getVolumeInfo() {
		return volumeInfo;
	}
	public void setVolumeInfo(GBVolumeWrapper volumeInfo) {
		this.volumeInfo = volumeInfo;
	}
	
}
