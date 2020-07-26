package com.gdut.ess.dao;

import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IStudentDao {

    @Select("select * from students")
    List<Student> findAll() throws Exception;
}
