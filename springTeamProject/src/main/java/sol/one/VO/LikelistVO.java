package sol.one.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class LikelistVO {
	
	int product_id;
	
	long user_id;
	
	Date like_time;	
	
	String pd_name;
	
	private String pd_img; 
	
	private String pd_price;
	
	private int pd_discount;
}
