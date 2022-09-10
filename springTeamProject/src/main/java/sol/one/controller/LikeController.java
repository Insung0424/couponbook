package sol.one.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import sol.one.VO.LikeVO;
import sol.one.VO.MemberVO;
import sol.one.service.LikeService;
import sol.one.service.MemService;

@Controller
public class LikeController {
    @Inject
    LikeService likeService;

    
    @RequestMapping("product/pdtOne/insertL.do")
    public String insert(@ModelAttribute LikeVO likeVO, HttpSession session) {
   	           
        likeService.insertL(likeVO);
 
        return "redirect:/product/pdtOne";
    }
 
        
    @RequestMapping("product/pdtOne/deleteL.do")
    public String deleteL(int product_id) {
 
        likeService.deleteL(product_id);
 
        return "redirect:/product/pdtOne";
    }
 
  
 
}
 


