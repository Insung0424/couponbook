package sol.one.mapper;

import java.util.List;

import sol.one.VO.T_tradeVO;

public interface TradeMapper {

	public int put(T_tradeVO vo);
	
	public List<T_tradeVO> getMyAll(int user_id);
	
	public List<T_tradeVO> getMySellList(int sell_user_id);
	
	public List<T_tradeVO> getMyBuyList(int buyer_user_id);
	
	public int up_pd(int product_id,int pd_status);
}
