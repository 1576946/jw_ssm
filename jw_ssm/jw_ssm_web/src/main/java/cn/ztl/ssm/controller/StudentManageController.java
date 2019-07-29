package cn.ztl.ssm.controller;

import cn.ztl.ssm.domain.Student;
import cn.ztl.ssm.service.IStudentService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 学生页面管理
 */
@Controller
@RequestMapping("/StudentManage")
public class StudentManageController {
    @Autowired
    private IStudentService iStudentService;

    /**
     * 跳转学生管理页面
     *
     * @return
     */
    @RequestMapping("/Pages.do")
    public ModelAndView returnStudnetView(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "size", required = true, defaultValue = "7") Integer size) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Student> ls = iStudentService.findAll(page, size);

        PageInfo pageInfo = new PageInfo(ls);
        modelAndView.addObject("studentList", pageInfo);
        modelAndView.setViewName("user_list");
        return modelAndView;
    }

    //添加学生
    @RequestMapping("/addStudent")
    public String addStudnet(Student student) throws Exception {
        iStudentService.saveStudent(student);
        return "redirect:Pages.do";
    }

    //学生搜索页面
    @RequestMapping("/StudentSearch.do")
    public ModelAndView returnSearchView() throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("uesr_search");
        return modelAndView;
    }


}
