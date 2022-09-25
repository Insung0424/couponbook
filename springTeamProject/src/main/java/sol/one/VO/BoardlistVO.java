package sol.one.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardlistVO {
	
	private int product_id;
	
	private Long user_id;
	
	private Date board_write_time;
	
	private int pd_discount;
	
	private String pd_date;
	
	private int category_id; 
	
	private String pd_name; 
	
	private String pd_price; 
	
	private String pd_price0;
	
	private int pd_status; 
	
	private String pd_img; 
}
