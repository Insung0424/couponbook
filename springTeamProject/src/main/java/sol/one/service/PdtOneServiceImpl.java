package sol.one.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.ProductVO;
import sol.one.mapper.PdtOneMapper;

@Service
@Log4j
@RequiredArgsConstructor
public class PdtOneServiceImpl implements PdtOneService {
	
	private final PdtOneMapper pdtMapper;
	
	@Override
	public List<ProductVO> getPdtList() {
		// 임시 테스트용 상품목록 가져오기
		log.info("pdtOneSerImpl --- ");
		return  pdtMapper.getPdtList();
	}

	@Override
	public ProductVO getOnePdt(String pdtId) {
		// 상품(쿠폰) 1건 상세조회 - 상품 id로 조회
		return pdtMapper.getOnePdt(pdtId);
	}

}
