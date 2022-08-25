package co.mg.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class TradeDTO {
	private int product_id;
	private int buyer_user_id;
	private int seller_user_id;
	private int pd_status;
	private Date trade_created;
	
	

}