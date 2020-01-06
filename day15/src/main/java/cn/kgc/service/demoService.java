package cn.kgc.service;


import cn.kgc.domain.category;
import cn.kgc.domain.entry;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface demoService {

   //寻找所有的图书分类列表
    List<category>  findCatelist();

    //分页带 条件的查询
    PageInfo findByCateId(@Param("categoryid") Integer categoryid, Integer pageNum, Integer pageSize);
   //增加图书的功能，不可以删除
    boolean addBook(entry entry);

    boolean  delBookByID(Integer id);
    entry findBookByID(Integer id);
    boolean modifiBook(entry entry);
}
