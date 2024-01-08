package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Express;
import com.aaa.mapper.ExpressMapper;
import com.aaa.service.ExpressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class ExpressServiceImpl implements ExpressService {

    @Autowired
    private ExpressMapper expressMapper;

    @Override
    public List<Map> expressdetailsList(BaseQuery baseQuery, Express express) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("expnum", express.getExpnum());
        map.put("sender", express.getSender());
        map.put("sendphone", express.getSendphone());
        return expressMapper.expressdetailsList(map);
    }

    @Override
    public int selectCount1(Express express) {
        return expressMapper.selectCount(express);
    }


    @Override
    public List<Map> expressList(BaseQuery baseQuery, Express express) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage()+1;
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("expnum",express.getExpnum());
        return expressMapper.expressList(map);
    }

    @Override
    public int selectCount(Express express) {
        return expressMapper.selectCount(express);
    }

    @Override
    public List<Express> updateSelect(Express express) {
        return expressMapper.updateSelect(express);
    }

    @Override
    public int update(Express express) {
        return expressMapper.update(express);
    }
}
