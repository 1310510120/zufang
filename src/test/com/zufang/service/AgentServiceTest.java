package com.zufang.service;

import com.zufang.pojo.Agent;
import com.zufang.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring/applicationContext-dao.xml","classpath:spring/applicationContext-service.xml"})
public class AgentServiceTest {

    @Resource
    private AgentService agentService;
    @Resource
    private UserService userService;
    @Test
    public void getAgentCheck() {
        List<Agent> list= agentService.getAgentCheck(0,5);
        for(Agent agent:list){
            System.out.println(agent.toString());
        }
    }

    @Test
    public void getAgentPass() {
        List<Agent> list= agentService.getAgentPass(0,5);
        for(Agent agent:list){
            System.out.println(agent.toString());
        }
    }

    @Test
    public void insertAgentList() {
        int counta=0;
        int countb=0;
        for(int i=100;i<130;i++){

            User user = new User();
            user.setId(i);
            user.setCreated(new Date());
            user.setEmail(i+"@qq.com");
            user.setNickname(i+"liu");
            user.setPassword("123");
            user.setPhone_number("158");
            user.setStatus(i%2);
            userService.InsertUser(user);
            System.out.println("第"+i+"次用户信息插入成功");
            counta++;
            Agent agent = new Agent();
            agent.setUid(i);
            agent.setId_number("4211");
            agent.setNickname("liu");
            agent.setStatus(i%2);
            agentService.insertAgent(agent);
            System.out.println("第"+i+"次代理信息插入成功");
            countb++;
        }
        if (counta==countb&&counta==30){
            System.out.println("成功");
        }

    }

    @Test
    public void deleteAgentList() {
        int result=0;
        for (int i=100;i<130;i++){
            agentService.deleteAgentByUid(i);
            result++;
        }
        if (result==30){
            System.out.println("成功");
        }

    }

    @Test
    public void updateAgent() {
        Agent agent = new Agent();
        agent.setId_number("4211");
        agent.setNickname("liu");
        agent.setStatus(-1);
        agent.setUid(32);
        int result = agentService.updateAgent(agent);
        System.out.println(result);
    }

    @Test
    public void countAgentCheck() {
        System.out.println(agentService.countAgentCheck());
    }

    @Test
    public void countAgentPass() {
        System.out.println(agentService.countAgentPass());
    }

//    @Test
//    public void getAgentById(){
//        System.out.println(agentService.getAgentById(33));
//    }
}