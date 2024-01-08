package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Express;
import com.aaa.entity.Expressdetails;

import java.util.List;
import java.util.Map;

public interface ExpressdetailsService {
    //根据订单编号
    public List<Expressdetails> updateList(Expressdetails expressdetails);
}
