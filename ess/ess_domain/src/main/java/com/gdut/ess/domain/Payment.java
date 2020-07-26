package com.gdut.ess.domain;

import java.util.Date;

public class Payment {
    private String id;
    private Integer payType;    // 0 - 支付宝, 1 - 微信支付
    private Integer tradeType;  // 0 - 电费, 1 - 水费
    private double payMount;    // 支付金额
    private Date tradeTime;
}
