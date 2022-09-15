package sol.one.service;

import java.util.List;

import sol.one.VO.LikeVO;
import sol.one.VO.ProductVO;

public interface ProductService {
	
	public int add(ProductVO vo); //등록
	 
	public int remove(int product_id); // 삭제
	
	public int update(ProductVO vo); // 수정
	
	public ProductVO get(int product_id); // 보기?
	
	public int getI(String pd_img); // 글 등록 후 상세페이지 바로보여주기
	
	public int status_change(int product_id); // 거래상태조절	
	
	public void modifyProduct(ProductVO product);
	
	
	
	
}
