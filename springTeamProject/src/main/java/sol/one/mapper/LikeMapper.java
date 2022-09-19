package sol.one.mapper;
import org.apache.ibatis.annotations.Param;

import sol.one.VO.LikeVO;

public interface LikeMapper {
		public int insertL(LikeVO likeVO); 		
		
		public int deleteL(LikeVO likeVO); 	
		
		public int count_like(int product_id);
	  }
					 



