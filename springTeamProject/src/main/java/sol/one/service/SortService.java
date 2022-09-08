package sol.one.service;

import java.util.List;

import org.springframework.stereotype.Service;

import sol.one.VO.ProductVO;

@Service
public interface SortService {

public List<ProductVO> list_time_desc()throws Exception;
	
	public List<ProductVO> list_time_asc()throws Exception;
	
	public List<ProductVO> list_discount_desc()throws Exception;
	
	public List<ProductVO> list_discount_asc()throws Exception;
	
	public List<ProductVO> list_price_desc()throws Exception;
	
	public List<ProductVO> list_price_asc()throws Exception;
}
