package sol.one.VO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {

	//페이지 번호, 데이터 수
  private int pageNum;
  private int amount;
  
  //검색종류, 검색어
  private String type;
  private String keyword;
  
  private String sdate;
  private String edate;

  public Criteria() {
    this(1, 10);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
  
  public String[] getTypeArr() {
    
    return type == null? new String[] {}: type.split("");
  }
}
