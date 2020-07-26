package com.gdut.ess.domain;

public class EletWater {
    private String id;
    private double preEletBalance;  // 电费预余额
    private double eletSupply;      // 电费补助
    private double eletBalance;     // 电费总余额
    private Integer eletStatus;     // 0 - 阈值过低 | 余额不足, 1 - 可用
    private double preWaterBalance; // 水费预余额
    private double waterSupply;     // 水费补助
    private double waterBalance;    // 水费总余额
    private Integer waterStatus;    // 0 - 阈值过低 | 余额不足, 1 - 可用
}
