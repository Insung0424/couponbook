package sol.one.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {

	private int board_no;
	private int product_id;
	private int user_id;
	private String board_title;
	private String board_content;
	private Date board_write_time;
//	private Date bod_updated;
	private int pd_discount;
	private String pd_date;

}