package sol.one.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import lombok.RequiredArgsConstructor;
import sol.one.VO.MemberVO;
import sol.one.VO.Page;
import sol.one.VO.PageDTO2;
import sol.one.service.CategoryService;
import sol.one.service.PageService;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final CategoryService service;
	private final PageService pservice;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,Page p) throws Exception {
		model.addAttribute("list_all",service.list_all_category());
		model.addAttribute("count_all", service.count_all());
		model.addAttribute("list",pservice.getPage(p));
		model.addAttribute("pp", new PageDTO2(p,pservice.getTotal(p)));
		return "category/all";
	}
	
	@GetMapping("/main3")
	public void main3() {}
	
	//테스트용 페이지 연결

	@GetMapping("/main")
	public void main() {
	}
	
	@GetMapping("/HowToUse")
	public void HowToUse() {
	}

	// 로그인, 회원가입 확인용 메인으로 이동, 테스트용으로 삭제예정임
	@GetMapping("/loginMain")
	public void loginMain() {
	}

	@GetMapping("/write")
	public void write(@SessionAttribute("mem")MemberVO mem, HttpSession session) {
		
	}

	@GetMapping("/main2")
	public void main2(@SessionAttribute("mem")MemberVO mem, HttpSession session) {

	}

	// ckeditor4 를 이용한 이미지 업로드
	@ResponseBody
	@RequestMapping(value = "fileupload.do")
	public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp,
			MultipartHttpServletRequest multiFile) throws Exception {
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		resp.setCharacterEncoding("utf-8");

		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {

						String fileName = file.getOriginalFilename();
						byte[] bytes = file.getBytes();

						String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/src"); // ������
						System.out.println("uploadPath:" + uploadPath);

						File uploadFile = new File(uploadPath);
						System.out.println(uploadFile);
						if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
						String fileName2 = UUID.randomUUID().toString();
						uploadPath = uploadPath + File.separator + fileName2 + fileName;

						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						printWriter = resp.getWriter();
						String fileUrl = req.getContextPath() + "/resources/images/src/" + fileName2 + fileName; // url���
						System.out.println("fileUrl :" + fileUrl);

						JsonObject json = new JsonObject();
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);

						printWriter.print(json);
						System.out.println(json);

					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}

			}

		}
	}
	
}
