package sol.one.service;

import java.util.List;

import sol.one.VO.LikeVO;

public interface LikeDAO {
    
	   
	    public void insertL(LikeVO likeVO); //장바구니 추가
	 
	    public void deleteL(LikeVO likeVO);
	}
