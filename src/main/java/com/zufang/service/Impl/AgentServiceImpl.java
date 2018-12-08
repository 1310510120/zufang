package com.zufang.service.Impl;

import com.zufang.mapper.AgentMapper;
import com.zufang.pojo.Agent;
import com.zufang.service.AgentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AgentServiceImpl implements AgentService {

    @Autowired
    private AgentMapper agentMapper;

    @Override
    public List<Agent> getAgentCheck(Integer startRow,Integer PageSize) {
        List<Agent> list = agentMapper.getAgentCheck(startRow,PageSize);
        return list;
    }

    @Override
    public List<Agent> getAgentPass(Integer startRow,Integer PageSize) {
        List<Agent> list = agentMapper.getAgentPass(startRow,PageSize);
        return list;
    }

    @Override
    public int insertAgent(Agent agent) {
        int result = agentMapper.insertAgent(agent);
        return result;
    }

    @Override
    public int deleteAgentByUid(Integer uid) {
        int result = agentMapper.deleteAgentByUid(uid);
        return result;
    }

    @Override
    public int updateAgent(Agent agent) {
        int result = agentMapper.updateAgent(agent);
        return result;
    }

    @Override
    public int countAgentCheck() {
        int result = agentMapper.countAgentCheck();
        return result;
    }

    @Override
    public int countAgentPass() {
        int result = agentMapper.countAgentPass();
        return result;
    }

    public int updateAgentById(Integer uid,Integer status){
        Agent agent = agentMapper.getAgentById(uid);
        agent.setStatus(status);
        int result = agentMapper.updateAgent(agent);
        return result;
    }

    public Agent getAgentById(Integer uid){
        Agent agent = agentMapper.getAgentById(uid);
        return agent;
    }
}
