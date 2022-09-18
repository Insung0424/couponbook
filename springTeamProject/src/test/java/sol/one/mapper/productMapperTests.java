package sol.one.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import sol.one.VO.DetailVO;
import sol.one.VO.ProductVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class productMapperTests {
	
	 @Autowired
	 private ProductMapper mapper;
	 
	 @Autowired
	 private CategoryMapper cmapper;
	 
	 @Test
     public void testMapper( ) {
         log.info(mapper);
     }
	 
	 @Test
	 public void getP() {
    	log.info(mapper.selectP(1));
     }
	 
	 
	 @Test
	 public void in() {
		 ProductVO vo = new ProductVO();
		 vo.setCategory_id(1);
		 vo.setCompany_name("com");
		 vo.setPd_name("쿠폰2");
		 vo.setPd_price("3000");
		 vo.setPd_img("c:/");
		 vo.setPd_desc("desc2");
		 vo.setLocation_id(2);
		 vo.setPd_discount(13);
		 
		 mapper.insertP(vo);
		 
		 log.info(vo);
	 }
	 
	 
	 @Test
	 public void get() {
		 try {
			DetailVO v0 =  (DetailVO) cmapper.detail(481);
			log.info(v0);
		} catch (Exception e) {
		}
	 }
}
