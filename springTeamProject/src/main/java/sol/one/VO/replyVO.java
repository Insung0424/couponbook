package sol.one.VO;

import java.util.Date;

import lombok.Data;

@Data
public class replyVO {

	private int product_id;
	private int user_id;
	private String com_content;
	private Date com_write_time;
	
}
