package co.mg.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.mg.dto.BoardDTO;
import co.mg.dto.CommentDTO;
import co.mg.dto.LikeDTO;
import co.mg.dto.ReportDTO;
import co.mg.dto.TradeDTO;
import co.mg.dto.UserDTO;

@Service
public interface MypageService {
	
	//마이페이지 내 정보 조회하기
	public List<UserDTO> list_user_mypage(int user_id) throws Exception;
	//마이페이지 내 정보 수정하기
	public void update_info_mypage(UserDTO user) throws Exception;
	//마이페이지 내 관심상품 조회하기
	public List<LikeDTO> list_like_mypage(int user_id) throws Exception;
	//마이페이지 내 거래내역 조회하기
	public List<TradeDTO> list_trade_mypage(int user_id) throws Exception;
	//마이페이지 내 게시글 조회하기
	public List<BoardDTO> list_board_mypage(int user_id) throws Exception;
	//마이페이지 내 댓글 조회하기
	public List<CommentDTO> list_comment_mypage(int user_id)throws Exception;
	//마이페이지 내 신고 조회하기
	public List<ReportDTO> list_report_mypage(int user_id)throws Exception;
	//마이페이지 내 정보 수정 및 삭제를 위한 비밀번호 체크
	public int check_password_mypage(UserDTO user)throws Exception;
}
