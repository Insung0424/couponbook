package sol.one.service;

import java.util.List;

import sol.one.VO.T_tradeVO;

public interface ChartService {
	
	//1주일 거래내역
	List<T_tradeVO> tradeWeek(T_tradeVO tvo); 
	
	//1주일 요일별 거래 건수
	int[] tradeWeekCnt(T_tradeVO tvo);
//	List<T_tradeVO> tradeWeekCnt(T_tradeVO tvo);
	

}
