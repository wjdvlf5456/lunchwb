package com.lunchwb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/stat")
public class StatController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@GetMapping("/statCalendar")
	public String statCalendarForm() {
		logger.info("StatController > statCalendarForm()");
		
	
		return "stat/statCalendar";
	};
	

}
