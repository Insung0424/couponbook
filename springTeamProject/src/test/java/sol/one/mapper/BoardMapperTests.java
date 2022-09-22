package sol.one.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import sol.one.VO.BoardVO;
import sol.one.VO.ProductVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	 @Autowired
	 private BoardMapper mapper;
	 
	 @Autowired
	 private ProductMapper pmapper;
	 
	 @Test
	 public void te() {
		 log.info(mapper);
	 }
	 
	 @Test
	 public void t1() {
		 ProductVO vo1 = new ProductVO();
		 vo1.setCategory_id(1);
		 vo1.setCompany_name("com");
		 vo1.setPd_name("쿠폰2");
		 vo1.setPd_price("3000");
		 vo1.setPd_img("c:/");
		 vo1.setPd_desc("desc2");
		 vo1.setLocation_id(2);
		 vo1.setPd_discount(13);
		 vo1.setPd_date("2022-09-12");
		 
		 log.info(pmapper.insertP(vo1));
		 
		 
		 BoardVO vo = new BoardVO();
		 vo.setUser_id(1L);
		 vo.setBoard_title("쿠폰2");
		 vo.setBoard_content("desc2");
		 vo.setPd_discount(13);
		 vo.setPd_date("2022-09-12");
		 
		 log.info(mapper.insertBoard(vo));
		 log.info(mapper.getBoard(1));
	 }
}
