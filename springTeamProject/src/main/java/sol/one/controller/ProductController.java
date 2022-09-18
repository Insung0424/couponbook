package sol.one.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import sol.one.VO.CommentVO;
import sol.one.VO.LikeVO;
import sol.one.VO.T_tradeVO;
import sol.one.service.TradeLogService;

@RequestMapping("/product")
@RestController
public class ProductController {
	
	@Autowired
	private TradeLogService tradelogservice;

	@GetMapping("/get/getMySellPdstatus")
	public Map<String,Object> getMySellPdstatus(int product_id,int sell_user_id) {
		Map<String,Object> map = new HashMap<>();
		T_tradeVO vo = tradelogservice.getsellmypdstatus(product_id,sell_user_id);
		if(vo == null) {
			map.put("pd_status", "notradelog");
			return map;
		}
		else {
			int pd_status = vo.getPd_status();
			map.put("pd_status", pd_status);
			return map;
		}
		
	}
	
	@GetMapping("/get/getMyBuyPdstatus")
	public Map<String,Object> getMyBuyPdstatus(int product_id,int sell_user_id,int buyer_user_id) {
		Map<String,Object> map = new HashMap<>();
		T_tradeVO vo = tradelogservice.getbuymypdstatus(product_id,sell_user_id,buyer_user_id);
		if(vo == null) {
			map.put("pd_status", "notradelog");
			return map;
		}
		else {
			int pd_status = vo.getPd_status();
			map.put("pd_status", pd_status);
			return map;
		}
		
	}
	
	@GetMapping("/getMyLike")
	public Map<String,Object> getMyLike(int product_id,int user_id) {
		Map<String,Object> map = new HashMap<>();
		LikeVO vo = tradelogservice.getLike(product_id, user_id);
		if(vo == null) {
			map.put("like", "nolike");
			return map;
		}
		else {
			map.put("like", "like");
			return map;
		}
		
	} 
}
