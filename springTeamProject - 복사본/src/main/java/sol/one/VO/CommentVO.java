package sol.one.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentVO {

	private int product_id;
	private int user_id;
	private String comment_content;
	private Date comment_write_time;
	private int comment_no;
}