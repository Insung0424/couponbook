package sol.one.service;

import java.util.List;

import sol.one.VO.T_tradeVO;

public interface TradeLogService {

	public int insertTradeLog(T_tradeVO vo);
	public List<T_tradeVO> readMyAllList(int user_id);
	public List<T_tradeVO> readMySellList(int sell_user_id);
	public List<T_tradeVO> readMyBuyList(int buyer_user_id);
	
}
