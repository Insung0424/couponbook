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
	
	public Page(int p, int a) {
		super();
		pNum = p;
		amount = a;
	}
	
	public Page() {
		this(1,5);
	}
	
	public String[] getTypeArr() {
		return type == null?new String[] {}:type.split("");
	}

}
