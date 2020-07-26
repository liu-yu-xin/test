package com.gdut.ess.domain;

public class DormUser {
    private String id;
    private String uno;     //学生学号 || 宿管工号
    private String uname;   //学生姓名 || 宿管姓名
    private Integer usex;   //0 - 男, 1 - 女
    private String uphone;  //联系方式
    private Integer userStatus;     // 0 - 本科生, 1 - 研究生, 2 - 宿管
}
