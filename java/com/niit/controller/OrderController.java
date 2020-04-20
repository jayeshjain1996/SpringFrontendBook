package com.niit.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.instamojo.wrapper.api.ApiContext;
import com.instamojo.wrapper.api.Instamojo;
import com.instamojo.wrapper.api.InstamojoImpl;
import com.instamojo.wrapper.model.PaymentOrder;
import com.instamojo.wrapper.model.PaymentOrderResponse;
import com.niit.model.Book;
import com.niit.service.BookService;


@Controller
@RequestMapping("/order")
public class OrderController 
{
    @Autowired
    BookService bookService;
	
	@RequestMapping("/{bookid}")
	public void m1(@PathVariable("bookid") int bookid,HttpServletResponse resp)
	{
		Book b=bookService.displayByBookid(bookid);
		  
		  try 
	       {
	           ApiContext context = ApiContext.create("g4G0tJ9Pewpl1hKrKnLJ1kXRKCMUIEaROjBt616E", "8piRkxbxDH3kMAWJxMuF7I3Bf3lPw5G3UlXNxDwHfUiGJZQ1p8EHEJlaimZAvcpqTQ7GfPAlhSBBUwshSKLeo10r9iXKepv6kmmV2SAvyuEThWlNSNKjUm7lK7ha7TVP", ApiContext.Mode.LIVE);
	           Instamojo api = new InstamojoImpl(context);

	           PaymentOrder order = new PaymentOrder();
	           order.setName("jayeshjazz7");
	           order.setEmail("jayeshjazz7@gmail.com");
	           order.setPhone("8898617911");
	           order.setCurrency("INR");
	           order.setAmount((double)b.getPrice());
	           order.setDescription(b.getBookname());
	           order.setRedirectUrl("https://www.google.com");
	           order.setWebhookUrl("https://www.google.com");
	           order.setTransactionId(UUID.randomUUID().toString());

	           PaymentOrderResponse paymentOrderResponse = api.createPaymentOrder(order);
	           resp.sendRedirect(paymentOrderResponse.getPaymentOptions().getPaymentUrl());
	       }
	       catch (Exception e) 
	       {
	           System.out.println(e);
	       }
	}
}