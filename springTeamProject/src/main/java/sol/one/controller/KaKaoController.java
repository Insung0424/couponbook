package sol.one.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import sol.one.VO.MemberVO;
import sol.one.service.KakaoService;

@Controller
@AllArgsConstructor
public class KaKaoController {
    @Autowired
    private KakaoService kakaoService;
    
    @Autowired
    private HttpSession session;
	
    @RequestMapping(value="/kakaologin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model) throws Exception{
        System.out.println("#########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        MemberVO userInfo = kakaoService.getUserInfo(access_Token);
//        MemberVO number = kakaoService.kakaoNumber(userInfo);
        session.invalidate();
        session.setAttribute("kakaoN", userInfo.getNickname());
        session.setAttribute("kakaoE", userInfo.getEmail());
//        session.setAttribute("kakaoNumber", number.getK_number());
        
        return "redirect:/loginMain";
    }
}