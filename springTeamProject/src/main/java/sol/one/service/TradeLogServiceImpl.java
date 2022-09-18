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

	@Override
	public int update(int product_id,int pd_status) {
		return mapper.up_pd(product_id,pd_status);
	}

	@Override
	public int insertSellTradeLog(T_tradeVO vo) {
		return mapper.putsell(vo);
	}

	@Override
	public T_tradeVO getsellmypdstatus(int product_id,int sell_user_id) {
		return mapper.getSellPdstatus(product_id,sell_user_id);
	}

	@Override
	public T_tradeVO getbuymypdstatus(int product_id, int sell_user_id, int buyer_user_id) {
		return mapper.getBuyPdstatus(product_id, sell_user_id, buyer_user_id);
	}

	
}
