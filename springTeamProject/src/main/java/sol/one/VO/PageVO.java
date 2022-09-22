package sol.one.VO;

import java.util.Date;

import lombok.Data;

@Data
public class PageVO {
	
	private int board_no;
	private int product_id;
	private Long user_id;
	private String board_title;
	private String board_content;
	private Date board_write_time;
	private int pd_discount;
	private Date pd_date;

}
