package co.mg.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentDTO {

	private int product_id;
	private int user_id;
	private String com_content;
	private Date com_created;
}