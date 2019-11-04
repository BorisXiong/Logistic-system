package com.aaa.service;




import com.aaa.entity.BaseQuery;
import com.aaa.entity.WstaffdetailsVO;
import com.aaa.entity.WvehicleVO;

import java.util.List;
import java.util.Map;

public interface TuserTwoService{

    List<Map> findUser(BaseQuery baseQuery, WstaffdetailsVO wstaffdetailsVO);
    public int selectCount(WstaffdetailsVO wstaffdetailsVO);
    //根据登录账号查询用户姓名
    public String selTruename(WstaffdetailsVO wstaffdetailsVO);
    //根据真实姓名查询员工所属网点名称
    public String selBraname(WstaffdetailsVO wstaffdetailsVO);
    public List<WstaffdetailsVO> selBranameTwo(WstaffdetailsVO wstaffdetailsVO);
    //添加员工详情
    public int useresInsert(WstaffdetailsVO WstaffdetailsVO);
    //添加员工
    public int useresInsertTwo(WstaffdetailsVO WstaffdetailsVO);
    //查询员工id
    public int userId(WstaffdetailsVO wstaffdetailsVO);
    //查询网点id
    public int branchId(WstaffdetailsVO wstaffdetailsVO);
    //删除员工
    public int delUser(WstaffdetailsVO wstaffdetailsVO);
    //删除员工
    public int delUserTwo(WstaffdetailsVO wstaffdetailsVO);
    //修改员工
    public int editUser(WstaffdetailsVO wstaffdetailsVO);
    //修改员工
    public int editUserTwo(WstaffdetailsVO wstaffdetailsVO);
    public List<WstaffdetailsVO> selUser(WstaffdetailsVO wstaffdetailsVO);
}
