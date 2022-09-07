package sol.one.mapper;

import java.util.List;
import java.util.Map;

import sol.one.VO.Page;
import sol.one.VO.PageVO;

public interface PageMapper {
	
	public List<PageVO> getList();
	
	public void insert(PageVO pv);
	
	public void inkey(PageVO pv);
	
	public PageVO sel(int board_no);
	
	public int del(int board_no);
	
	public int up(PageVO pv);
	
	public List<PageVO> getPage(Page p);
	
	public int getCount(Page p);
	
	public List<PageVO> search(Map<String, Map<String,String>> map);

}
