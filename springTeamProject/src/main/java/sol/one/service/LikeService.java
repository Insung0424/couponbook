package sol.one.service;

import sol.one.VO.LikeVO;

public interface LikeService {

    public void insertL(LikeVO likeVO); //장바구니 추가
 
    public void deleteL(LikeVO likeVO); // 장바구니 아이템 개별 삭제 
    
    public void updateL_add(int product_id); 
    
    public void updateL_min(int product_id);
    
    public int count_like(LikeVO likeVO);
}
