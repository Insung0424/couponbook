package sol.one.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.T_tradeVO;
import sol.one.mapper.ChartMapper;

@Service
@Log4j
@RequiredArgsConstructor
public class ChartServiceImpl implements ChartService {
	
	private final ChartMapper mapper;

	@Override
	public List<T_tradeVO> tradeWeek(T_tradeVO tvo) {
		// 1주일 거래내역
		log.info("ChartServiceImpl ------------ ");
		List<T_tradeVO> trade = mapper.tradeWeek(tvo);
		return trade;
	}

	@Override
	public int[] tradeWeekCnt(T_tradeVO tvo) {
		// 1주일 요일별 거래 건수
		log.info("ChartServiceImpl CNT ------------ ");
		int[] tradeCNT = mapper.tradeWeekCnt(tvo); 
		return tradeCNT;
	}

	@Override
	public List<T_tradeVO> tradeAllList(T_tradeVO tvo) {
		// 거래내역 전체 목록 가져오기
		log.info("CSI trade All list ------- ");
		List<T_tradeVO> tradeAllList = mapper.tradeAllList(tvo);
		return tradeAllList;
	}

}
