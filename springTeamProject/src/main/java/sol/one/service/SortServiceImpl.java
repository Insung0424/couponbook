package sol.one.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import sol.one.VO.ProductVO;
import sol.one.mapper.SortMapper;

@Repository
@RequiredArgsConstructor
public class SortServiceImpl implements SortService{
	
	private static final Logger log = LoggerFactory.getLogger(SortServiceImpl.class);

	private final SortMapper mapper;
	
	
	@Resource(name = "sqlSession")
	SqlSession sqlSession;


	@Override
	public List<ProductVO> list_time_desc() throws Exception {
		// TODO Auto-generated method stub
		return mapper.list_time_desc();
	}


	@Override
	public List<ProductVO> list_time_asc() throws Exception {
		// TODO Auto-generated method stub
		return mapper.list_time_asc();
	}


	@Override
	public List<ProductVO> list_discount_desc() throws Exception {
		// TODO Auto-generated method stub
		return mapper.list_discount_desc();
	}


	@Override
	public List<ProductVO> list_discount_asc() throws Exception {
		// TODO Auto-generated method stub
		return mapper.list_discount_asc();
	}


	@Override
	public List<ProductVO> list_price_desc() throws Exception {
		// TODO Auto-generated method stub
		return mapper.list_price_desc();
	}


	@Override
	public List<ProductVO> list_price_asc() throws Exception {
		// TODO Auto-generated method stub
		return mapper.list_price_asc();
	}
	
	
	
}
