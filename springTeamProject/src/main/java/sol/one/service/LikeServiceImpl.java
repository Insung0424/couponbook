package sol.one.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import sol.one.VO.LikeVO;




@Service
public class LikeServiceImpl implements LikeService {

	 @Inject
	    LikeDAO likeDao;
	
	 
	 @Override
	 public void insertL(LikeVO likeVO) {
		 likeDao.insertL(likeVO);
	 }
	 

	 @Override
	    public void deleteL(LikeVO likeVO) {
	        likeDao.deleteL(likeVO);
	    }
	 
	 @Override
		public void updateL_add(int product_id) {
			likeDao.updateL_add(product_id);
		}
		
		
		@Override
		public void updateL_min(int product_id) {
			likeDao.updateL_min(product_id);
			
		}

	@Override
	public int count_like(LikeVO likeVO) {
		
		return likeDao.count_like(likeVO);
	}
	 


	 
	 
	 
	 
	
	
}
