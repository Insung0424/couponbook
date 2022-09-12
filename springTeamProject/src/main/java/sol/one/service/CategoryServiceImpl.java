package sol.one.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import sol.one.VO.DetailVO;
import sol.one.VO.ProductVO;
import sol.one.mapper.CategoryMapper;



@Repository
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService{
	
	private static final Logger log = LoggerFactory.getLogger(CategoryServiceImpl.class);
	
	
	private final CategoryMapper mapper;
	
	@Resource(name = "sqlSession")
	SqlSession sqlSession;

	@Override
	public List<ProductVO> list_all_category() throws Exception {
		return mapper.list_all_category();
	}

	@Override
	public List<ProductVO> list_category(int category_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.list_category(category_id);
	}

	@Override
	public int count_all() throws Exception {
		return mapper.count_all();
		
	}

	@Override
	public int count_category(int category_id) throws Exception {
		return mapper.count_category(category_id);
		
	}

	@Override
	public List<DetailVO> detail(int product_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.detail(product_id);
	}
	
	
	
	
}
