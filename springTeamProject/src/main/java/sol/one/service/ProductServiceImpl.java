package sol.one.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import sol.one.VO.LikeVO;
import sol.one.VO.ProductVO;
import sol.one.mapper.ProductMapper;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService{
	
	
	@Autowired
	private final ProductMapper mapper;

	
	
	@Override
	public int add(ProductVO vo) {
		return mapper.insertP(vo);
	}			
	
	@Override
	public int remove(int product_id) {
		return mapper.deleteP(product_id);
	}

	@Override
	public int update(ProductVO vo) {
		return mapper.modifyP(vo);
	}

	@Override
	public ProductVO get(int product_id) {
		return mapper.selectP(product_id);
	}

	@Override
	public int status_change(int product_id) {
		return mapper.pd_status_c(product_id);
	}
	

	@Override
	public int getI(String pd_img) {
		return mapper.selectPimg(pd_img);
	}

//	@Override
//	public int addCart(LikeVO cart) throws Exception {
//		// TODO Auto-generated method stub
//		return 0;
//	}

}