package com.demo2.pcontroller;

import com.demo2.util.BaseResult;
import com.demo2.util.SearchCondition;
import com.github.pagehelper.PageInfo;
import com.demo2.entity.House;
import com.demo2.entity.Users;
import com.demo2.service.HouseService;
import com.demo2.util.FileUploadUtil;
import com.demo2.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
@RestController(value = "houseController2")
@RequestMapping("/page/")
public class HouseController {
    @Autowired
    private HouseService houseService;
    //处理请求的方法
    @RequestMapping("addHouse")
    //一个表单对象对应一个参数或者实体
    //一个文件域对象与一个CommonsMultipartFile对象对应
    public BaseResult addHouse(House house, @RequestParam(value = "pfile",required = false) MultipartFile pfile,HttpSession session){
        try {
            if(pfile!=null){
               String saveFileName=FileUploadUtil.upload(pfile);
                //设置图片路径
                house.setPath(saveFileName);
            }
            //2.将数据添加到数据库
            //修改house实体，添加额外的属性值
            //设置编号
            house.setId(System.currentTimeMillis()+"");
            //设置所属用户   重点理解
            Users user=(Users)session.getAttribute("loginInfo");
            house.setUserId(user.getId());
            //调用业务实现添加
            houseService.addHouse(house);
            return new BaseResult(BaseResult.RESULT_SUCCESS,"");
        } catch (Exception e) {
            e.printStackTrace();
            return new BaseResult(BaseResult.RESULT_FAIL,"发布失败:"+e.getMessage());
        }
    }

    //显示发布出租房信息
    @RequestMapping("showHouse")    //pageUtile只用接收页码即可  page
    public BaseResult showHouse(PageUtil pageUtil, HttpSession session){
        //设置页大小   选择设置默认值
        pageUtil.setRows(5);
        //调用业务获取数据
        //获取用户登入的id
        Users user=(Users)session.getAttribute("loginInfo");
        PageInfo<House> pageInfo=houseService.getHouseByUser(user.getId(),pageUtil);
        //返回总页数，当前页的数据
        Map<String,Object> map=new HashMap();
        map.put("totalPage",pageInfo.getPages());  //总页数
        map.put("row",pageInfo.getList()); //当前页数据
        return new BaseResult(200,map);
    }

    //显示修改出租房信息
    @RequestMapping("editHouse")
    public  String editHouse(String id,Model model){
        //调用业务获取数据
        House house=houseService.gethouseById(id);
        model.addAttribute("house",house);
        return "upfabu";
    }
    //处理请求的方法
    @RequestMapping("upHouse")
    //一个表单对象对应一个参数或者实体
    //一个文件域对象与一个CommonsMultipartFile对象对应
    public String upHouse(House house,String oldPicPath, @RequestParam(value = "pfile",required = false)MultipartFile pfile){
        if(pfile!=null){
            String saveFileName=FileUploadUtil.upload(pfile);
            //设置图片路径
            house.setPath(saveFileName);
            FileUploadUtil.deleteFile(oldPicPath);
        }
        //2.修改数据库信息
        //调用业务实现添加
        houseService.updateHouse(house);
        return "redirect:showHouse";
    }

    //删除出租房
    @RequestMapping("deleteHouse")  //id为出租房编号
    public  BaseResult deleteHouse(String id){
        try {
            //调用业务删除数据
            houseService.deleteHouse(id,1);  //1表示删除
            return new BaseResult(BaseResult.RESULT_SUCCESS,"");
        }catch (Exception e){
            e.printStackTrace();
        }
        return new BaseResult(BaseResult.RESULT_FAIL,"失败");
    }
    //恢复出租房
    @RequestMapping("backDelHouse")  //id为出租房编号
    public  String backDelHouse(String id){
        try {
            //调用业务删除数据
            int temp=houseService.deleteHouse(id,0);  //1表示删除
            return "redirect:showHouse";
        }catch (Exception e){
            e.printStackTrace();
        }
        return "error";
    }
    //查询浏览出租房
    //pageUtil 接收页码属性为page
    @RequestMapping("broswerHouse")
    public BaseResult broswerHouse(SearchCondition searchCondition, Model model){
        //设置页大小
        searchCondition.setRows(5);
        //调用业务
        PageInfo<House> pageInfo=houseService.getBroswerHouse(searchCondition);
        //填充数据
        Map<String,Object> map=new HashMap();
        map.put("curpage",searchCondition.getPage());
        map.put("total",pageInfo.getPages());
        map.put("list",pageInfo.getList());
        return new BaseResult(200,"success",map);
    }
}
