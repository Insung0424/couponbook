package sol.one.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class LikeVO {
	
	private int product_id;
	private Long user_id;
	private Date like_time;	
	private String pd_name;
	
}