package cn.kgc.controller;

import cn.kgc.domain.*;
import cn.kgc.service.peopleService;
import cn.kgc.service.resultService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class userController {
    @Autowired
    private peopleService  service;
    @Autowired
    private resultService restService;
    @RequestMapping("/login")
    public String login(String id, HttpServletRequest req){
        people user=service.findPeople(id);
        if(user==null){
           return "redirect:index.jsp";
        }
        req.setAttribute("people",user);
        return "forward:main.jsp";
    }

    @RequestMapping("/getResult")
    @ResponseBody
    public Map<String,Object> getResult(PageUtil pageUtil){
        pageUtil.setPageNumber(1);
        pageUtil.setPageSize(10);
        PageInfo<result> pageInfo=restService.findAllresult(pageUtil);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }

    @RequestMapping("/modifiMoney")
    @ResponseBody
    public String modifiMoney(people people){
        service.modifiMoney(people);
        return "yes";
    }
    @RequestMapping("/addResult")
    @ResponseBody
    public String addResult(String date,Integer number){
        result res=new result(date,number);
        restService.addResult(res);
        return "null";
    }
    @RequestMapping("/addmoney")
    public String addmoney(Integer userid,Model model){
        model.addAttribute("userid",userid);
        return "forward:addmoney.jsp";
    }
    @RequestMapping("/alltotalist")
    public String alltotalist(Integer userid, Model model,Integer pageNum, PageUtil pageUtil){
        pageUtil.setPageSize(6);
        pageUtil.setPageNumber(pageNum);
        PageInfo<totalist> pageInfo=restService.FindAlltatal(userid,pageUtil);
       model.addAttribute("pageInfo",pageInfo);
       model.addAttribute("userid",userid);
       return "forward:alltotalist.jsp";
    }

    @RequestMapping("/addtotalist")
    @ResponseBody
    public String addtotalist(totalist totalist){
        restService.insertTotalist(totalist);
        return "yes";
    }
    @RequestMapping("/submitmoney")
    public String submitmoney(Integer id, Integer  jinge, Model model){
        model.addAttribute("modify","success");
        return "forward:login";
    }
    //发请求 发送验证码
    @RequestMapping("sendCode")
    @ResponseBody
    public  String sendCode(String tel, HttpSession session){
        //生成随机数
        int code=(int)Math.round((Math.random()+1) * 1000);
        //sessioin保存手机的验证码
        session.setAttribute("code",code);
        String msg="验证码是:"+code+" 请不要让其它人看见获取!";
        //发送消息
        SendMsgUtil sendMsgUtil=new SendMsgUtil();
        int result=sendMsgUtil.sendMsg(tel,msg);
        return "{\"result\":"+result +"}";
    }
    @RequestMapping("login2")
    public String login2(String inputCode,String id,HttpSession session){
       Object obj=session.getAttribute("code");
           if(obj==null){
            return "redirect:index.jsp";
           }
        String code=obj.toString();
        if(code.equals(inputCode)){
            people user=service.findPeople(id);
            if(user==null){
               return "redirect:index.jsp";
            }
            session.setAttribute("people",user);
            return "forward:main.jsp";

        }else{
            //通过手机号，查询当用户信息
            return "redirect:index.jsp";
        }
    }



}
