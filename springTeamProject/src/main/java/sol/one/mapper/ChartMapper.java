package sol.one.mapper;

import java.util.List;

import sol.one.VO.Criteria;
import sol.one.VO.MemberVO;
import sol.one.VO.T_tradeVO;

public interface ChartMapper {
	/**
	 * 1주일간의 거래내역 목록
	 * 테스트용으로 22/08/01 - 22/08/07 거래내역 조회
	 * @param tvo
	 * @return List<T_tradeVO>
	 */
	public List<T_tradeVO> tradeWeek(T_tradeVO tvo);

	/**
	 * 1주일간의 거래내역 목록
	 * 테스트용으로 22/08/01 - 22/08/07 거래내역 조회
	 * @param tvo
	 * @return int[]
	 */
	public int[] tradeWeekCnt(T_tradeVO tvo);
	
	/**
	 * 거래내역 전체 목록
	 * @param tvo
	 * @return List<T_tradeVO>
	 */
	public List<T_tradeVO> tradeAllList(T_tradeVO tvo);
	
	
	/**
	 * 페이징을 위한 메서드
	 * @param cri
	 * @return List<T_tradeVO>
	 */
	public List<T_tradeVO> getListWithPaging(Criteria cri);
	
	/**
	 * 거래내역 전체 개수
	 * @param cri
	 * @return int
	 */
	public int getTotalTrdCnt(Criteria cri);

	/**
	 * 회원전체목록 + 페이징
	 * @param cri
	 * @return List<MemberVO>
	 */
	public List<MemberVO> getMemList(Criteria cri);
	
	public int getTotalMemCnt(Criteria cri);
}
