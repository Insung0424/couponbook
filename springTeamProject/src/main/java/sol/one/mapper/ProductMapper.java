package sol.one.mapper;


import sol.one.VO.ProductVO;

public interface ProductMapper {
	
	public int insertP(ProductVO vo); //등록
	 
	public int deleteP(int product_id); // 삭제
	
	public int modifyP(ProductVO vo); // 수정
	
	public void modifyProduct(ProductVO product); //민곤 글수정구현
	
	public ProductVO selectP(int product_id); // 보기?
	
	public int selectPimg(String pd_img);
	
	public int pd_status_c(int product_id); // 거래상태조절
	
	
	

}
