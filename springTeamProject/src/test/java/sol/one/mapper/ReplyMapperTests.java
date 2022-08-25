package sol.one.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import sol.one.VO.replyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
    @Autowired
    private ReplyMapper mapper;

    @Test
    public void testMapper( ) {
        log.info(mapper);
    }
    
    @Test
    public void testreply() {
    	replyVO vo = new replyVO();
    	vo.setProduct_id(1);
    	vo.setUser_id(1);
    	vo.setComment_content("mapper test");
    	log.info(vo);
    	mapper.insert_co(vo);
    }
    
    @Test
    public void testRead() {
    	int user_id = 1;
    	log.info(mapper.read(user_id));
    }
    
    @Test
    public void testdelete() {
    	replyVO vo = new replyVO();
    	vo.setProduct_id(1);
    	vo.setUser_id(1);
    	vo.setComment_content("mapper test");
    	mapper.delete(vo);
    	log.info(mapper.read(vo.getUser_id()));
    }
    
    @Test
    public void testUpdate() {
    	replyVO vo = new replyVO();
    	vo.setProduct_id(1);
    	vo.setUser_id(1);
    	vo.setComment_content("댓글2");
    	String change_comment = "댓글2 변경";
    	mapper.update(change_comment,vo);
    	log.info(mapper.read(vo.getUser_id()));
    }
}
