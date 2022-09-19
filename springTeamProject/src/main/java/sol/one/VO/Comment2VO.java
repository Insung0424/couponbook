package sol.one.VO;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Comment2VO {
	
	@NotEmpty
	private String email;
	
	@NotEmpty
	private String nickname;
	
	@NotEmpty
	@Size(min=4, max=10)
	private String password;
	
	private String user_name;
	private String phone;
	private String addr;
	private Long user_grade;
	private String zip_no;
	private String addr2;

	private int product_id;
	
	private Long user_id;
	
	private String comment_content;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date comment_write_time;
	
	private int comment_no;
	
	private int comment_no_level;
	
	private int group_no;
	
	
	
	
}
