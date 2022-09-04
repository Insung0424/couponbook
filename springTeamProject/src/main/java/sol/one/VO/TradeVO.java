package sol.one.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class TradeVO {
	private int product_id;
	private int sell_user_id;
	private int buyer_user_id;
	private int pd_status;
	private Date trade_time;
	
	

}