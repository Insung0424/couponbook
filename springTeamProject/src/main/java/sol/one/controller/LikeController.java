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

import sol.one.VO.LikeVO;
import sol.one.VO.MemberVO;
import sol.one.service.LikeService;
import sol.one.service.MemService;

@Controller
public class LikeController {
	
    @Inject
    LikeService likeService;


    @RequestMapping(value = "/product/contentPage/insertL.do", method = RequestMethod.POST)
    public String insert(@ModelAttribute LikeVO likeVO, HttpSession session)  {
    
        likeService.insertL(likeVO);                    
        
        return "redirect:/main";
    }
 
  
 
}
 


