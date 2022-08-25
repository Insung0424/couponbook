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
	
	//���������� �� ���� ��ȸ�ϱ�
	public List<UserDTO> list_user_mypage(int user_id) throws Exception;
	//���������� �� ���� �����ϱ�
	public void update_info_mypage(UserDTO user) throws Exception;
	//���������� �� ���ɻ�ǰ ��ȸ�ϱ�
	public List<LikeDTO> list_like_mypage(int user_id) throws Exception;
	//���������� �� �ŷ����� ��ȸ�ϱ�
	public List<TradeDTO> list_trade_mypage(int user_id) throws Exception;
	//���������� �� �Խñ� ��ȸ�ϱ�
	public List<BoardDTO> list_board_mypage(int user_id) throws Exception;
	//���������� �� ��� ��ȸ�ϱ�
	public List<CommentDTO> list_comment_mypage(int user_id)throws Exception;
	//���������� �� �Ű� ��ȸ�ϱ�
	public List<ReportDTO> list_report_mypage(int user_id)throws Exception;
	//���������� �� ���� ���� �� ������ ���� ��й�ȣ üũ
	public int check_password_mypage(UserDTO user)throws Exception;
}
