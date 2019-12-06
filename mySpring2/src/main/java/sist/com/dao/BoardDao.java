package sist.com.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.com.vo.MemberVO;
import sist.com.vo.MyDetailDTO;
import sist.com.vo.PostDetailDTO;
import sist.com.vo.PostVO;
import sist.com.vo.ReplyDTO;
import sist.com.vo.ReplyVO;

@Repository(value = "boardDao")
public class BoardDao extends SqlSessionDaoSupport {

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	//�Խù� �� ���� ���ϱ�
	public int getTotalRowPost(){
		return this.getSqlSession().selectOne("getTotalRowPost");
	}
	
	// ���� ȭ�� �Խù� ���
	public List<PostVO> mainList(HashMap<String, Object> map) {
		return getSqlSession().selectList("mainList", map);
	}

	// ���� ȭ�鿡�� �Խù� ��
	public PostDetailDTO maindetail(int postno) {
		return this.getSqlSession().selectOne("maindetail", postno);
	}
	
	//ī�װ��� �Խù�
	public List<PostVO> categoryList(HashMap<String, Object> map){
		return getSqlSession().selectList("categoryList",map);
	}

	// ȸ�� ���
	public void memberAdd(MemberVO member) {
		this.getSqlSession().insert("memberadd", member);
	}

	// �α��� üũ
	public String memberLogin(String email) {
		return this.getSqlSession().selectOne("memberLogin", email);
	}

	// ����������
	public MemberVO selectMypage(String email) {
		return this.getSqlSession().selectOne("selectMypage", email);
	}

	// �Խù� ���
	public void postAdd(PostVO post) {
		this.getSqlSession().insert("postadd", post);
		this.getSqlSession().update("memberinfoadd", post.getEmail());
	}

	// ���� ������ �Խù� ���
	public List<PostVO> mypageList(String email) {
		return this.getSqlSession().selectList("mypageList", email);
	}

	//���� ������ �Խù� ��
	public MyDetailDTO mydetail(int postno) {
		return this.getSqlSession().selectOne("mydetail", postno);
	}
	
	//�������������� �Խù� ����
	public void mydetaildelete(int postno, String email){
		this.getSqlSession().delete("mydetaildelete", postno);
		this.getSqlSession().update("memberinfodelete", email);
	}
	
	//������ �Խù� ���� 
	public PostVO detailmodify(int postno){
		return this.getSqlSession().selectOne("detailmodify", postno);
	}
	
	//������ �Խù��� ������Ʈ ����
	public void modifysuccess(HashMap<String, Object> map){
		this.getSqlSession().update("modifysuccess", map);
	}
	
	//�� ���������� �ش� �Խù� ��� �˻�
	public List<ReplyDTO> replyList(int postno){
		return this.getSqlSession().selectList("replyList", postno);
	}
	
	//��� ���
	public void reply_insert(ReplyVO reply){
		this.getSqlSession().insert("replyinsert", reply);
	}
}
