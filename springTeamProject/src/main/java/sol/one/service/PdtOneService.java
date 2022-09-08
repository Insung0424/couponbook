package sol.one.service;

import java.util.List;

import sol.one.VO.ProductVO;

public interface PdtOneService {
	
	/**
	 * 상품 전체목록 가져오기 - 테스트메인 에서 사용할 용도(임시)
	 * @param pdtVO
	 * @return List<ProductVO>
	 */
	List<ProductVO> getPdtList();

	/**
	 * 상품(쿠폰) 1건 상세조회 - 상품 id로 조회
	 * @param pdtId
	 * @return ProductVO
	 */
	ProductVO getOnePdt(String pdtId);
	
	

}
