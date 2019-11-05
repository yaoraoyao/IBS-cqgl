package cn.it.controller;

import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import cn.afterturn.easypoi.excel.entity.result.ExcelImportResult;
import cn.it.domain.Department;
import cn.it.domain.Employee;
import cn.it.service.IDepartmentService;
import cn.it.service.IEmployeeService;
import cn.it.utils.MD5Util;
import cn.it.verifyHandler.UserNameUniqueVerifyHandler;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.List;

@Controller
public class ImportController {
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private UserNameUniqueVerifyHandler userNameUniqueVerifyHandler;

    @RequestMapping("/import/index")
    public String index(){
        return "import";
    }

    @RequestMapping("/import")
    public String importExcel(MultipartFile importFile, Model model, HttpServletResponse response) throws Exception{
        InputStream inputStream = importFile.getInputStream();
        String originalFilename = importFile.getOriginalFilename();
        String extName = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
        if ("xls".equalsIgnoreCase(extName) || "xlsx".equalsIgnoreCase(extName)){
            ImportParams params = new ImportParams();
            params.setTitleRows(1);
            params.setHeadRows(1);
            params.setNeedVerfiy(true);
            params.setVerifyHandler(userNameUniqueVerifyHandler);
            ExcelImportResult<Employee> result = ExcelImportUtil.importExcelMore(inputStream, Employee.class, params);
            List<Employee> list = result.getList();
            for (Employee employee : list) {
                String s = employee.getHeadImage();
                int i = s.indexOf("img");
                String s1 = s.substring(i - 1);
                employee.setHeadImage(s1);
                employee.setPassword(MD5Util.getMD5Password(employee.getUserName()));
                if (StringUtils.isNotBlank(employee.getDepartment().getName())){
                    Department department = departmentService.findByName(employee.getDepartment().getName());
                    employee.setDepartment(department);
                }
                employeeService.save(employee);
            }
            if (result.isVerfiyFail()){
                ServletOutputStream outputStream = response.getOutputStream();
                response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"); //mime类型
                String fileName = new String("导入失败的数据.xlsx".getBytes("UTF-8"), "ISO-8859-1");
                response.setHeader("Content-disposition", "attachment;filename="+fileName);
                response.setHeader("Pragma", "No-cache");//设置不要缓存
                result.getFailWorkbook().write(outputStream);
                outputStream.close();
            }
        }else {
            model.addAttribute("uploadError", "文件类型必须是Excel表格文件！");
        }
        return "import";
    }
}
