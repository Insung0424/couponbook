package sol.one.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import sol.one.VO.Criteria;
import sol.one.VO.T_tradeVO;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ChartMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ChartMapper mapper;
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		//10개씩 1페이지
		cri.setPageNum(1);
		cri.setAmount(10);
		
		List<T_tradeVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board.getProduct_id()));
	}
}
