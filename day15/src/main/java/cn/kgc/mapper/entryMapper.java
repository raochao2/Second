package cn.kgc.mapper;

import cn.kgc.domain.entry;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface entryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(entry record);

    int insertSelective(entry record);

    entry selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(entry record);

    int updateByPrimaryKey(entry record);

    List<entry>  selectBycateId(@Param("categoryid") Integer categoryid);
}