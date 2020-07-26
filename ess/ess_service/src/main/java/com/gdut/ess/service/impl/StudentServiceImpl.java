package com.gdut.ess.service.impl;

import com.gdut.ess.dao.IStudentDao;
import com.gdut.ess.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StudentServiceImpl implements IStudentService {

    @Autowired
    private IStudentDao iStudentDao;

    @Override
    public List<Student> findAll() throws Exception {
        return iStudentDao.findAll();
    }
}
