package sol.one.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import sol.one.VO.T_tradeVO;
import sol.one.mapper.TradeMapper;

@Service
@RequiredArgsConstructor
public class TradeLogServiceImpl implements TradeLogService {
	
	private final TradeMapper mapper;

	@Override
	public int insertTradeLog(T_tradeVO vo) {
		return mapper.put(vo);
	}

	@Override
	public List<T_tradeVO> readMyAllList(int user_id) {
		return mapper.getMyAll(user_id);
	}

	@Override
	public List<T_tradeVO> readMySellList(int sell_user_id) {
		return mapper.getMySellList(sell_user_id);
	}

	@Override
	public List<T_tradeVO> readMyBuyList(int buyer_user_id) {
		return mapper.getMySellList(buyer_user_id);
	}
	
}
