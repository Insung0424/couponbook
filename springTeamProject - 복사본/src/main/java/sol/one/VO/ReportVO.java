package sol.one.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportVO {

		private int user_id;
		private int re_title;
		private String re_content;
		private Date re_time;
}