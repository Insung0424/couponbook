package sol.one.service;

import sol.one.VO.ProductVO;

public interface ProductService {
	
	public int add(ProductVO vo); //등록
	 
	public int remove(int product_id); // 삭제
	
	public int update(ProductVO vo); // 수정
	
	public ProductVO get(int product_id); // 보기?
	
	public int status_change(int product_id); // 거래상태조절

}