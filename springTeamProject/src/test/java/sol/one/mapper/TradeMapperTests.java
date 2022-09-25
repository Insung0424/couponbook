package sol.one.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import sol.one.VO.T_tradeVO;
import sol.one.service.TradeLogService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TradeMapperTests {

	@Autowired
    private TradeMapper mapper;
	
	@Autowired
    private TradeLogService service;

    @Test
    public void testMapper() {
        log.info(mapper);
    }
    
//    @Test
//    public void put() {
//    	T_tradeVO vo = new T_tradeVO();
//    	vo.setBuyer_user_id(42);
//    	vo.setSell_user_id(81);
//    	vo.setPd_status(2);
//    	log.info(vo);
//    	log.info(service.insertTradeLog(vo));
//    }
    
    @Test
    public void get1() {
    	log.info(mapper.getMyAll(1));
    }
    
    @Test
    public void get2() {
    	log.info(mapper.getMyBuyList(1));
    }
    
    @Test
    public void get3() {
    	log.info(mapper.getMySellList(1));
    }
    
}
