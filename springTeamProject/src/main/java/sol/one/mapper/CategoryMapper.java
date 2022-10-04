package sol.one.mapper;

import java.util.List;

import sol.one.VO.DetailVO;
import sol.one.VO.ProductVO;

public interface CategoryMapper {

	public List<ProductVO> list_all_category()throws Exception;
	
	public List<ProductVO> list_category(int category_id)throws Exception;
	public List<ProductVO> list_popular_category() throws Exception;


	public int count_all()throws Exception;
	
	public int count_category(int category_id)throws Exception;
	
	public List<ProductVO> all_search(String search)throws Exception;
	
	public List<DetailVO> detail(int product_id)throws Exception;
	
}
