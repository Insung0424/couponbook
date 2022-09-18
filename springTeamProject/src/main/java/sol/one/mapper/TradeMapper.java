package sol.one.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sol.one.VO.LikeVO;
import sol.one.VO.T_tradeVO;

public interface TradeMapper {

	public int put(T_tradeVO vo);

	public int putsell(T_tradeVO vo);
	
	public List<T_tradeVO> getMyAll(int user_id);
	
	public List<T_tradeVO> getMySellList(int sell_user_id);
	
	public List<T_tradeVO> getMyBuyList(int buyer_user_id);
	
	public int up_pd(@Param("product_id")int product_id,@Param("pd_status")int pd_status);
	
	public T_tradeVO getSellPdstatus(@Param("product_id")int product_id,@Param("sell_user_id")int sell_user_id);

	public T_tradeVO getBuyPdstatus(@Param("product_id")int product_id,@Param("sell_user_id")int sell_user_id,@Param("buyer_user_id")int buyer_user_id);
	
	public LikeVO getMyLike(@Param("product_id")int product_id, @Param("user_id")int user_id);
	
	
}
