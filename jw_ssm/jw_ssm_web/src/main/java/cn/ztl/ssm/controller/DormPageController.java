package cn.ztl.ssm.controller;

import cn.ztl.ssm.domain.Rooming;
import cn.ztl.ssm.domain.Rooming_emergency;
import cn.ztl.ssm.service.IRoomService;
import cn.ztl.ssm.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/Dorm_C")
public class DormPageController {
    @Autowired
    private IRoomService iRoomService;

    @RequestMapping("/Pages.do")
    public ModelAndView returnDormView() throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Rooming> ls = iRoomService.findAll();
        modelAndView.addObject("roomingList", ls);
        modelAndView.setViewName("goods_list");
        return modelAndView;
    }

    @RequestMapping("/Search.do")
    public ModelAndView returnDormSearchView() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("goods_search");
        return modelAndView;
    }

    @RequestMapping("/Post.do")
    public ModelAndView returnDormPostView() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("goods_post");
        return modelAndView;
    }

    @RequestMapping("/AddMiss.do")
    public String saveMiss(Rooming_emergency rooming_emergency) throws Exception {
        rooming_emergency.setR_time(DateUtils.string2Date(rooming_emergency.getR_time_str() + ":00", "yyyy-MM-dd HH:mm:ss"));
        rooming_emergency.setR_is_solve("0");
        iRoomService.saveMiss(rooming_emergency);
        return "redirect:Pages.do";
    }

    @RequestMapping("/AddHome.do")
    public String addHome(Rooming rooming) throws Exception {
        iRoomService.addHome(rooming);
        return "redirect:Pages.do";
    }


}
