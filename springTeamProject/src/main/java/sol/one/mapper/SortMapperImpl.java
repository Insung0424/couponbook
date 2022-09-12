package sol.one.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import sol.one.VO.ProductVO;

@Repository
@RequiredArgsConstructor
public class SortMapperImpl implements SortMapper{
private static final Logger log = LoggerFactory.getLogger(SortMapperImpl.class);
	
	
	@Resource(name = "sqlSession")
	SqlSession sqlSession;


	@Override
	public List<ProductVO> list_time_desc() throws Exception {
		return sqlSession.selectList("SortMapper.list_time_desc");
	}


	@Override
	public List<ProductVO> list_time_asc() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("SortMapper.list_time_asc");
	}


	@Override
	public List<ProductVO> list_discount_desc() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("SortMapper.list_discount_desc");
	}


	@Override
	public List<ProductVO> list_discount_asc() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("SortMapper.list_discount_asc");
	}


	@Override
	public List<ProductVO> list_price_desc() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("SortMapper.list_price_desc");
	}


	@Override
	public List<ProductVO> list_price_asc() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("SortMapper.list_price_asc");
	}


	@Override
	public int count_all() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("SortMapper.count_all");
	}
	
	
}
