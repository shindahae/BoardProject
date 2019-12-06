package sist.com.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import sist.com.dao.BoardDao;
import sist.com.vo.PostVO;

@Component
public class PagingProcess {

	@Resource(name = "boardDao")
	private BoardDao dao;
	private StringBuffer sb = new StringBuffer();

	public List<PostVO> pagingAction(Model model, HashMap<String, Object> map, HttpServletRequest request) {
		map = new HashMap<String, Object>();
		List<PostVO> list = null;
		int totalRow = dao.getTotalRowPost();
		int pageScale = 6;
		int totalPage = (totalRow % pageScale) == 0 ? (totalRow / pageScale) : (totalRow / pageScale) + 1;
		if (totalRow == 0)
			totalPage = 1;
		int currentPage = 1;
		String temp = "1";
		temp = request.getParameter("page") == null ? "1" : request.getParameter("page");
		currentPage = Integer.parseInt(temp);

		int start = 1 + (currentPage - 1) * pageScale;
		int end = pageScale + (currentPage - 1) * pageScale;
		int currentBlock = currentPage % pageScale == 0 ? (currentPage / pageScale) : (currentPage / pageScale) + 1;
		int startPage = 1 + (currentBlock - 1) * pageScale;
		int endPage = pageScale + (currentBlock - 1) * pageScale;
		if (totalPage <= endPage)
			endPage = totalPage;
		map.put("start", start);
		map.put("end", end);
		list = dao.mainList(map);
		sb.delete(0, sb.length());
		//처음페이지
		sb.append(
				"<img src=\"image/angle-pointing-to-first.png\" alt=\"처음페이지\" onclick=\"ajaxList('/web/mainList.do?page=1','json')\"/>");
		////////////////////////////////////////////////////////////////////////////////////////
		if (currentPage > 1) {
			sb.append("<img src=\"image/angle-pointing-to-left.png\" alt=\"이전\" onclick=\"ajaxList('/web/mainList.do?page="
					+ (currentPage - 1) + "','json')\"/>");
		} else {
			/*sb.append("<img src=\"image/angle-pointing-to-left.png\" alt=\"이전\" onclick=\"ajaxList('/web/mainList.do?page="
					+ (startPage - 1) + "','json')\"/>");*/
		}
		sb.append("<span>");
		// for
		for (int i = startPage; i <= endPage; i++) {
			//현재 페이지는 아이콘 변경
			if (i == currentPage) { 
				sb.append("<img src=\"image/page_number_"+i+".png\" style=\"width: 25px; cursor:pointer; \" alt=\"\" onclick=\"ajaxList('/web/mainList.do?page="+i+"','json')\">");
			} else {
				sb.append("<img src=\"image/page_number_"+i+".png\" style=\"width: 25px; cursor:pointer; \" alt=\"\" onclick=\"ajaxList('/web/mainList.do?page="+i+"','json')\">");
			}
		}
		// for
		sb.append("</span>");
		if (currentPage < totalPage) {
			sb.append("<img src=\"image/angle-pointing-to-right.png\" alt=\"다음\" onclick=\"ajaxList('/web/mainList.do?page="
					+ (currentPage + 1) + "','json')\"/>");
			/*sb.append("<img src=\"image/angle-pointing-to-right.png\" alt=\"다음\" onclick=\"ajaxList('/web/mainList.do?page="
					+ (endPage + 1) + "','json')\"/>");*/
		} else {
			/*sb.append("<img src=\"image/angle-pointing-to-right.png\" alt=\"다음\" onclick=\"ajaxList('/web/mainList.do?page="
					+ (currentPage + 1) + "','json')\"/>");*/
		}
		////////////////////////////////////////////////////////////////////////////////////////
		//마지막페이지
		sb.append("<img src=\"image/angle-pointing-to-last.png\" alt=\"마지막페이지\" onclick=\"ajaxList('/web/mainList.do?page="
				+ totalPage + "','json')\"/>");
		model.addAttribute("page", sb.toString());
		return list;
	}

}
