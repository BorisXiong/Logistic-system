package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Express;

import java.util.List;
import java.util.Map;

public interface ExpressService {
    //根据订单编号或者姓名或者电话查询所有结果
    public List<Map> expressdetailsList(BaseQuery baseQuery, Express express);
    //查询总条数
    public int selectCount1(Express express);

    public List<Map> expressList(BaseQuery baseQuery,Express express);
    //查询总条数
    public int selectCount(Express express);
    //修改查询
    public List<Express> updateSelect(Express express);
    //修改
    public int update(Express express);
}
