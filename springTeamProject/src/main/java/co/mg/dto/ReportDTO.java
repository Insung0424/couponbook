package co.mg.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportDTO {

		private int user_id;
		private int re_title;
		private String re_content;
		private Date re_time;
}