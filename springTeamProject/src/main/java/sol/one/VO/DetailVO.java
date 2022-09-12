package sol.one.VO;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class DetailVO {

	private int board_no;
	private int product_id;
	private int user_id;
	private String board_title;
	private String board_content;
	private Date board_write_time;
//	private Date bod_updated;
	private int pd_discount;

	//--------------------
	private int category_id; 
	
	private String company_name; 
	
	private String pd_name; 
	
	private String pd_price; 
	
	private int pd_status; 
	
	private String pd_img; 
	
	private String pd_desc; 
	
	private int location_id; 
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date pd_date; 
	
}
