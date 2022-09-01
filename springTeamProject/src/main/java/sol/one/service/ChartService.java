package sol.one.service;

import java.util.List;

import sol.one.VO.Criteria;
import sol.one.VO.T_tradeVO;

public interface ChartService {
	
	//1주일 거래내역
	List<T_tradeVO> tradeWeek(T_tradeVO tvo); 
	
	//1주일 요일별 거래 건수
	int[] tradeWeekCnt(T_tradeVO tvo);
	
	//거래내역 전체목록
	//List<T_tradeVO> tradeAllList(T_tradeVO tvo);
	//거래내역 전체목록 : 페이징 처리
	List<T_tradeVO> tradeAllList(Criteria cir);
	
	
	
	

}
