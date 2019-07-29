package cn.ztl.ssm.controller;

import cn.ztl.ssm.domain.VisitMan;
import cn.ztl.ssm.service.IVisitService;
import cn.ztl.ssm.utils.DateUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/Visit")
public class VisitPageController {
    @Autowired
    private IVisitService iVisitService;

    @RequestMapping("/Pages.do")
    public ModelAndView returnVisitView(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "size", required = true, defaultValue = "7") Integer size) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<VisitMan> ls = iVisitService.findAll(page, size);

        PageInfo pageInfo = new PageInfo(ls);
        modelAndView.addObject("visitManList", pageInfo);
        modelAndView.setViewName("content");
        return modelAndView;
    }

    @RequestMapping("/AddPages.do")
    public ModelAndView returnVisitAddView() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("content_post");
        return modelAndView;
    }

    @RequestMapping("/AddVisit.do")
    public String saveVisit(VisitMan visitMan) throws Exception {//2019-07-03T07:56
        visitMan.setTheme_enter(DateUtils.string2Date(visitMan.getTheme_enter_str() + ":00", "yyyy-MM-dd HH:mm:ss"));
        visitMan.setTheme_out(DateUtils.string2Date(visitMan.getTheme_out_str() + ":00", "yyyy-MM-dd HH:mm:ss"));
        iVisitService.saveVisit(visitMan);
        return "redirect:Pages.do";
    }

}
