package sol.one.service;

import sol.one.VO.LikeVO;

public interface LikeService {

    public void insertL(LikeVO likeVO); //장바구니 추가
 
    public void deleteL(LikeVO likeVO); // 장바구니 아이템 개별 삭제 
    
}
