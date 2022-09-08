package sol.one.mapper;

import java.util.List;

import sol.one.VO.ProductVO;

public interface CategoryMapper {

	public List<ProductVO> list_all_category()throws Exception;
	
	public List<ProductVO> list_category(int category_id)throws Exception;
}
