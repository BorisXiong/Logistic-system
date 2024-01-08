package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Express;
import com.aaa.entity.Expressdetails;
import com.aaa.entity.LayuiResult;
import com.aaa.service.ExpressService;
import com.aaa.service.ExpressdetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/expressdetails")
public class ExpressdetailsController {
    @Autowired
    private ExpressdetailsService expressdetailsService;
    @Autowired
    private ExpressService expressService;

    @RequestMapping("/expressselect")
    public String offerselect()
    {
        return "data/expressdetails/expressdetailsList";
    }

    @RequestMapping("/select")
    @ResponseBody
    public LayuiResult<Map> select(BaseQuery baseQuery, Express express){

        LayuiResult<Map> result=new LayuiResult<Map>();
        List<Map> maps = expressService.expressdetailsList(baseQuery, express);
        int i = expressService.selectCount1(express);
        System.out.println(i+"=====================----+++++++====="+maps);
        result.setData(maps);
        result.setCount(i);
        return  result;
    }

    @RequestMapping("update")
    public String update(Model model, String expnum,Expressdetails expressdetails) {
        ModelAndView mav = new ModelAndView();
        expressdetails.setExpnum(expnum);
        List<Expressdetails> expressdetails1 = expressdetailsService.updateList(expressdetails);
        model.addAttribute("expressdetails1",expressdetails1);
        return "data/expressdetails/select";
    }
}
