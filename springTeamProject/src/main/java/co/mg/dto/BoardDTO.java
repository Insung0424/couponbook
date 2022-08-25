package co.mg.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardDTO {

	private int board_NO;
	private int product_id;
	private int user_id;
	private String board_content;
	private Date board_created;
//	private Date bod_updated;
	private int pd_discount;
	private Date pd_date;
	private String board_title;
	

}