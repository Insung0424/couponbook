package sol.one.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class T_tradeVO {
	  private int product_id;
	  private int sell_user_id;
	  private int buyer_user_id;
	  private int pd_status;
	  private String trade_time;
}