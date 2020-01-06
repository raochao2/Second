package cn.kgc.mapper;

import cn.kgc.domain.category;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface categoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(category record);

    int insertSelective(category record);

    category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(category record);

    int updateByPrimaryKey(category record);
    @Select(" select  *  from  category  ")
    List<category> findcate();
}