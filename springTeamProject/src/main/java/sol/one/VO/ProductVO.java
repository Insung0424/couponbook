package sol.one.VO;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ProductVO {

	private int product_id; 
	
	private int category_id; 
	
	private String company_name; 
	
	private String pd_name; 
	
	private String pd_price; 
	
	private int pd_status; 
	
	private String pd_img; 
	
	private String pd_desc; 
	
	private int location_id; 
	
	private int pd_discount; 
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date pd_date; 
	
}
