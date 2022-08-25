package co.mg.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import co.mg.Mapper.MypageMapper;
import co.mg.controller.MypageController;
import co.mg.dto.BoardDTO;
import co.mg.dto.CommentDTO;
import co.mg.dto.LikeDTO;
import co.mg.dto.ReportDTO;
import co.mg.dto.TradeDTO;
import co.mg.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {

	private static final Logger log = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	SqlSession session;
	
	private final MypageMapper mapper;

	@Override
	public void update_info_mypage(UserDTO user) throws Exception {
		log.info("update_info_mypage");
		mapper.update_info_mypage(user);

	}

	@Override
	public List<UserDTO> list_user_mypage(int user_id) throws Exception {
		log.info("list_user_mypage");
		return mapper.list_user_mypage(user_id);
	}

	@Override
	public List<LikeDTO> list_like_mypage(int user_id) throws Exception {
		log.info("list_like_mypage");
		return mapper.list_like_mypage(user_id);
	}

	@Override
	public List<TradeDTO> list_trade_mypage(int user_id) throws Exception {
		log.info("list_trade_mypage");
		return mapper.list_trade_mypage(user_id);
	}

	@Override
	public List<BoardDTO> list_board_mypage(int user_id) throws Exception {
		log.info("list_board_mypage");
		return mapper.list_board_mypage(user_id);
	}

	@Override
	public List<CommentDTO> list_comment_mypage(int user_id) throws Exception {
		log.info("list_comment_mypage");
		return mapper.list_comment_mypage(user_id);
	}

	@Override
	public List<ReportDTO> list_report_mypage(int user_id) throws Exception {
		log.info("list_report_mypage");
		return mapper.list_report_mypage(user_id);
	}

	@Override
	public int check_password_mypage(UserDTO user) throws Exception {
		log.info("check_password_mypage");
		int result=session.selectOne("check_password", user);
		
		return result;
		
	}
}
