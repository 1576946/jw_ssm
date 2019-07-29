package cn.ztl.ssm.domain;

import cn.ztl.ssm.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Date;

public class VisitMan {
    private Integer theme_id;
    private String theme_cause;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date theme_enter;
    private String theme_enter_str;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date theme_out;
    private String theme_out_str;
    private String theme_name;
    private String theme_causeContext;


    public String getTheme_enter_str() {
        if (theme_enter != null) {
            theme_enter_str = DateUtils.date2String(theme_enter, "yyyy-MM-dd HH:mm:ss");
        }
        return theme_enter_str;
    }

    public void setTheme_enter_str(String theme_enter_str) {
        this.theme_enter_str = theme_enter_str;
    }

    public String getTheme_out_str() {
        if (theme_out != null) {
            theme_out_str = DateUtils.date2String(theme_out, "yyyy-MM-dd HH:mm:ss");
        }
        return theme_out_str;
    }

    public void setTheme_out_str(String theme_out_str) {
        this.theme_out_str = theme_out_str;
    }

    public Integer getTheme_id() {
        return theme_id;
    }

    public void setTheme_id(Integer theme_id) {
        this.theme_id = theme_id;
    }

    public String getTheme_cause() {
        return theme_cause;
    }

    public void setTheme_cause(String theme_cause) {
        this.theme_cause = theme_cause;
    }

    public Date getTheme_enter() {
        return theme_enter;
    }

    public void setTheme_enter(Date theme_enter) {
        this.theme_enter = theme_enter;
    }

    public Date getTheme_out() {
        return theme_out;
    }

    public void setTheme_out(Date theme_out) {
        this.theme_out = theme_out;
    }

    public String getTheme_name() {
        return theme_name;
    }

    public void setTheme_name(String theme_name) {
        this.theme_name = theme_name;
    }

    public String getTheme_causeContext() {
        return theme_causeContext;
    }

    public void setTheme_causeContext(String theme_causeContext) {
        this.theme_causeContext = theme_causeContext;
    }
}
