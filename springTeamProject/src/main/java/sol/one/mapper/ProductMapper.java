package sol.one.mapper;

import sol.one.VO.ProductVO;

public interface ProductMapper {
	
	public int insertP(ProductVO vo);
	
	public int deleteP(int product_id);
	
	public int modifyP(int product_id);
	
	public int selectP(int product_id);

}
