package cn.it.controller;

import cn.afterturn.easypoi.entity.vo.NormalExcelConstants;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import cn.it.domain.Employee;
import cn.it.query.EmployeeQuery;
import cn.it.service.IEmployeeService;
import cn.it.utils.MD5Util;
import cn.it.utils.PageList;

import cn.it.utils.Result;
import org.apache.xmlbeans.impl.regex.REUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private IEmployeeService employeeService;

    @RequestMapping("/index")
    public String index(){
        return "employee";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Employee> page (EmployeeQuery employeeQuery){
        return employeeService.findAll(employeeQuery);
    }

    @ResponseBody
    @RequestMapping("/upload")
    public String upload(MultipartFile headImage, HttpServletRequest request) throws IOException {
        String fileName = headImage.getOriginalFilename();
        //获取文件名称后缀
        String ext = fileName.substring(fileName.lastIndexOf("."));
        //使用随机数+时间毫秒   或者UUID 来作为文件名称
        String newName = UUID.randomUUID().toString();
        //现在是开发阶段，文件路径就写成项目路径下，若是要发布上线，就需要改为tomcat的webapps目录路径
        String realPath = request.getServletContext().getRealPath("/img/head/");
        File out = new File(realPath + newName + ext);
        //将请求中的文件二进制数据写入到服务器端的磁盘文件中
        headImage.transferTo(out);
        return "/img/head/" + newName + ext;
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Employee employee){
        Result result = null;
        try {
            if(employee.getId() != null && employee.getId() > 0){

                result = new Result(200,"员工编辑成功！");
            }
            else{
                result = new Result(200,"员工新增成功！");

            }
            employee.setPassword(MD5Util.getMD5Password(employee.getUserName()));
            /**
             * employeeService.save(employee);  新增或者修改
             *  如果是新增【id为null】，新增完成之后该对象变成持久状态【与数据库表中的数据保持一致】，保存成功之后id就不为null了
             */
            employeeService.save(employee);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Employee findOne(Long id){
        return employeeService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            employeeService.delete(ids);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
        return new Result(200,"删除成功！");
    }

    @RequestMapping("/export")
    public String export(EmployeeQuery query, ModelMap map, HttpServletRequest req) throws IOException {
        //查询数据
        List<Employee> list = employeeService.findRealAll(query);
        //获取真实物理路径
        String path = req.getServletContext().getRealPath("");
        //循环遍历处理头像文件路径
        for (Employee employee : list) {
            employee.setHeadImage(path + employee.getHeadImage());
        }
        ExportParams params = new ExportParams("员工列表", "员工", ExcelType.XSSF);
        params.setFreezeCol(0);
        map.put(NormalExcelConstants.DATA_LIST, list); // 数据集合
        map.put(NormalExcelConstants.CLASS, Employee.class);//导出实体
        map.put(NormalExcelConstants.PARAMS, params);//参数
        map.put(NormalExcelConstants.FILE_NAME, "员工列表");//文件名称
        //easypoiExcelView  其实就是EasypoiSingleExcelView类的@Controller注解的值
        return NormalExcelConstants.EASYPOI_EXCEL_VIEW;//View名称
    }

    @ResponseBody
    @RequestMapping("/findAllBuyer")
    public List<Employee> findAllBuyer(){
        return employeeService.findAllBuyer();
    }

    @ResponseBody
    @RequestMapping("/findAllKeeper")
    public List<Employee> findAllKeeper(){
        return employeeService.findAllKeeper();
    }

//    @ModelAttribute("editEmployee")
//    public Employee findOneById(Long id,String action){
//        Employee employee =null;
//        if (id !=null && action.equals("edit") && id>0){
//            employee = employeeService.findOne(id);
//            employee.setDepartment(null);
//        }
//        return employee;
//    }

    @ResponseBody
    @RequestMapping("/updatePassword")
    public Result updatePassword(Long id,String password){
        Result result = null;
        try {
            Employee employee = employeeService.findOne(id);
            employee.setPassword(MD5Util.getMD5Password(password));
            result = new Result(200,"密码修改成功！");
            employeeService.save(employee);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }
}
