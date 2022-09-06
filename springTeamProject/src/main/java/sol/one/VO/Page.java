package sol.one.VO;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Page {
	
	private int pNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public Page(int pNum, int amount) {
		super();
		this.pNum = pNum;
		this.amount = amount;
	}
	
	public Page() {
		this(1,10);
	}
	
	public String[] getTypeArr() {
		return type == null?new String[] {}:type.split("");
	}

}
