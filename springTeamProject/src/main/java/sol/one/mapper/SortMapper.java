package sol.one.mapper;

import java.util.List;

import sol.one.VO.ProductVO;

public interface SortMapper {

	public List<ProductVO> list_time_desc()throws Exception;
	
	public List<ProductVO> list_time_asc()throws Exception;
	
	public List<ProductVO> list_discount_desc()throws Exception;
	
	public List<ProductVO> list_discount_asc()throws Exception;
	
	public List<ProductVO> list_price_desc()throws Exception;
	
	public List<ProductVO> list_price_asc()throws Exception;
	
	public int count_all()throws Exception;
}
