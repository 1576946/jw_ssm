package cn.ztl.ssm.domain;

public class Student {
    /* # 学生编号
        # 学生名字
  		# 学生性别
  		# 学生年龄
    	# 学院
    	# 专业班级
    	# 宿舍房间号
  		# 电话*/
    private String S_number;
    private String S_name;
    private String S_sex;
    private Integer S_age;
    private String S_academy;
    private String S_sclass;
    private String S_roomOfNumber;
    private String S_tel;

    @Override
    public String toString() {
        return "Student{" +
                "S_number='" + S_number + '\'' +
                ", S_name='" + S_name + '\'' +
                ", S_sex='" + S_sex + '\'' +
                ", S_age=" + S_age +
                ", S_academy='" + S_academy + '\'' +
                ", S_sclass='" + S_sclass + '\'' +
                ", S_roomOfNumber='" + S_roomOfNumber + '\'' +
                ", S_tel='" + S_tel + '\'' +
                '}';
    }

    public String getS_number() {
        return S_number;
    }

    public void setS_number(String s_number) {
        S_number = s_number;
    }

    public String getS_name() {
        return S_name;
    }

    public void setS_name(String s_name) {
        S_name = s_name;
    }

    public String getS_sex() {
        return S_sex;
    }

    public void setS_sex(String s_sex) {
        S_sex = s_sex;
    }

    public Integer getS_age() {
        return S_age;
    }

    public void setS_age(Integer s_age) {
        S_age = s_age;
    }

    public String getS_academy() {
        return S_academy;
    }

    public void setS_academy(String s_academy) {
        S_academy = s_academy;
    }

    public String getS_sclass() {
        return S_sclass;
    }

    public void setS_sclass(String s_sclass) {
        S_sclass = s_sclass;
    }

    public String getS_roomOfNumber() {
        return S_roomOfNumber;
    }

    public void setS_roomOfNumber(String s_roomOfNumber) {
        S_roomOfNumber = s_roomOfNumber;
    }

    public String getS_tel() {
        return S_tel;
    }

    public void setS_tel(String s_tel) {
        S_tel = s_tel;
    }
}
