package sol.one.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sol.one.VO.LikeVO;
import sol.one.VO.T_tradeVO;

public interface TradeMapper {

	public int put(T_tradeVO vo);

	public int putsell(T_tradeVO vo);
	
	public List<T_tradeVO> getMyAll(Long user_id);
	
	public List<T_tradeVO> getMySellList(Long sell_user_id);
	
	public List<T_tradeVO> getMyBuyList(Long buyer_user_id);
	
	public int up_pd(@Param("product_id")int product_id,@Param("pd_status")int pd_status);
	
	public T_tradeVO getSellPdstatus(@Param("product_id")int product_id,@Param("sell_user_id")Long sell_user_id);

	public T_tradeVO getBuyPdstatus(@Param("product_id")int product_id,@Param("sell_user_id")Long sell_user_id,@Param("buyer_user_id")Long buyer_user_id);
	
	public LikeVO getMyLike(@Param("product_id")int product_id, @Param("user_id")Long user_id);
	
	
}
