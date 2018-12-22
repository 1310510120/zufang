package com.zufang.controller;

import com.zufang.pojo.Agent;
import com.zufang.pojo.User;
import com.zufang.pojo.extend.AgentDetail;
import com.zufang.service.AgentService;
import com.zufang.service.UserService;
import com.zufang.utils.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/agent")
public class AgentController {

    @Autowired
    private AgentService agentService;
    @Autowired
    private UserService userService;

    /**
     * 添加代理
     * @param agent 代理pojo
     * @return 代理列表
     */
    @RequestMapping("/add")
    public String addAgent(Agent agent){
        int result = agentService.insertAgent(agent);
        if(result>0){
            return "redirect:agent/agent-list";
        }
        return "error";
    }

    /**
     * 展示代理审核列表
     * @param model
     * @param current 当前页码
     * @return 代理审核列表页面
     */
    @RequestMapping("/checklist")
    public String getAgentCheck(Model model,Integer current){
        //分页
        int total = agentService.countAgentCheck();
        PageVo pageVo = PageVo.getPageVoBy_current_total(current,total);
        //查询审核中代理信息
        List<Agent> agentlist= agentService.getAgentCheck(pageVo.getStartRow(),pageVo.getPageSize());
        //获取已通过代理的详细信息
        List<AgentDetail> list = intergration(agentlist);
        model.addAttribute("pageVo",pageVo);
        model.addAttribute("list",list);
        return "agent/agent-checklist";
    }


    /**
     * 展示代理通过列表
     * @param model
     * @param current 当前页码
     * @return
     */
    @RequestMapping("/passlist")
    public String getAgentPassList(Model model,Integer current){
        //分页
        int total = agentService.countAgentPass();
        PageVo pageVo = PageVo.getPageVoBy_current_total(current,total);
        //查询已通过代理信息
        List<Agent> agentlist= agentService.getAgentPass(pageVo.getStartRow(),pageVo.getPageSize());
        //获取将用户和代理信息整合
        List<AgentDetail> list = intergration(agentlist);

        model.addAttribute("list",list);
        model.addAttribute("pageVo",pageVo);
        return "agent/agent-list";
    }

    /**
     * 审核通过
     * @param model
     * @param uid 代理的id也是用户id
     * @return
     */

    @RequestMapping("{uid}/pass")
    public String agentPass(Model model, @PathVariable("uid") Integer uid) {
        int result = agentService.updateAgentById(uid,1);
        if(result >0){
            return "agent/agent-list";
        }
        return "error";
    }

    /**
     * 拒绝通过
     * @param model
     * @param uid 代理的id也是用户id
     * @return
     */
    @RequestMapping("{uid}/rejectpass")
    public String agentReject(Model model, @PathVariable("uid") Integer uid) {
        int result = agentService.updateAgentById(uid,-1);
        if(result >0){
            return "agent/agent-list";
        }
        return "error";
    }

    /**
     * 编辑代理
     * @param model
     * @param agent 代理pojo
     * @return
     */
    @RequestMapping(value ="/edit",method = RequestMethod.POST)
    public String agentUpdate(Model model,Agent agent){
        int result = agentService.updateAgent(agent);
        if(result >0){
            return "agent/agent-list";
        }
        return "error";
    }

    /**
     * 代理详细信息页面
     * @param model
     * @param uid
     * @return
     */

    @RequestMapping(value ="{uid}/detail",method = RequestMethod.GET)
    public String getUserById(Model model,@PathVariable("uid") Integer uid){
        Agent agent = agentService.getAgentById(uid);
        model.addAttribute("agent",agent);
        return "agent/agent-edit";
    }

    /**
     * 代理表信息和用户表信息整合
     * @param agentlist
     * @return
     */
    //传入（通过审核，正在审核中）代理，封装成一个pojo
    public List<AgentDetail> intergration(List<Agent> agentlist){
        List<AgentDetail> list = new ArrayList<AgentDetail>();

        for (Agent agent : agentlist){
            User user = userService.getUserById(agent.getUid());
            if(user != null){
                AgentDetail agentDetail = new AgentDetail();
                agentDetail.setEmail(user.getEmail());
                agentDetail.setId_number(agent.getId_number());
                agentDetail.setNickname(agent.getNickname());
                agentDetail.setPhone_number(user.getPhone_number());
                agentDetail.setPortrait(user.getPortrait());
                agentDetail.setStatus(agent.getStatus());
                agentDetail.setUid(user.getId());
                list.add(agentDetail);
            }else {
                //代理所在用户不存在，删除代理
                agentService.deleteAgentByUid(agent.getUid());
            }
        }
        return list;
    }
}
