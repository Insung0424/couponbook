package sol.one.VO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private int start, end;
	private boolean prev, next;
	
	
	private int total;
	private Page p;
	
	
	public PageDTO(Page p, int t) {
		this.p=p;
		total=t;
		                           
		                                                  
		this.end=(int)(Math.ceil(p.getPNum()/5.0))*5;  
		                                                  
		this.start=this.end-4;
		
		this.prev=this.start > 1;
		
		int eend=(int)(Math.ceil((total*1.0)/ p.getAmount()));
		
		
		this.end = eend <= end ? eend:end;
		
		this.next=this.end < eend;
		
	}
	

}
