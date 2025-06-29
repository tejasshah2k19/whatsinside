package com.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.PaymentBean;
import com.service.PaymentService;

@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;
	
	@GetMapping("paynow")
	public String payNow() {
		return "PayNow";
	}

	@PostMapping("processPayment")
	public String processPayment(PaymentBean paymentBean) {
		System.out.println(paymentBean.getCardNumber());
		System.out.println(paymentBean.getCvv());
		System.out.println(paymentBean.getExpDate());
	
		paymentService.chargeCreditCard("22UmU47bLLM","63u94FC9qC25nU99",500D,paymentBean);
		return "Home";
	}
}
