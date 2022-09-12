package sol.one.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import sol.one.VO.BoardVO;
import sol.one.VO.CommentVO;
import sol.one.VO.LikeVO;
import sol.one.VO.MemberVO;
import sol.one.VO.ReportVO;
import sol.one.VO.T_tradeVO;


@Service
public interface MypageService {
	
	//�׽�Ʈ�� �α���
	public MemberVO login(MemberVO mem)throws Exception;
	
	//���������� �� ���� ��ȸ�ϱ� ****
	public MemberVO list_user_mypage(Long user_id) throws Exception;
	
	//���������� �� ���� �����ϱ�
	public void update_info_mypage(MemberVO mem) throws Exception;
	
	//ȸ�� Ż��
	public void delete_info_mypage(Long user_id)throws Exception;
	
	public void go_report(ReportVO report)throws Exception;
	
	//���������� �� ���ɻ�ǰ ��ȸ�ϱ�
	public List<LikeVO> list_like_mypage(Long user_id) throws Exception;
	
	//���������� �� �ŷ����� ��ȸ�ϱ�
	public List<T_tradeVO> list_trade_mypage(@Param("user_id")Long user_id) throws Exception;
	
	public List<BoardVO> list_board_mypage(Long user_id) throws Exception;
	
	//���������� �� ��� ��ȸ�ϱ�
	public List<CommentVO> list_comment_mypage(Long user_id)throws Exception;
	
	//���������� �� �Ű� ��ȸ�ϱ�
	public List<ReportVO> list_report_mypage(Long user_id)throws Exception;
	
	//���������� �� ���� ���� �� ������ ���� ��й�ȣ üũ
	public int check_password_mypage(MemberVO mem)throws Exception;
}
