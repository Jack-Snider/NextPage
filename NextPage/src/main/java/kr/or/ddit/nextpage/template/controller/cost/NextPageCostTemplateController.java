package kr.or.ddit.nextpage.template.controller.cost;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.nextpage.template.service.nextpageTemplateService;
import kr.or.ddit.school.manager.service.SchoolServiceImpl;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SchoolVO;
import kr.or.ddit.vo.SearchVO;
import kr.or.ddit.vo.genTemplateVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("nextpage/template")
public class NextPageCostTemplateController {

	@Inject
	public nextpageTemplateService service;
	
	@Inject
	public SchoolServiceImpl schService;
	
	@RequestMapping(value = "/cost.do", method = RequestMethod.GET )
	public String nextPageCostTemplate(
			HttpSession session ,
			@RequestParam (name="page", required=true, defaultValue="1") int currentPage,
			Model model,
			Model schInfo
			) {
		
		String schId = (String) session.getAttribute("authSch");
		String viewName = null;
		String message = null;
		
		PagingVO<genTemplateVO> pagingvo = new PagingVO<>(6,3);
		pagingvo.setCurrentPage(currentPage);
		
		List<genTemplateVO> templateList = service.selectCostTemplateList(pagingvo);
		
		pagingvo.setDataList(templateList);
		
//		SchoolVO schvo = schService.retrieveSchoolInfo(schId);
		
		if (templateList != null && !templateList.isEmpty()) {
			viewName = "nextpage/template/15_nextPageCostTemplate/nextPageCostTemplate";
			model.addAttribute("pagingvo", pagingvo);
//			schInfo.addAttribute("schInfo", schvo);
		}else {
			viewName ="nextpage/template/15_nextPageCostTemplate/nextPageCostTemplate";
			message = "???????????? ????????????!!??????";
			model.addAttribute("message", message);
		}
		
		return viewName;
		
	}
	
	// ????????? ??????
	@PostMapping(value = "/cartInsert",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String cartInsert(@RequestParam String prodId, HttpSession session) {
		String message = "";
		
		String schId = (String) session.getAttribute("authSch");
		log.info("????????? ??? ??????????"+schId);
		
		
		message = prodId;
		if(schId ==null || schId.equals(""))  {
			message = "????????? ??? ??????????????????";
		}else {
			SchoolVO schvo = schService.retrieveSchoolInfo(schId);
			String buyStat = schvo.getFstPchStat();
			
			if(buyStat != null && buyStat.equals("YES")){
				CartVO vo = new CartVO();
				vo.setProdId(prodId);
				vo.setSchId(schId);
				
				ServiceResult result = service.cartInsert(vo);
				switch (result) {
				case OK:
					message = "??????????????? ?????? ???????????????";
					break;
				default:
					message = "?????? ??????. ?????? ??????????????????";
					break;
				}
			}else {
				message = "????????? ?????? ??? ????????? ???????????????.";
			}
		}
		return message;
	}
	
}