package cn.itsource.web.webservice.impl;

import cn.itsource.domain.SettedBill;
import cn.itsource.service.ISettedBillService;
import cn.itsource.web.webservice.SettedWebService;
import org.springframework.beans.factory.annotation.Autowired;


import javax.jws.WebService;


@WebService(endpointInterface = "cn.itsource.web.webservice.SettedWebService",serviceName = "queryInfo")
public class SettedWebServiceImpl implements SettedWebService {
    @Autowired
    private ISettedBillService settedBillService;
    @Override
    public SettedBill findSetedBill(Long id) {
        return settedBillService.findById(id);
    }
}
