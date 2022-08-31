package sol.one.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentVO {

	private int product_id;
	private int user_id;
	private String com_content;
	private Date com_created;
	private int comment_no;
}