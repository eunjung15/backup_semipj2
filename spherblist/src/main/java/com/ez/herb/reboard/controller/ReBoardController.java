package com.ez.herb.reboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ez.herb.common.ConstUtil;
import com.ez.herb.common.FileUploadUtil;
import com.ez.herb.common.PaginationInfo;
import com.ez.herb.common.SearchVO;
import com.ez.herb.common.Utility;
import com.ez.herb.reboard.model.ReBoardService;
import com.ez.herb.reboard.model.ReBoardVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/reBoard")
@RequiredArgsConstructor
public class ReBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ReBoardController.class);

	private final ReBoardService reBoardService;
	private final FileUploadUtil fileUploadUtil;

	@GetMapping("/write")
	public String write_get() {
		logger.info("글쓰기 화면 보여주기");

		return "reBoard/write";

		//http://localhost:9091/herb/reBoard/write
	}

	@PostMapping("/write")
	public String write_post(@ModelAttribute ReBoardVO vo, HttpServletRequest request) {
		//1
		logger.info("글쓰기 처리, 파라미터 vo={}", vo);

		//2
		try {
			List<Map<String, Object>> fileList
			=fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_FILE_FLAG);

			String fileName="", originalFileName="";
			long fileSize = 0;
			for(Map<String, Object> map : fileList) {
				fileName=(String) map.get("fileName");
				originalFileName=(String) map.get("originalFileName");
				fileSize= (long) map.get("fileSize");				
			}//for

			vo.setFileName(fileName);
			vo.setOriginalFileName(originalFileName);
			vo.setFileSize(fileSize);			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		int cnt=reBoardService.insertReBoard(vo);
		logger.info("글쓰기 결과, cnt={}", cnt);

		//3		
		//4
		return "redirect:/reBoard/list";
	}

	@RequestMapping("/list")
	public String list(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("글 목록 파라미터 searchVo={}", searchVo);

		//2
		//[1]PaginationInfo 객체 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		//[2]SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<ReBoardVO> list=reBoardService.selectAll(searchVo);
		logger.info("글 목록 전체 조회결과, list.size={}", list.size());

		int totalRecord=reBoardService.getTotalRecord(searchVo);
		logger.info("글 목록 전체 조회 - totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		//4
		return "reBoard/list";
	}

	@RequestMapping("/countUpdate")
	public String countUpdate(@RequestParam(defaultValue = "0") int no, Model model) {
		//1		
		logger.info("조회수 증가, 파라미터 no={}",no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url!");
			model.addAttribute("url", "/reBoard/list");

			return "common/message";
		}

		//2
		int cnt=reBoardService.updateReadCount(no);
		logger.info("조회수 증가 결과, cnt={}", cnt);

		//3		
		//4
		return "redirect:/reBoard/detail?no="+no;
	}

	@RequestMapping("/detail")
	public String detail(@RequestParam(defaultValue = "0") int no, ModelMap model) {
		//1
		logger.info("글 상세보기 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url!");
			model.addAttribute("url", "/reBoard/list");

			return "common/message";
		}

		//2
		ReBoardVO vo=reBoardService.selectByNo(no);
		logger.info("글 상세보기 결과 vo={}", vo);

		String fileInfo=Utility.getFileInfo(vo.getFileSize(), vo.getOriginalFileName());
		logger.info("첨부파일 이름 및 사이즈 변환 결과 fileInfo={}",fileInfo);

		//3
		model.addAttribute("vo", vo);
		model.addAttribute("fileInfo", fileInfo);

		//4
		return "reBoard/detail";
	}

	@GetMapping("/edit")
	public String edit_get(@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("글 수정 페이지, 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 URL입니다.");
			model.addAttribute("url", "/reBoard/list");

			return "common/message";
		}

		//2
		ReBoardVO vo = reBoardService.selectByNo(no);
		logger.info("글 번호로 조회 결과, vo={}", vo);

		String fileInfo=Utility.getFileInfo(vo.getFileSize(), vo.getOriginalFileName());
		logger.info("첨부파일 이름 및 사이즈 변환 결과 fileInfo={}",fileInfo);

		//3
		model.addAttribute("vo", vo);
		model.addAttribute("fileInfo", fileInfo);

		//4
		return "reBoard/write";
	}

	@PostMapping("/edit")
	public String edit_post(@ModelAttribute ReBoardVO vo, 
			@RequestParam String oldFileName, 
			HttpServletRequest request, Model model) {
		//1
		logger.info("글 수정, 파라미터 vo={}, oldFileName={}", vo, oldFileName);

		//
		String fileName = "", originalFileName = "";
		try {
			List<Map<String, Object>> fileList
			= fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_FILE_FLAG);

			long fileSize = 0;
			for(Map<String, Object> map : fileList) {
				fileName = (String) map.get("fileName");
				originalFileName = (String) map.get("originalFileName");
				fileSize = (long) map.get("fileSize");
			}

			vo.setFileName(fileName);
			vo.setOriginalFileName(originalFileName);
			vo.setFileSize(fileSize);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//2		
		String msg = "글 수정 실패!", url = "/reBoard/edit?no=" + vo.getNo();
		if(reBoardService.checkPwd(vo.getNo(), vo.getPwd())) {
			int cnt = reBoardService.updateReBoard(vo);
			if(cnt>0) {
				msg = "글 수정 성공!";
				url = "/reBoard/detail?no=" + vo.getNo();

				if(fileName!=null && !fileName.isEmpty()) { //
					if(oldFileName!=null && !oldFileName.isEmpty()) {//
						String upPath
						=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG);
						File file= new File(upPath,oldFileName);
						if(file.exists()) {
							boolean bool=file.delete();
							logger.info("글 수정- 파일삭제 여부:{}", bool);
						}
					}
				}//if
			}
		}else {
			msg = "비밀번호 불일치!";
		}

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}

	@GetMapping("/delete")
	public String delete_get(@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("삭제 화면, 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 URL입니다.");
			model.addAttribute("url", "/reBoard/list");

			return "common/message";
		};

		//2		
		//3		
		//4
		return "reBoard/delete";
	}

	@PostMapping("/delete")
	public String delete_post(@ModelAttribute ReBoardVO vo,
			@RequestParam String oldFileName, HttpServletRequest request, 
			Model model) {
		logger.info("삭제 처리, vo={}, oldFileName={}",vo, oldFileName);

		String url="/reBoard/delete?no="+vo.getNo()+"&oldFileName="+oldFileName,msg="삭제 실패!";
		if(reBoardService.checkPwd(vo.getNo(), vo.getPwd())) {
			ReBoardVO vo2 =reBoardService.selectByNo(vo.getNo());
			
			Map<String, String> map = new HashMap<>();
			map.put("no", vo.getNo()+"");			
			map.put("groupNo", vo2.getGroupNo()+"");
			map.put("step", vo2.getStep()+"");
			
			logger.info("삭제 처리 파라미터,  map={}",map);
			reBoardService.deleteReBoard(map);
			
			msg="삭제 성공!";
			url="/reBoard/list";

			if(oldFileName!=null && !oldFileName.isEmpty()) { //
				String upPath=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG);
				File file = new File(upPath,oldFileName);

				if(file.exists()) {
					boolean bool=file.delete();
					logger.info("파일 삭제 여부 : {}", bool);
				}
			}//if			
		}else {
			msg="비밀번호가 틀렸습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";		
	}
	
	@RequestMapping("/download")
	public ModelAndView download(@RequestParam(defaultValue = "0") int no, 
			@RequestParam String fileName, HttpServletRequest request) {
		//1
		logger.info("파일 다운로드 처리, 파라미터 no={}, fileName={}", no, fileName);

		//2
		int cnt=reBoardService.updateDowncount(no);
		logger.info("다운로드 수 증가, 결과 cnt={}", cnt);

		//3		
		//4
		//강제 다운로드 처리를 위한 뷰페이지로 보내준다

		Map<String, Object> map = new HashMap<>();
		//업로드 경로
		String upPath 
		= fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG);
		File file = new File(upPath, fileName);
		map.put("file", file);

		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("reBoardDownloadView", map);
		return mav;
	}
	
	@GetMapping("/reply")
	public String reply_get(@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("답변화면, 파라미터 no={}", no);
		
		//2
		ReBoardVO vo=reBoardService.selectByNo(no);
		logger.info("답변화면, 번호로 조회 결과 vo={}", vo);
		
		//3
		model.addAttribute("vo", vo);
		
		//4
		return "reBoard/reply";
	}
	
	@PostMapping("/reply")
	public String reply_post(@ModelAttribute ReBoardVO vo) {
		//1
		logger.info("답변하기, 파라미터 vo={}", vo);
		
		//2
		int cnt=reBoardService.reply(vo);
		logger.info("답변하기 결과, cnt={}", cnt);
		
		//3		
		//4
		return "redirect:/reBoard/list";
	}
	
}

















