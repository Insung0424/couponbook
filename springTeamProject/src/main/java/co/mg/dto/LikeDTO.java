package co.mg.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class LikeDTO {
	private int user_id;
	private int product_id;
	private Date like_created;
}