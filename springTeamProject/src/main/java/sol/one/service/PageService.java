package sol.one.service;

import java.util.List;

import sol.one.VO.Page;
import sol.one.VO.PageVO;

public interface PageService {
	
	int submit(PageVO pv);
	
	PageVO get(int board_no);
	
	int modify(PageVO pv);
	
	int del(int board_no);
	
	List<PageVO> getList();
	
	List<PageVO> getPage(Page p);
	
	int getTotal(Page cri);

}
