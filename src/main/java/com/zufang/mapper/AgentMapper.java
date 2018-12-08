package com.zufang.mapper;

import com.zufang.pojo.Agent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AgentMapper {

    /**
     * 查询正在审核的代理,-2删除，-1未通过，0，审核中，1审核通过，
     * @return
     */
    public List<Agent> getAgentCheck(@Param("startRow") Integer startRow, @Param("PageSize") Integer PageSize);

    public List<Agent> getAgentPass(@Param("startRow") Integer startRow, @Param("PageSize") Integer PageSize);

    public int insertAgent(Agent agent);

    public int deleteAgentByUid(Integer uid);

    public int updateAgent(Agent agent);

    public int countAgentCheck();

    public int countAgentPass();

    public Agent getAgentById(Integer uid);
}
