package sol.one.service;

import java.util.List;

import sol.one.VO.LikeVO;
import sol.one.VO.T_tradeVO;

public interface TradeLogService {

	public int insertTradeLog(T_tradeVO vo); //구매자 거래완료
	public int insertSellTradeLog(T_tradeVO vo); // 판매자 거래완료
	public List<T_tradeVO> readMyAllList(long user_id);
	public List<T_tradeVO> readMySellList(long sell_user_id);
	public List<T_tradeVO> readMyBuyList(long buyer_user_id);
	public int update(int product_id,int pd_status); // 판매자의 글 상태 변경
	public T_tradeVO getsellmypdstatus(int product_id,long sell_user_id);
	public T_tradeVO getbuymypdstatus(int product_id,long sell_user_id,long buyer_user_id);
	public LikeVO getLike(int product_id,long user_id);
}
