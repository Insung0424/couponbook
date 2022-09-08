package sol.one.service;

import java.util.List;

import org.springframework.stereotype.Service;

import sol.one.VO.ProductVO;

@Service
public interface CategoryService {
	
	public List<ProductVO> list_all_category()throws Exception;
	
	public List<ProductVO> list_category(int category_id) throws Exception;
}
