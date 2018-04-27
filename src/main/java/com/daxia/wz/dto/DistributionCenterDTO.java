package com.daxia.wz.dto;

import com.daxia.wz.model.DistributionCenter;
import com.daxia.wz.model.District;

public class DistributionCenterDTO extends DistributionCenter {
	private static final long serialVersionUID = 1L;
	private District queryForDistrict;

	public District getQueryForDistrict() {
		return queryForDistrict;
	}

	public void setQueryForDistrict(District queryForDistrict) {
		this.queryForDistrict = queryForDistrict;
	}

	
}
