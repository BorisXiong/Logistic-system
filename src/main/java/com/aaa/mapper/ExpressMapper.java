package com.aaa.mapper;

import com.aaa.entity.Express;
import com.aaa.entity.Offer;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ExpressMapper extends MyMapper<Express> {
    //根据订单编号或者姓名或者电话查询所有结果
    public List<Map> expressdetailsList(Map<String, Object> map);
    //查询总条数
    public int selectCount1(Express express);

    public List<Map> expressList(Map<String, Object> map);
    //查询总条数
    public int selectCount(Express express);
    //修改查询
    public List<Express> updateSelect(Express express);
    //修改
    public int update(Express express);
}
