package sist.com.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import sist.com.dao.BoardDao;
import sist.com.vo.MemberVO;
import sist.com.vo.PostVO;
import sist.com.vo.ReplyDTO;
import sist.com.vo.ReplyVO;

@RestController
@SessionAttributes(value = { "mypageInfo", "mypageList", "postDetail", "myDetail","myReply", "page" })
public class BoardController {
	@Resource(name = "boardDao")
	private BoardDao dao;
	@Inject
	private PagingProcess paging;

	// 메인 게시물 목록
	@RequestMapping(value = "mainList.do")
	public List<PostVO> mainList(Model model, HttpServletRequest request) {
		List<PostVO> list = new ArrayList<PostVO>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		list = paging.pagingAction(model, map, request);
		return list;
	}

	// 메인 화면에서 게시물 상세로 갈 때
	@RequestMapping(value = "maindetail.do", method = RequestMethod.GET)
	public void maindetail(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value = "postno", required = false, defaultValue = "0") int postno) throws IOException {

		/*
		 * if (request.getSession().getAttribute("loginInfo") != null) {
		 * 
		 * 로그인 세션이 있으면 좋아요 여부 확인
		 * 
		 * 
		 * } else {
		 * 
		 * 로그인 세션이 없으면 null
		 * 
		 * response.sendRedirect("view/login.jsp"); }
		 */
		model.addAttribute("postDetail", dao.maindetail(postno));
		response.sendRedirect("view/detail.jsp");
	}

	// 메인 게시물 목록
	@RequestMapping(value = "category_click.do")
	public List<PostVO> category_click(@RequestParam(value = "category", required = false) String category, Model model,
			HttpServletRequest request) {
		List<PostVO> list = new ArrayList<PostVO>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (category.equals("All")) {
			list = paging.pagingAction(model, map, request);
		} else {
			map.put("category", category);
			list = dao.categoryList(map);
		}
		return list;
	}

	// 회원 등록
	@RequestMapping(value = "memberAdd.do", method = RequestMethod.POST)
	public void memberAdd(MemberVO member, HttpServletResponse response,
			@RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
		String memberemail = member.getEmail();
		File f = new File("C:\\Users\\shindahae\\git\\insta\\mySpring2\\src\\main\\webapp\\view\\upload\\" + memberemail
				+ file.getOriginalFilename());
		file.transferTo(f);
		member.setImage(f.getName());
		dao.memberAdd(member);
		response.sendRedirect("view/login.jsp");
	}

	// 로그아웃 아이콘 클릭 시
	@RequestMapping(value = "logout.do", method = RequestMethod.POST)
	public void logouticon_click(HttpServletRequest request, HttpServletResponse response, Model model)
			throws IOException {
		request.getSession().removeAttribute("loginInfo");
	}

	// 마이페이지 클릭 시 세션 확인
	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
	public void mypage(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		if (request.getSession().getAttribute("loginInfo") != null) {
			model.addAttribute("mypageInfo", dao.selectMypage((String) request.getSession().getAttribute("loginInfo")));
			model.addAttribute("mypageList", dao.mypageList((String) request.getSession().getAttribute("loginInfo")));
			response.sendRedirect("view/mypage.jsp");
		} else {
			response.sendRedirect("view/login.jsp");
		}
	}

	// 로그인 체크
	@RequestMapping(value = "memberLogin.do", method = RequestMethod.POST)
	public void memberLogin(@RequestParam(value = "email", required = false, defaultValue = "empty") String email,
			String password, HttpServletResponse response, HttpServletRequest request) throws IOException {
		if (password.equals(dao.memberLogin(email))) {
			request.getSession().setAttribute("loginInfo", email);
			response.sendRedirect("view/main.jsp");
		} else {
			response.sendRedirect("view/login.jsp");
		}
	}

	// 게시물 등록 시 세션 확인
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public void write(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (request.getSession().getAttribute("loginInfo") != null) {
			response.sendRedirect("view/insert.jsp");
		} else {
			response.sendRedirect("view/login.jsp");
		}
	}

	// 게시물 등록
	@RequestMapping(value = "postadd.do", method = RequestMethod.POST)
	public void postadd(PostVO post, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time = dateFormat.format(cal.getTime());

		File f = new File("C:\\Users\\shindahae\\git\\insta\\mySpring2\\src\\main\\webapp\\view\\upload\\" + time
				+ file.getOriginalFilename());
		file.transferTo(f);
		post.setImage(f.getName());
		post.setEmail((String) request.getSession().getAttribute("loginInfo"));
		dao.postAdd(post);
		response.sendRedirect("/web/mypage.do");
	}

	// 마이페이지에서 게시물 상세 페이지로 갈 때
	@RequestMapping(value = "mydetail.do", method = RequestMethod.GET)
	public void mydetail(HttpServletResponse response,
			@RequestParam(value = "postno", required = false, defaultValue = "0") int postno, Model model)
			throws IOException {
		model.addAttribute("myDetail", dao.mydetail(postno));
		model.addAttribute("myReply", dao.replyList(postno));
		response.sendRedirect("view/mydetail.jsp");
	}

	// 마이페이지에서 게시물 삭제
	@RequestMapping(value = "mydetaildelete.do", method = RequestMethod.POST)
	public void mydetaildelete(HttpServletResponse response,
			@RequestParam(value = "postno", required = false, defaultValue = "0") int postno,
			@RequestParam(value = "email", required = false, defaultValue = "null") String email) throws IOException {
		dao.mydetaildelete(postno, email);
		response.sendRedirect("/web/mypage.do");
	}

	// 수정할 게시물 정보
	@RequestMapping(value = "detailmodify.do")
	public PostVO detailmodify(@RequestParam(value = "postno", required = false, defaultValue = "0") int postno) {
		return dao.detailmodify(postno);
	}

	// 수정할 게시물의 업데이트 내용
	@RequestMapping(value = "modifysuccess.do")
	public void modifysuccess(@RequestParam(value = "postno", required = false, defaultValue = "0") int postno,
			@RequestParam(value = "category", required = false, defaultValue = "null") String category,
			@RequestParam(value = "contents", required = false, defaultValue = "null") String contents,
			@RequestParam(value = "filename", required = false, defaultValue = "null") String filename,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletResponse response)
			throws IOException {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time = dateFormat.format(cal.getTime());
		File f = new File("C:\\Users\\shindahae\\git\\insta\\mySpring2\\src\\main\\webapp\\view\\upload\\" + time
				+ file.getOriginalFilename());
		file.transferTo(f);
		HashMap<String, Object> map = new HashMap<>();
		map.put("postno", postno);
		map.put("category", category);
		map.put("contents", contents);
		map.put("image", (file.getOriginalFilename()).equals("") ? filename : f.getName());
		dao.modifysuccess(map);
		response.sendRedirect("/web/mydetail.do?postno=" + postno);
	}

	// ajax 세션 확인(좋아요, 댓글)
	@RequestMapping(value = "like_click.do", method = RequestMethod.POST)
	public int like_click(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (request.getSession().getAttribute("loginInfo") != null) {
			return 1;
		} else {
			return -1;
		}
	}

	// 상세 페이지에서 해당 게시물 댓글 검색
	@RequestMapping(value = "replyList.do", method = RequestMethod.POST)
	public List<ReplyDTO> replyList(HttpServletRequest request,
			@RequestParam(value = "postno", defaultValue = "0", required = false) int postno) {
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		list = dao.replyList(postno);
		return list;
	}

	// 댓글 등록
	@RequestMapping(value = "reply_send.do", method = RequestMethod.GET)
	public void reply_insert(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value = "replycontents", defaultValue = "0", required = false) String replycontents,
			@RequestParam(value = "postno", defaultValue = "0", required = false) int postno) throws IOException {
		ReplyVO reply = new ReplyVO();
		reply.setPostno(postno);
		reply.setEmail((String) request.getSession().getAttribute("loginInfo"));
		reply.setContents(replycontents);
		dao.reply_insert(reply);
		model.addAttribute("postDetail", dao.maindetail(postno));
		response.sendRedirect("view/detail.jsp");
	}

}
