package com.zufang.service;

import com.zufang.pojo.Agent;

import java.util.List;

public interface AgentService {

    public List<Agent> getAgentCheck(Integer startRow,Integer PageSize);

    public List<Agent> getAgentPass(Integer startRow,Integer PageSize);

    public int insertAgent(Agent agent);

    public int deleteAgentByUid(Integer uid);

    public int updateAgent(Agent agent);

    public int countAgentCheck();

    public int countAgentPass();

    public int updateAgentById(Integer uid, Integer status);

    public Agent getAgentById(Integer uid);
}
