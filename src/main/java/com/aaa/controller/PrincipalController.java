package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Branch;
import com.aaa.entity.LayuiResult;
import com.aaa.service.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/principal")
public class PrincipalController {
    @Autowired
    private BranchService branchService;

    @RequestMapping("/principalselect")
    public String offerselect()
    {
        return "data/principal/PrincipalList";
    }

    @RequestMapping("/select")
    @ResponseBody
    public LayuiResult<Map> select(BaseQuery baseQuery, Branch branch){

        LayuiResult<Map> result=new LayuiResult<Map>();
        List<Map> maps = branchService.branchBDList(baseQuery,branch);
        int i = branchService.selectBDCount(branch);
        System.out.println(i+"=====================----+++++++====="+maps);
        result.setData(maps);
        result.setCount(i);
        return  result;
    }
}
