package sol.one.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import sol.one.VO.DetailVO;
import sol.one.VO.ProductVO;

@Repository
@RequiredArgsConstructor
public class CategoryMapperImpl implements CategoryMapper{
private static final Logger log = LoggerFactory.getLogger(MypageMapperImpl.class);
	
	
	@Resource(name = "sqlSession")
	SqlSession sqlSession;


	@Override
	public List<ProductVO> list_all_category() throws Exception {

		return sqlSession.selectList("CategoryMapper.list_all_category");
	}


	@Override
	public List<ProductVO> list_category(int category_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CategoryMapper.list_category",category_id);
	}


	@Override
	public int count_all() throws Exception {
		return sqlSession.selectOne("CategoryMapper.count_all");
		
	}


	@Override
	public int count_category(int category_id) throws Exception {
		return sqlSession.selectOne("CategoryMapper.count_category",category_id);
	}


	@Override
	public List<DetailVO> detail(int product_id) throws Exception {
		return sqlSession.selectList("CategoryMapper.detail",product_id);
	}


	@Override
	public List<ProductVO> all_search(String search) throws Exception {
		return sqlSession.selectList("CategoryMapper.all_search",search);
	}
	

	@Override
	public List<ProductVO> list_popular_category() throws Exception {
		return sqlSession.selectList("CategoryMapper.list_popular_category");
	}
}
