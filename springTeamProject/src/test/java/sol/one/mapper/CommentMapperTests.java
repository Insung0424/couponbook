package sol.one.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import sol.one.VO.CommentVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommentMapperTests {
	
    @Autowired
    private CommentMapper mapper;

    @Test
    public void testMapper( ) {
        log.info(mapper);
    }
    
    @Test
    public void getLevel() {
    	int[] comment_no_level = mapper.getCommentNoLevel(1,2);
    	log.info(comment_no_level);
    }
    
    @Test
    public void testreply() {
    	CommentVO vo = new CommentVO();
    	vo.setProduct_id(1);
    	vo.setUser_id(2);
    	vo.setComment_content("작성자 2의 text4");
    	log.info(vo);
    	mapper.insert_co(vo);
    }
    
    @Test
    public void testreply_tab() {
    	CommentVO vo = new CommentVO();
    	vo.setProduct_id(1);
    	vo.setUser_id(2);
    	vo.setComment_content("text1 - 작성자2의 답글");
    	vo.setComment_no_level(156);
    	vo.setComment_no(156);
    	log.info(vo);
    	mapper.tabGroupNoUp(vo);
    	mapper.insert_co_tab(vo);
    }
    
    @Test
    public void testRead() {
    	int product_id = 1;
    	log.info(mapper.readAll(product_id));
    }
    
    @Test
    public void testdelete() {
    	int comment_no = 1;
    	mapper.delete(comment_no);
    	CommentVO vo = new CommentVO();
    	vo.setProduct_id(1);
    	log.info(mapper.readAll(vo.getProduct_id()));
    }
    
    @Test
    public void testdelall() {
    	int product_id = 1;
    	mapper.deleteAll(product_id);
    	CommentVO vo = new CommentVO();
    	vo.setProduct_id(1);
    	log.info(mapper.readAll(vo.getProduct_id()));
    }
    
    @Test
    public void testUpdate() {
    	CommentVO vo = new CommentVO();
    	vo.setUser_id(1);
    	vo.setComment_no(2);
    	vo.setComment_content("변경댓글");
    	mapper.update(vo);
    	vo.setProduct_id(1);
    	log.info(mapper.readAll(vo.getProduct_id()));
    }
}
