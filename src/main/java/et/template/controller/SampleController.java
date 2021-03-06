package et.template.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itextpdf.io.font.FontConstants;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;

import et.template.exception.JsonException;
import et.template.model.JsonModel;

@Controller
public class SampleController {

	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Value("${file.upload.path}")
	private String Path;
	
	@Autowired
    private MessageSource messageSource;
	
	@RequestMapping(value = "/uploadFileExample", method = RequestMethod.POST)
	@ResponseBody
	public JsonModel uploadSingleFile(@RequestParam(value="uploadFileName",required = true) String name, @RequestParam("uploadFile") MultipartFile file) {
		
		JsonModel rtn = new JsonModel();
		
		if(!file.isEmpty()){
			
			File filepath = new File(Path);
			if(!filepath.exists()){
				filepath.mkdirs();
			}
			
			log.debug("file name : {}",file.getName());
			log.debug("file original name : {}", file.getOriginalFilename());
			log.debug("file size : {}", file.getSize());
			
			String oriName = file.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			
			File uploadfile = new File(filepath, name+ext);
		
			try(BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(uploadfile))) {
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				String message = messageSource.getMessage("FILE.UPLOAD.SUCCESS", null, LocaleContextHolder.getLocale());
				rtn.setMessage(message);
				
			} catch (IOException e) {
				log.error(e.getMessage());
				String message = messageSource.getMessage("FILE.UPLOAD.FAIL", new Object[]{e.getMessage()}, LocaleContextHolder.getLocale());
				throw new JsonException(message);
			}

		}else{
			log.debug("file is empty");
			String message = messageSource.getMessage("FILE.UPLOAD.EMPTY", null, LocaleContextHolder.getLocale());
			throw new JsonException(message);
		}
		
		
		return rtn;
	}
	
	@RequestMapping(value = "/uploadMultipleFileExample", method = RequestMethod.POST)
	public ModelAndView uploadMultipleFile(@RequestParam("uploadFile") String[] name, @RequestParam("uploadFile") MultipartFile[] files,  RedirectAttributes redirectAttributes) {

		ModelAndView mv = new ModelAndView();
		for(MultipartFile file : files){
			if(!file.isEmpty()){
				//跟上面一樣
			}
		}

		return mv;
	}
	
	@RequestMapping(value = "downloadPDF", method = RequestMethod.GET)
	public void downloadFile(HttpServletResponse response) {
		
		response.setContentType("application/pdf");
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"", "test.pdf");
		response.setHeader(headerKey, headerValue);
		
		try {
			PdfWriter writer = new PdfWriter(response.getOutputStream());
			PdfDocument pdf = new PdfDocument(writer);
			PdfFont font = PdfFontFactory.createFont(FontConstants.COURIER);
		    Document document = new Document(pdf);
		    document.add(new Paragraph("Hello World!").setFont(font));
		    document.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
