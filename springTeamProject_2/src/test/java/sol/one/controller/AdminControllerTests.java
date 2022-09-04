package sol.one.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import sol.one.VO.T_tradeVO;
import sol.one.mapper.ChartMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminControllerTests {
	private ChartMapper chartMapper;
	private T_tradeVO tvo;
	
	@Test
	public void testMapper() {
		log.info(chartMapper);
	}
	
	@Test
	public void testTradeWeekCnt() {
//		tvo.setCntDate("22/08/08");
		chartMapper.tradeWeekCnt(tvo);
	}
	
	@Test
	public void tradeWeek() {
		String cntDate="22/08/08";
		chartMapper.tradeWeek(tvo);
	}

}
