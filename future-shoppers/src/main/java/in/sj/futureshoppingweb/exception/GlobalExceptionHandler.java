package in.sj.futureshoppingweb.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(value=NoHandlerFoundException.class)
	public String noHandlerFountException(Model model) {
		
		model.addAttribute("title","Not Found");
		return "error";
	}
}
