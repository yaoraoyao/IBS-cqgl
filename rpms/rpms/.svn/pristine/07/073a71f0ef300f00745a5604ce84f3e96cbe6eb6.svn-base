package cn.itsource.web.controller;

import cn.itsource.domain.SystemLog;
import cn.itsource.service.ISystemLogService;
import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.itsource.systemlogindex.SystemLogLucene;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/search")
public class LuceneController {

    @Autowired
    private ISystemLogService systemLogService;


    public static void main(String[] args){
//        List<SystemLog> all = systemLogService.findAll();
        ApplicationContext context = new ClassPathXmlApplicationContext("application_mapper.xml");
        BasicDataSource dataSource =(BasicDataSource) context.getBean("dataSource");
        Connection conn =null ;
        try {
            conn = dataSource.getConnection();
            String sql ="select * from t_systemlog";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet set = ps.executeQuery();
            while (set.next()){
                System.out.println("====="+set.getString(2));

            }
            SystemLogLucene.index(set);
            List admin = SystemLogLucene.seacher("admin");
            System.out.println(admin);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
