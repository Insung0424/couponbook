package sol.one.VO;




import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProductVO {

	private int product_id; 
	
	private int category_id; 
	
	private String company_name; 
	
	private String pd_name; 
	
	private String pd_price; 
	
	private String pd_price0;
	
	private int pd_status; 
	
	private String pd_img; 
	
	private String pd_desc; 
	
	private int location_id; 
	
	private int pd_discount; 
	
	private String pd_date;
	private int pd_like;

	
	
}
