package cn.itsource.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class SystemLog {
    //序号
    private Long id;
    //操作用户
    private String opUser;
    //操作时间
    private Date opTime;
    //操作账户ip地址
    private String opIp;
    //操作了哪些功能
    private String function;
    //传入的参数信息
    private String params;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOpUser() {
        return opUser;
    }

    public void setOpUser(String opUser) {
        this.opUser = opUser;
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public Date getOpTime() {
        return opTime;
    }
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setOpTime(Date opTime) {
        this.opTime = opTime;
    }

    public String getOpIp() {
        return opIp;
    }

    public void setOpIp(String opIp) {
        this.opIp = opIp;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }

    @Override
    public String toString() {
        return "SystemLog{" +
                "id=" + id +
                ", opUser='" + opUser + '\'' +
                ", opTime=" + opTime +
                ", opIp='" + opIp + '\'' +
                ", function='" + function + '\'' +
                ", params='" + params + '\'' +
                '}';
    }
}
