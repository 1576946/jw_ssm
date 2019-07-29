package cn.ztl.ssm.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Rooming_emergency {
    private String R_theme;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date R_time;
    private String R_time_str;
    private String R_context;
    private String R_is_solve;

    @Override
    public String toString() {
        return "Rooming_emergency{" +
                "R_theme='" + R_theme + '\'' +
                ", R_time=" + R_time +
                ", R_time_str='" + R_time_str + '\'' +
                ", R_context='" + R_context + '\'' +
                ", R_is_solve='" + R_is_solve + '\'' +
                '}';
    }

    public String getR_time_str() {

        return R_time_str;
    }

    public void setR_time_str(String r_time_str) {
        R_time_str = r_time_str;
    }

    public String getR_theme() {
        return R_theme;
    }

    public void setR_theme(String r_theme) {
        R_theme = r_theme;
    }

    public Date getR_time() {
        return R_time;
    }

    public void setR_time(Date r_time) {
        R_time = r_time;
    }

    public String getR_context() {
        return R_context;
    }

    public void setR_context(String r_context) {
        R_context = r_context;
    }

    public String getR_is_solve() {
        return R_is_solve;
    }

    public void setR_is_solve(String r_is_solve) {
        R_is_solve = r_is_solve;
    }
}
