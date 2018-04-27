package com.daxia.wz.dto.api.info;

import java.util.List;

import com.daxia.wz.dto.api.ProvinceAPIDTO;

public class ProvinceInfoAPIDTO extends BaseInfoAPIDTO {
    
    public ProvinceInfoAPIDTO(List<ProvinceAPIDTO> provinceInfos) {
        super();
        this.provinceInfos = provinceInfos;
    }

    private List<ProvinceAPIDTO> provinceInfos;

    /**
     * @return the provinceInfos
     */
    public List<ProvinceAPIDTO> getProvinceInfos() {
        return provinceInfos;
    }

    /**
     * @param provinceInfos the provinceInfos to set
     */
    public void setProvinceInfos(List<ProvinceAPIDTO> provinceInfos) {
        this.provinceInfos = provinceInfos;
    }
    
}
