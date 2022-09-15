package sol.one.service;



import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import sol.one.VO.CommentVO;
import sol.one.VO.LikeVO;
import sol.one.VO.ProductVO;
import sol.one.VO.ReportVO;
import sol.one.service.LikeDAO;

@Repository
public class LikeDAOImpl implements LikeDAO {

	
	   @Inject
	    SqlSession sqlSession;
	
	   
	    @Override
	    public void insertL(LikeVO likeVO) {
	        sqlSession.insert("insertL",likeVO);
	    }
	   	    
	    

		@Override
		public void deleteL(LikeVO likeVO) {
			sqlSession.delete("deleteL",likeVO);
			
		}      
   	    
	    
	    
	   

	    	    
	    
	    
	}
	
	
	
	

