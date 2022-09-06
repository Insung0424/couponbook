package sol.one.mapper;

import java.util.List;

import sol.one.VO.BoardVO;
import sol.one.VO.CommentVO;
import sol.one.VO.LikeVO;
import sol.one.VO.ReportVO;
import sol.one.VO.TradeVO;
import sol.one.VO.UserVO;

public interface MypageMapper {
	
	//�׽�Ʈ�� �α���
	public UserVO login(UserVO user)throws Exception;
	
	// ���������� �� ���� ��ȸ�ϱ�
	public UserVO list_user_mypage(int user_id) throws Exception;

	// ���������� �� ���� �����ϱ�
	public void update_info_mypage(UserVO user) throws Exception;
	
	// ȸ�� Ż��
	public void delete_info_mypage(int user_id)throws Exception;
	
	public void go_report(ReportVO report)throws Exception;
	
	// ���������� �� ���ɻ�ǰ ��ȸ�ϱ�
	public List<LikeVO> list_like_mypage(int user_id) throws Exception;


	public List<TradeVO> list_trade_mypage(int user_id) throws Exception;


	public List<BoardVO> list_board_mypage(int user_id) throws Exception;

	// ���������� �� ��� ��ȸ�ϱ�
	public List<CommentVO> list_comment_mypage(int user_id) throws Exception;

	// ���������� �� �Ű� ��ȸ�ϱ�
	public List<ReportVO> list_report_mypage(int user_id) throws Exception;

	// ���������� �� ���� ���� �� ������ ���� ��й�ȣ üũ
	public int check_password_mypage(UserVO user) throws Exception;


	
}
