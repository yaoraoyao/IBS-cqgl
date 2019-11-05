package cn.itsource.web.webservice;

import cn.itsource.domain.SettedBill;

import javax.jws.WebService;

@WebService
public interface SettedWebService {

    public SettedBill findSetedBill(Long id);
}
