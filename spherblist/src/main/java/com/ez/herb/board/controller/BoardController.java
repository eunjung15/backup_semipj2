package com.ez.herb.board.controller;

import java.util.List;

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

import com.ez.herb.board.model.BoardService;
import com.ez.herb.board.model.BoardVO;
import com.ez.herb.common.ConstUtil;
import com.ez.herb.common.PaginationInfo;
import com.ez.herb.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	private final BoardService boardService;

	@GetMapping("/write")
	public String write_get() {
		logger.info("글쓰기 화면 보여주기");

		return "board/write";

		//http://localhost:9091/herb/board/write
	}

	@PostMapping("/write")
	public String write_post(@ModelAttribute BoardVO vo) {
		//1
		logger.info("글쓰기 처리, 파라미터 vo={}", vo);

		//2
		int cnt=boardService.insertBoard(vo);
		logger.info("글쓰기 결과, cnt={}", cnt);

		//3		
		//4
		return "redirect:/board/list";
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

		List<BoardVO> list=boardService.selectAll(searchVo);
		logger.info("글 목록 전체 조회결과, list.size={}", list.size());

		int totalRecord=boardService.getTotalRecord(searchVo);
		logger.info("글 목록 전체 조회 - totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		//4
		return "board/list";
	}

	@RequestMapping("/countUpdate")
	public String countUpdate(@RequestParam(defaultValue = "0") int no, Model model) {
		//1		
		logger.info("조회수 증가, 파라미터 no={}",no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url!");
			model.addAttribute("url", "/board/list");

			return "common/message";
		}

		//2
		int cnt=boardService.updateReadCount(no);
		logger.info("조회수 증가 결과, cnt={}", cnt);

		//3		
		//4
		return "redirect:/board/detail?no="+no;
	}

	@RequestMapping("/detail")
	public String detail(@RequestParam(defaultValue = "0") int no, ModelMap model) {
		//1
		logger.info("글 상세보기 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url!");
			model.addAttribute("url", "/board/list");

			return "common/message";
		}

		//2
		BoardVO vo=boardService.selectByNo(no);
		logger.info("글 상세보기 결과 vo={}", vo);

		//3
		model.addAttribute("vo", vo);

		//4
		return "board/detail";
	}

	@GetMapping("/edit")
	public String edit_get(@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("글 수정 페이지, 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 URL입니다.");
			model.addAttribute("url", "/board/list");

			return "common/message";
		}

		//2
		BoardVO vo = boardService.selectByNo(no);
		logger.info("글 번호로 조회 결과, vo={}", vo);

		//3
		model.addAttribute("vo", vo);

		//4
		return "board/write";
	}

	@PostMapping("/edit")
	public String edit_post(@ModelAttribute BoardVO vo, Model model) {
		//1
		logger.info("글 수정, 파라미터 vo={}", vo);

		//2
		String msg = "글 수정 실패!", url = "/board/edit?no=" + vo.getNo();
		if(boardService.checkPwd(vo.getNo(), vo.getPwd())) {
			int cnt = boardService.updateBoard(vo);
			if(cnt>0) {
				msg = "글 수정 성공!";
				url = "/board/detail?no=" + vo.getNo();
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
			model.addAttribute("url", "/board/list");

			return "common/message";
		};

		//2		
		//3		
		//4
		return "board/delete";
	}

	@PostMapping("/delete")
	public String delete_post(@ModelAttribute BoardVO vo, Model model) {
		logger.info("삭제 처리, vo={}",vo);

		String url="/board/delete?no="+vo.getNo(),msg="삭제 실패!";
		if(boardService.checkPwd(vo.getNo(), vo.getPwd())) {
			int cnt=boardService.deleteBoard(vo.getNo());
			logger.info("삭제 처리 결과, cnt={}",cnt);

			if(cnt>0) {
				msg="삭제 성공!";
				url="/board/list";
			}
		}else {
			msg="비밀번호가 틀렸습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
}

















