package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Branch;
import com.aaa.entity.BranchSQ;

import java.util.List;
import java.util.Map;

public interface BranchSQService {
    public int insertBranchSQ(BranchSQ branchSQ);

    List<Map> branchSQList(BaseQuery baseQuery, BranchSQ branchSQ);
    //查询总条数
    public int selectCount(BranchSQ branchSQ);
    //查询所有
    public List<BranchSQ> updatesel(BranchSQ branchSQ);
    //通过
    public int updatepass(BranchSQ branchSQ);
    //驳回
    public int updateturn(BranchSQ branchSQ);



    public List<Map> branchJGList(BaseQuery baseQuery, BranchSQ branchSQ);
    //查询总条数
    public int selectCountJG(BranchSQ branchSQ);
    //根据网点编号
    public List<BranchSQ> updateSQList(BranchSQ branchSQ);
    //修改网点信息
    public int updateSQ(BranchSQ branchSQ);
    //点击删除
    public int delSQ(BranchSQ branchSQ);
}
