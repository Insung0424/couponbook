package sol.one.VO;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommentVO {

	private int product_id;
	
	private int user_id;
	
	private String comment_content;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date comment_write_time;
	
	private int comment_no;
	
	private int comment_no_level;
	
	private int group_no;
	
}
