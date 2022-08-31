package sol.one.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class LikeVO {
	private int user_id;
	private int product_id;
	private Date like_created;
}