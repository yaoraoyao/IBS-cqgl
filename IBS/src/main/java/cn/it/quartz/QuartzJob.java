package cn.it.quartz;

import cn.it.domain.Productstock;
import cn.it.service.IProductstockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component("quartzJob")
public class QuartzJob {
    @Autowired
    private IProductstockService productstockService;

    public void work(){
        System.out.println("定时任务leile");
        String jpql = "select o from Productstock o where (o.num>=o.topNum or o.num<=o.bottomNum) and o.warning=?";
        List<Productstock> list = productstockService.findByJpql(jpql, true);
        for (Productstock productStock : list) {
            System.out.println("需要发出库存预警：" + productStock);

            // 邮件：连接互联网，今天讲
            // 短信：后面项目讲(阿里大鱼，容联云)
            // 添加一张表t_message来发出消息:ERP(人力资源计划),一个公司所有系统都在里面(pss,crm,hr...)
        }

    }
}
