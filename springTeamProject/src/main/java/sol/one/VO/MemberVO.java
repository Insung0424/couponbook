package sol.one.VO;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class MemberVO {
	
	private Long user_id;
	
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
	
}
