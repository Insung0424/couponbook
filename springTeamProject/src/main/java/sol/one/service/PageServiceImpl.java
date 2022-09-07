package sol.one.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.Page;
import sol.one.VO.PageVO;
import sol.one.mapper.PageMapper;

@Service
@Log4j
@RequiredArgsConstructor
public class PageServiceImpl implements PageService{
	
	private final PageMapper m;
	
	@Override
	public int submit(PageVO pv) {
		m.inkey(pv);
		return pv.getBoard_no();
	}

	@Override
	public PageVO get(int board_no) {
		return m.sel(board_no);
	}

	@Override
	public int modify(PageVO pv) {
		return m.up(pv);
	}

	@Override
	public int del(int board_no) {
		return m.del(board_no);
	}

	@Override
	public List<PageVO> getList() {
		return m.getList();
	}

	@Override
	public List<PageVO> getPage(Page p) {
		return m.getPage(p);
	}

	@Override
	public int getTotal(Page p) {
		return m.getCount(p);
	}

}
