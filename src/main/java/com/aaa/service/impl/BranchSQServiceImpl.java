package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Branch;
import com.aaa.entity.BranchSQ;
import com.aaa.mapper.BranchSQMapper;
import com.aaa.service.BranchSQService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BranchSQServiceImpl implements BranchSQService {
    @Autowired
    private BranchSQMapper branchSQMapper;
    @Override
    public int insertBranchSQ(BranchSQ branchSQ) {
        return branchSQMapper.insertBranchSQ(branchSQ);
    }

    @Override
    public List<Map> branchSQList(BaseQuery baseQuery, BranchSQ branchSQ) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("bracode", branchSQ.getBracode());
        return branchSQMapper.branchSQList(map);
    }

    @Override
    public int selectCount(BranchSQ branchSQ) {
        return branchSQMapper.selectCount(branchSQ);
    }

    @Override
    public List<BranchSQ> updatesel(BranchSQ branchSQ) {
        return branchSQMapper.updatesel(branchSQ);
    }

    @Override
    public int updatepass(BranchSQ branchSQ) {
        return branchSQMapper.updatepass(branchSQ);
    }

    @Override
    public int updateturn(BranchSQ branchSQ) {
        return branchSQMapper.updateturn(branchSQ);
    }

    @Override
    public List<Map> branchJGList(BaseQuery baseQuery, BranchSQ branchSQ) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("bracode", branchSQ.getBracode());
        return branchSQMapper.branchJGList(map);
    }

    @Override
    public int selectCountJG(BranchSQ branchSQ) {
        return branchSQMapper.selectCountJG(branchSQ);
    }

    @Override
    public List<BranchSQ> updateSQList(BranchSQ branchSQ) {
        return branchSQMapper.updateSQList(branchSQ);
    }

    @Override
    public int updateSQ(BranchSQ branchSQ) {
        return branchSQMapper.updateSQ(branchSQ);
    }

    @Override
    public int delSQ(BranchSQ branchSQ) {
        return branchSQMapper.delSQ(branchSQ);
    }
}
