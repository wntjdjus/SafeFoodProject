package com.ssafy.advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionAdvice {
	
	@ExceptionHandler(Exception.class)	// catch같은역할
	public ModelAndView handleException(Exception e) {
		e.printStackTrace();
		ModelAndView mav = new ModelAndView("error");
		mav.addObject("errorMsg", e.getMessage());
		return mav;
	}
}
