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


	 
	 
	 
	 
	
	
}
