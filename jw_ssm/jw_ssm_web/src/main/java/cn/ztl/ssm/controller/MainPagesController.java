package cn.ztl.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 主页面管理
 */
@Controller
@RequestMapping("/index")
public class MainPagesController {
    /**
     * 加载主页面
     *
     * @return 主页面
     */
    @RequestMapping("/Pages.do")
    public ModelAndView returnIndexView() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        return modelAndView;
    }


}
