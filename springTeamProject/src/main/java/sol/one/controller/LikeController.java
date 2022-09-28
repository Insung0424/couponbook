package sol.one.controller;

import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sol.one.VO.LikeVO;
import sol.one.VO.MemberVO;
import sol.one.service.LikeService;
import sol.one.service.MemService;

@Controller
public class LikeController {
	
    @Inject
    LikeService likeService;
 

    @ResponseBody
    @RequestMapping(value = "/category/detail/insertL.do", method = RequestMethod.POST)
    public String insert(@ModelAttribute LikeVO likeVO,int product_id, HttpSession session){
    
    	likeService.insertL(likeVO);
    	likeService.updateL_add(product_id);
       
        
    	return "/category/detail?product_id="+product_id;
    }
    
    @ResponseBody
    @RequestMapping(value = "/category/detail/deleteL.do", method = RequestMethod.POST)
    public String deleteL(@ModelAttribute LikeVO likeVO,int product_id, HttpSession session) {
    
    	likeService.deleteL(likeVO);
    	likeService.updateL_min(product_id);
 
        
    	return "/category/detail?product_id="+product_id;
    }    
    
        
    }   


