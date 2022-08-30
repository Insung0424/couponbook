package sol.one.mapper;

import java.util.List;

import sol.one.VO.T_tradeVO;

public interface ChartMapper {
	/**
	 * 1주일간의 거래내역 목록
	 * 테스트용으로 22/08/01 - 22/08/07 거래내역 조회
	 * @param tvo
	 * @return
	 */
	public List<T_tradeVO> tradeWeek(T_tradeVO tvo);

	/**
	 * 1주일간의 거래내역 목록
	 * 테스트용으로 22/08/01 - 22/08/07 거래내역 조회
	 * @param tvo
	 * @return 
	 */
	public List<T_tradeVO> tradeWeekCnt(T_tradeVO tvo);
}
