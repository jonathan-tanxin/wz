package com.daxia.wz.common;

public enum AppPropertyKey {
    BaiduKey(0, "baidumap.key"), 
    QiniuAK(0, "qiniu.ak"),
    QiniuSK(0, "qiniu.sk"),
    QiniuDomain(0, "qiniu.domain"),
    MerchantLogoParam(2, "merchant.logo"),
    Test2(1, "daxia");

    private int value;
    private String remark;

    private AppPropertyKey(int value, String remark) {
        this.value = value;
        this.remark = remark;
    }

    public int getValue() {
        return value;
    }

    public String getRemark() {
        return remark;
    }

    public static AppPropertyKey getByValue(int value) {
        for (AppPropertyKey o : AppPropertyKey.values()) {
            if (o.getValue() == value) {
                return o;
            }
        }
        return null;
    }
}