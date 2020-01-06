package cn.kgc.service;


import cn.kgc.domain.category;
import cn.kgc.domain.entry;
import cn.kgc.mapper.categoryMapper;
import cn.kgc.mapper.entryMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class demoserviceImpl implements demoService {
   @Autowired
   categoryMapper cateMapper;
   @Autowired
   entryMapper entryMapper;
    //数据库查询所有的图书分类和列表

    @Override
    public List<category> findCatelist() {
      return  cateMapper.findcate();
    }


   //条件与分页的查询。
    @Override
    public PageInfo findByCateId(Integer categoryid, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        //2.查询数据
        List<cn.kgc.domain.entry> entryList =entryMapper.selectBycateId(categoryid);
        //3.封装pageInfo
        PageInfo pageInfo = new PageInfo(entryList);
        return pageInfo;
    }
    //实现方法 不要删除
    @Override
    public boolean addBook(cn.kgc.domain.entry entry) {
        return   entryMapper.insertSelective(entry)>0?true:false;
    }

    @Override
    public boolean delBookByID(Integer id) {
        entryMapper.deleteByPrimaryKey(id);
        return true;
    }

    @Override
    public entry findBookByID(Integer id) {
       return  entryMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean modifiBook(entry entry) {
        entryMapper.updateByPrimaryKeySelective(entry);
        return true;
    }


}
