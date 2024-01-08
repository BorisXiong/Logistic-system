package com.aaa.mapper;

import com.aaa.entity.Branch;
import com.aaa.entity.BranchSQ;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BranchSQMapper extends MyMapper<BranchSQ> {
    public int insertBranchSQ(BranchSQ branchSQ);

    //根据权限查到自己的下级
    public List<Map> branchSQList(Map<String, Object> map);
    //查询总条数
    public int selectCount(BranchSQ branchSQ);
    //查询所有
    public List<BranchSQ> updatesel(BranchSQ branchSQ);
    //通过
    public int updatepass(BranchSQ branchSQ);
    //驳回
    public int updateturn(BranchSQ branchSQ);
    /**==================================审核结果============================================*/
    public List<Map> branchJGList(Map<String, Object> map);
    //查询总条数
    public int selectCountJG(BranchSQ branchSQ);
    //根据网点编号
    public List<BranchSQ> updateSQList(BranchSQ branchSQ);
    //修改网点信息
    public int updateSQ(BranchSQ branchSQ);
    //点击删除
    public int delSQ(BranchSQ branchSQ);
}
