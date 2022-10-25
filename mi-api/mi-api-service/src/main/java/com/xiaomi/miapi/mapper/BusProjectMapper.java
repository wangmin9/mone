package com.xiaomi.miapi.mapper;

import com.xiaomi.miapi.common.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BusProjectMapper {
    long countByExample(BusProjectExample example);

    int deleteByExample(BusProjectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BusProject record);

    int insertSelective(BusProject record);

    List<BusProject> selectByExample(BusProjectExample example);

    BusProject selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") BusProject record, @Param("example") BusProjectExample example);

    int updateByExample(@Param("record") BusProject record, @Param("example") BusProjectExample example);

    int updateByPrimaryKeySelective(BusProject record);

    int updateByPrimaryKey(BusProject record);

    int batchInsert(@Param("list") List<BusProject> list);

    int batchInsertSelective(@Param("list") List<BusProject> list, @Param("selective") BusProject.Column ... selective);
}