package cn.itsource.web.controller;


import cn.itsource.domain.SettedBill;
import cn.itsource.service.ISettedBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;



@RestController
@RequestMapping("/webservice")
public class WebServiceController {
    @Autowired
    private ISettedBillService settedBillService;



    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView view = new ModelAndView();
        view.setViewName("settedwebservice/settedwebservice");
        return view;
    }
//    @RequestMapping("/findAll")
//    public SettedBill findById(@RequestBody Long id){
//        try {
//            String endpoint = "http://localhost:/service/helloword?wsdl";
//            // 直接引用远程的wsdl文件
//            // 以下都是套路
//            Service service = new Service();
//            Call call = (Call) service.createCall();
//            call.setTargetEndpointAddress(endpoint);
//            call.setOperationName("findSetedBill");// WSDL里面描述的接口名称
//            call.addParameter("id",
//                    org.apache.axis.encoding.XMLType.XSD_DATE,
//                    javax.xml.rpc.ParameterMode.IN);// 接口的参数
//            call.setReturnType(org.apache.axis.encoding.XMLType.XSD_STRING);// 设置返回类型
//            String result = (String) call.invoke(new Object[] { id });
//            // 给方法传递参数，并且调用方法
//            System.out.println("result is " + result);
//        } catch (Exception e) {
//            System.err.println(e.toString());
//        }
//
//
//        return settedBillService.findById(id);
//    }


}
