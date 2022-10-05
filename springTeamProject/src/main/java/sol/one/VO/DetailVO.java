package sol.one.VO;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class DetailVO {

	private int board_no;
	private int product_id;

	private long user_id;
	private String board_title;
	private String board_content;
	private Date board_write_time;
	private int pd_discount;
	

	//--------------------
	private int category_id; 
	
	private String company_name; 
	
	private String pd_name; 
	
	private String pd_price; 
	
	private String pd_price0; 

	private int pd_status; 
	
	private String pd_img; 
	
	private String pd_desc; 
	
	private int location_id; 
	
	private String pd_date; 

	
	
}
