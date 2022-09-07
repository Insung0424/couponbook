package sol.one.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import sol.one.VO.CommentVO;
import sol.one.VO.T_tradeVO;
import sol.one.service.TradeLogService;

@Controller
@RequestMapping("/product")
@AllArgsConstructor
public class ProductController {
	
	@Autowired
	private TradeLogService service;

	@GetMapping("/main")
	public void main(Model model) {
		CommentVO vo = new CommentVO();
		vo.setUser_id(1);
		vo.setProduct_id(1);
		
		model.addAttribute("vo",vo);
	}
	
	@GetMapping("/comment")
	public void comment(Model model) {}
	
	@GetMapping("/trade")
	public void trade() {}
	
	@PostMapping("/postTrade")
	public String putT(int pd_status) {
		//유저 아이디 받아와서 하도록 변경해야함
		T_tradeVO vo = new T_tradeVO();
		vo.setPd_status(pd_status);
		vo.setBuyer_user_id(3);
		vo.setSell_user_id(2);
		service.insertTradeLog(vo);
		
		return "redirect:/product/main";
	}
	
	@PostMapping("/postTrade2")
	public String putT2(int pd_status) {
		//유저 아이디 받아와서 하도록 변경해야함
		T_tradeVO vo = new T_tradeVO();
		vo.setPd_status(pd_status);
		vo.setBuyer_user_id(3);
		vo.setSell_user_id(2);
		service.insertTradeLog(vo);
		// 거래 내역 테이블 추가와 상품테이블에서 거래 상태 업데이트 필요
		// 상품테이블과 연결된 서비스 생성
		
		return "redirect:/product/main";
	}
	
	@GetMapping("/new")
	public void new1() {}
	
	
	@ResponseBody
	@RequestMapping(value = "fileupload.do")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		resp.setCharacterEncoding("utf-8");
		
		if(file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/src"); //������
			            System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + File.separator + fileName2 +fileName;
			            
			            out = new FileOutputStream(new File(uploadPath));
		            	out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            String fileUrl = req.getContextPath() + "/resources/images/src/" +fileName2 +fileName; //url���
			            System.out.println("fileUrl :" + fileUrl);
			            
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            
			            printWriter.print(json);
			            System.out.println(json);
			            
			            
			 
			        }catch(IOException e){
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
