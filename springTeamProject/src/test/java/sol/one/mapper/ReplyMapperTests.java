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
    	vo.setComment_content("text3");
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
    	int comment_no = 1;
    	mapper.delete(comment_no);
    	replyVO vo = new replyVO();
    	vo.setUser_id(1);
    	log.info(mapper.read(vo.getUser_id()));
    }
    
    @Test
    public void testdelall() {
    	int product_id = 1;
    	mapper.deleteAll(product_id);
    	replyVO vo = new replyVO();
    	vo.setUser_id(1);
    	log.info(mapper.read(vo.getUser_id()));
    }
    
    @Test
    public void testUpdate() {
    	replyVO vo = new replyVO();
    	vo.setUser_id(1);
    	vo.setComment_no(2);
    	vo.setComment_content("변경댓글");
    	mapper.update(vo);
    	log.info(mapper.read(vo.getUser_id()));
    }
}
