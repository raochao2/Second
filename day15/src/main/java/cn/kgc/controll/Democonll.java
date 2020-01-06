package cn.kgc.controll;


import cn.kgc.domain.category;
import cn.kgc.domain.entry;
import cn.kgc.service.demoService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/init")
public class Democonll {

    @Autowired
    demoService demo;
    //分页动态条件查询

    //退出功能,中央的控制器
    @RequestMapping("/exit")
    public ModelAndView exit(ModelAndView mv){
        mv.setViewName("exit");
        return mv;
    }

    //登录验证，异步请求！
    @RequestMapping(value="/check",produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public   String  check(String check){
        if(check.equals("我爱你")){
          return "哈哈哈哈！！！";
       }else{  return check;   }
    }
    //添加功能，添加信息
    @RequestMapping("/addproject")
    public ModelAndView addcontent(Integer id, ModelAndView mv){
       mv.addObject("projectid",id);
        mv.setViewName("addwork");
        return mv;
    }



   //中转功能 不能删除
    @RequestMapping("/goAddbook")
    public ModelAndView addbook(ModelAndView mv){
        mv.setViewName("addwork");
        return mv;
    }

    @RequestMapping("/addThebook")
    public ModelAndView addsome(entry entry, ModelAndView mv){
        demo.addBook(entry);
        mv.addObject("insert","success");
        mv.setViewName("forward:listtwo");
        return mv;
    }



    //增加分页功能
    @RequestMapping("/listtwo")
    public ModelAndView listwo(
            @RequestParam(defaultValue = "0") Integer categoryid,
            @RequestParam(defaultValue = "1") Integer pageNum,
            ModelAndView mv, HttpSession session){
        List<category> categorylist=demo.findCatelist();
        PageInfo pageInfo = demo.findByCateId(categoryid,pageNum, 5);
        session.setAttribute("categorylist",categorylist);
        mv.addObject("condition",categoryid);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("orderPage");
        return mv;
    }
    @RequestMapping("/login")
   public ModelAndView loginCheck(@RequestParam(defaultValue ="")String name,
                                  ModelAndView mv, HttpSession session){
        if(name.trim().equals("退出")){
           mv.setViewName("/exit.jsp");
        }
        else{
            session.setAttribute("username",name);
            mv.setViewName("forward:listtwo");
        }
        return mv;
   }

    @RequestMapping("/deletebook")
    public ModelAndView delBook(Integer delId, ModelAndView mv){
        demo.delBookByID(delId);
        mv.addObject("delete","success");
        mv.setViewName("forward:listtwo");
        return mv;
    }
    @RequestMapping("/toModifyUI")
    public ModelAndView toModifyUI(Integer upid, ModelAndView mv){
        entry entry=demo.findBookByID(upid);
        mv.addObject("entryInfo",entry);
        mv.setViewName("updatebook");
        return mv;
    }
    @RequestMapping("/modifiThebook")
    public ModelAndView modifiThebook(entry entry, ModelAndView mv){
        demo.modifiBook(entry);
        mv.addObject("update","success");
        mv.setViewName("forward:listtwo");
        return mv;
    }

}
