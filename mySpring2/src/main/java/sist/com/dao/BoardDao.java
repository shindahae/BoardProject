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

	//게시물 총 갯수 구하기
	public int getTotalRowPost(){
		return this.getSqlSession().selectOne("getTotalRowPost");
	}
	
	// 메인 화면 게시물 목록
	public List<PostVO> mainList(HashMap<String, Object> map) {
		return getSqlSession().selectList("mainList", map);
	}

	// 메인 화면에서 게시물 상세
	public PostDetailDTO maindetail(int postno) {
		return this.getSqlSession().selectOne("maindetail", postno);
	}
	
	//카테고리별 게시물
	public List<PostVO> categoryList(HashMap<String, Object> map){
		return getSqlSession().selectList("categoryList",map);
	}

	// 회원 등록
	public void memberAdd(MemberVO member) {
		this.getSqlSession().insert("memberadd", member);
	}

	// 로그인 체크
	public String memberLogin(String email) {
		return this.getSqlSession().selectOne("memberLogin", email);
	}

	// 마이페이지
	public MemberVO selectMypage(String email) {
		return this.getSqlSession().selectOne("selectMypage", email);
	}

	// 게시물 등록
	public void postAdd(PostVO post) {
		this.getSqlSession().insert("postadd", post);
		this.getSqlSession().update("memberinfoadd", post.getEmail());
	}

	// 마이 페이지 게시물 목록
	public List<PostVO> mypageList(String email) {
		return this.getSqlSession().selectList("mypageList", email);
	}

	//마이 페이지 게시물 상세
	public MyDetailDTO mydetail(int postno) {
		return this.getSqlSession().selectOne("mydetail", postno);
	}
	
	//마이페이지에서 게시물 삭제
	public void mydetaildelete(int postno, String email){
		this.getSqlSession().delete("mydetaildelete", postno);
		this.getSqlSession().update("memberinfodelete", email);
	}
	
	//수정할 게시물 정보 
	public PostVO detailmodify(int postno){
		return this.getSqlSession().selectOne("detailmodify", postno);
	}
	
	//수정할 게시물의 업데이트 내용
	public void modifysuccess(HashMap<String, Object> map){
		this.getSqlSession().update("modifysuccess", map);
	}
	
	//상세 페이지에서 해당 게시물 댓글 검색
	public List<ReplyDTO> replyList(int postno){
		return this.getSqlSession().selectList("replyList", postno);
	}
	
	//댓글 등록
	public void reply_insert(ReplyVO reply){
		this.getSqlSession().insert("replyinsert", reply);
	}
}
