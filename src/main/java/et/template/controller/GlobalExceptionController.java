package et.template.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import et.template.exception.GenericException;
import et.template.exception.JsonException;
import et.template.exception.LoginException;
import et.template.model.JsonModel;

@ControllerAdvice
public class GlobalExceptionController {
	
	@Value("${json.return.fail}")
	private int JSON_FAIL;
	
	@ExceptionHandler(GenericException.class)
	public ModelAndView handleCustomException(GenericException ex) {
		ModelAndView model = new ModelAndView();

		model.setViewName("message");
		model.addObject("errCode", ex.getErrCode());
		model.addObject("errMsg", ex.getErrMsg());

		return model;

	}
	
	@ExceptionHandler(LoginException.class)
	public String handleLoginException(LoginException ex, RedirectAttributes rAttr) {
		//rAttr.addFlashAttribute("errCode", ex.getErrCode());
		rAttr.addFlashAttribute("errMsg", ex.getMessage());
		return "redirect:login";
	}

	@ExceptionHandler(JsonException.class)
	@ResponseBody
	public JsonModel handleJsonException(JsonException ex) {
		JsonModel model = new JsonModel(JSON_FAIL, ex.getMessage());
		System.out.println("handleJsonException");
		return model;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllException(Exception ex) {

		ModelAndView model = new ModelAndView("message");
		model.addObject("errMsg", ex.getMessage());

		return model;

	}
	
}
