package com.jobrecipe.profile.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jobrecipe.advertisement.service.AdvertisementService;
import com.jobrecipe.advertisement.vo.AdvertisementVO;
import com.jobrecipe.profile.service.ProfileServiceImpl;
import com.jobrecipe.profile.vo.ActAwardVO;
import com.jobrecipe.profile.vo.CareerVO;
import com.jobrecipe.profile.vo.CertiOtherVO;
import com.jobrecipe.profile.vo.EducationVO;
import com.jobrecipe.profile.vo.PortfolioVO;
import com.jobrecipe.profile.vo.ProfileVO;
import com.jobrecipe.profile.vo.ResumeVO;
import com.jobrecipe.review.service.ReviewServiceimpl;
import com.jobrecipe.review.vo.ReviewVO;
import com.jobrecipe.user.service.UserServiceImpl;
import com.jobrecipe.user.vo.UserVO;

@Controller
public class ProfileController {

	@Resource(name = "ProfileService")
	private ProfileServiceImpl profileService;

	@Resource(name = "UserService")
	private UserServiceImpl userService;

	@Resource(name = "reviewService")
	private ReviewServiceimpl reviewService;
	
	@Resource(name="advertisementService")
	private AdvertisementService advertisementService;
	
	/*
	 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * 각 폴더를 원하는 위치에 만들고 PATH 둘 다 변경 해줘야 한다.
	 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 */
	
	//프로필 이미지 저장 경로
	private static final String IMG_UPLOAD_PATH = "C:\\Users\\geekh\\Desktop\\jrcp_workspace\\img_upload";
	//포트폴리오 저장 경로
	private static final String PORT_UPLOAD_PATH = "C:\\Users\\geekh\\Desktop\\jrcp_workspace\\portfolio_upload";
	
	/*
	 * 마이페이지 링크
	 */
	@RequestMapping(value = "settings.do")
	public String setting(UserVO vo1) {
		return "profile/newsletter";
	}
	
	/*
	 * 내 프로필 링크
	 */
	@RequestMapping(value = "resumes.do")
	public String resumes(HttpSession session, Model model) {
		UserVO loginInfo = (UserVO) session.getAttribute("login");
		int u_no = loginInfo.getU_no();
		ArrayList<ResumeVO> resumeVOList = profileService.getAllResumes(u_no);
		model.addAttribute("resumeVOList", resumeVOList);
		return "profile/resumes";
	}
	
	/* 
	 * 설문조사 페이지에서 다음을 누르면 팔로잉 기업 체크 페이지로 이동하며,
	 * rec_profile 테이블에 회원 기본 정보 저장
	 */
	@RequestMapping(value = "insertProfile.do")
	public String insertProfile(ProfileVO profileVO, Model model) {
		profileService.insertProfile(profileVO);
		return "redirect:/hire/Search_Job.do";
	}
	
	/*
	 * 이력서 클릭시 이력서를 볼 수 있음
	 */
	@RequestMapping(value = "/resumeForm.do")
	public String resumesForm(HttpSession session, Model model) {
		UserVO loginInfo = (UserVO) session.getAttribute("login");
		int u_no = loginInfo.getU_no();
		model.addAttribute("profileVO", profileService.getProfile(u_no));
		return "profile/resumeForm";
	}
	
	/*
	 * 새 이력서 작성시 (수정할 때는 service 부분 insert 아닌 update로 진행)
	 */
	@RequestMapping(value = "insertResume.do", method = RequestMethod.POST)
	public String insertResume(ProfileVO profileVO, EducationVO educationVO, CareerVO careerVO,
								ActAwardVO actAwardVO, CertiOtherVO certiOtherVO, PortfolioVO portfolioVO,
								ResumeVO resumeVO, HttpSession session) {
		UserVO loginInfo = (UserVO) session.getAttribute("login");
		int u_no = loginInfo.getU_no();
		
		//ProfileVO 처리
		if(profileVO.getPro_imgFile() != null) {
			String pro_imgPath = getSaveImgPath(profileVO.getPro_imgFile());
			if(pro_imgPath == null) {
				//에러 : 이미지 파일이 저장되지 않음 -> 에러 메시지 출력
				System.out.println("프로필 이미지 업로드 에러");
			} else {
				profileVO.setPro_imgPath(pro_imgPath);				
			}
		}
		profileService.updateProfile(profileVO);
		
		/* 
		 * 이후의 데이터들은 선택적 입력이므로 null 체크 후,
		 * 넘어온 데이터가 없는 경우 빈문자열과 0의 데이터를 DB에 저장한다.
		 */
		
		if(educationVO == null) {
			educationVO = new EducationVO(u_no, "", "", 0, "", "", "");
		} else {
			educationVO.setU_no(u_no);			
		}
		profileService.insertEducation(educationVO);
		
		if(careerVO == null) {
			careerVO = new CareerVO(u_no, "", "", 0, "", "", "", "", "");
		} else {
			careerVO.setU_no(u_no);			
		}
		profileService.insertCareer(careerVO);
		
		if(actAwardVO == null) {
			actAwardVO = new ActAwardVO(u_no, "", "", 0, "", "");
		} else {
			actAwardVO.setU_no(u_no);			
		}
		profileService.insertActAward(actAwardVO);
		
		if(certiOtherVO == null) {
			certiOtherVO = new CertiOtherVO(u_no, "", "");
		} else {
			certiOtherVO.setU_no(u_no);		
		}
		profileService.insertCertiOther(certiOtherVO);
		
		if(portfolioVO == null) {
			portfolioVO = new PortfolioVO(u_no, "");
		} else {
			portfolioVO.setU_no(u_no);
			String por_filepath = getSavePortPath(portfolioVO.getPor_file());
			if(por_filepath == null) {
				//에러 : 포트폴리오 파일이 저장되지 않음 -> 에러 메시지 출력
				System.out.println("포트폴리오 파일 업로드 에러");
			} else {
				portfolioVO.setPor_filepath(por_filepath);				
				profileService.insertPortfolio(portfolioVO);
			}
		}
		
		/*
		 * 각 데이터들을 DB에 저장한 후 취합된 정보인 resumeVO 정보를 DB에 저장한다.
		 */
		resumeVO.setU_no(u_no);
		resumeVO.setPro_no(profileVO.getPro_no());
		resumeVO.setE_no(educationVO.getE_no());
		resumeVO.setCar_no(careerVO.getCar_no());
		resumeVO.setAct_no(actAwardVO.getAct_no());
		resumeVO.setCer_no(certiOtherVO.getCer_no());
		resumeVO.setPor_no(portfolioVO.getPor_no());
		profileService.insertResume(resumeVO);
		return "redirect:/resumes.do";	
	}
	
	//프로필 이미지 저장 후 경로 반환
	private String getSaveImgPath(MultipartFile pro_imgFile) {
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + pro_imgFile.getOriginalFilename();
		File saveFile = new File(IMG_UPLOAD_PATH, saveName);
		try {
			pro_imgFile.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		String savePath = IMG_UPLOAD_PATH + "\\" + saveName;
		return savePath;
	}
	
	//포트폴리오 파일 저장 후 경로 반환
	private String getSavePortPath(MultipartFile por_file) {
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + por_file.getOriginalFilename();
		File saveFile = new File(PORT_UPLOAD_PATH, saveName);
		try {
			por_file.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		String savePath = PORT_UPLOAD_PATH + "\\" + saveName;
		return savePath;
	}
	
	@RequestMapping(value = "/updateResumeForm.do")
	public String updateResume(int res_no, Model model) {
		ResumeVO resumeVO = profileService.getResumeInfo(res_no);
		model.addAttribute("resumeVO", resumeVO);
		model.addAttribute("profileVO", profileService.getProfile(resumeVO.getU_no()));
		model.addAttribute("eduVOList", profileService.getEducation(resumeVO.getE_no()));
		model.addAttribute("carVOList", profileService.getCareer(resumeVO.getCar_no()));
		model.addAttribute("actAwardVOList", profileService.getActAward(resumeVO.getAct_no()));
		model.addAttribute("certiOtherVOList", profileService.getCertiOther(resumeVO.getCer_no()));
		model.addAttribute("portVOList", profileService.getPortfolio(resumeVO.getPor_no()));
		return "profile/updateResume";
	}
	
	@RequestMapping(value = "updateResume.do", method = RequestMethod.POST)
	public String updateResume(ProfileVO profileVO, EducationVO educationVO, CareerVO careerVO,
								ActAwardVO actAwardVO, CertiOtherVO certiOtherVO, PortfolioVO portfolioVO,
								ResumeVO resumeVO, HttpSession session) {
		UserVO loginInfo = (UserVO) session.getAttribute("login");
		int u_no = loginInfo.getU_no();
		
		//ProfileVO 처리
		if(profileVO.getPro_imgFile() != null) {
			String pro_imgPath = getSaveImgPath(profileVO.getPro_imgFile());
			if(pro_imgPath == null) {
				//에러 : 이미지 파일이 저장되지 않음 -> 에러 메시지 출력
				System.out.println("프로필 이미지 업로드 에러");
			} else {
				profileVO.setPro_imgPath(pro_imgPath);				
			}
		}
		profileService.updateProfile(profileVO);

		profileService.updateEducation(educationVO);
		profileService.updateCareer(careerVO);
		profileService.updateActAward(actAwardVO);
		profileService.updateCertiOther(certiOtherVO);

		String por_filepath = getSavePortPath(portfolioVO.getPor_file());
		if(por_filepath == null) {
			//에러 : 포트폴리오 파일이 저장되지 않음 -> 에러 메시지 출력
			System.out.println("포트폴리오 파일 업로드 에러");
		} else {
			portfolioVO.setPor_filepath(por_filepath);				
			profileService.updatePortfolio(portfolioVO);
		}
		
		profileService.updateResume(resumeVO);
		return "redirect:/resumes.do";	
	}
	
	@RequestMapping(value= "deleteResume.do")
	public String deleteResume(int res_no) {
		ResumeVO resumeVO = profileService.getResumeInfo(res_no);
		profileService.deleteEducation(resumeVO.getE_no());
		profileService.deleteCareer(resumeVO.getCar_no());
		profileService.deleteActAward(resumeVO.getAct_no());
		profileService.deleteCertiOther(resumeVO.getCer_no());
		profileService.deletePortfolio(resumeVO.getPor_no());
		profileService.deleteResume(res_no);
		return "redirect:/resumes.do";
	}
	

	@RequestMapping(value = "/apply.do", method = RequestMethod.GET)
	public String apply(int ad_no, HttpSession session, Model model) {
		UserVO loginInfo = (UserVO)session.getAttribute("login");
		int u_no = loginInfo.getU_no();
		ArrayList<ResumeVO> resumeVOList = profileService.getAllResumes(u_no);
		model.addAttribute("resumeVOList", resumeVOList);
		
		AdvertisementVO adVO = advertisementService.selectOne(ad_no);
		model.addAttribute("adVO", adVO);
		return "/profile/job_applicants";
	}

	//내가 쓴 전체 리뷰 확인
	@RequestMapping(value = "/reviews.do", method = RequestMethod.GET)
	public String review1(Model model, HttpSession session) throws Exception {
		UserVO loginInfo = (UserVO) session.getAttribute("login");
		int u_no1 = loginInfo.getU_no();
		ArrayList<ReviewVO> list = profileService.getAllReview(u_no1);
		int reviewCnt = profileService.getAllRevCount(u_no1);

		model.addAttribute("list", list);
		model.addAttribute("reviewCnt", reviewCnt);

		return "/profile/reviews";
	}

	// 마이페이지에서 이메일 수신 동의 페이지 이동
	@RequestMapping(value = "/newsletter.do", method = RequestMethod.GET)
	public String newsletter(UserVO vo, HttpSession session, HttpServletRequest request) throws Exception {
		return "/profile/newsletter";
	}

	// 마이페이지에서 이메일 수신 동의 로직 처리
	@RequestMapping(value = "/newsletter.do", method = RequestMethod.POST)
	public String newsletter1(UserVO vo, HttpSession session, HttpServletRequest request) throws Exception {
		String u_email = request.getParameter("u_email");
		int cnt = Integer.parseInt(request.getParameter("newsck"));

		UserVO user = new UserVO();
		user.setU_email(u_email);
		user.setU_newsLetter(cnt);

		profileService.newsCheck(user);

		return "/profile/newsletter";
	}

	// 마이페이지에서 비밀번호 변경 페이지 이동
	@RequestMapping(value = "/change_password.do", method = RequestMethod.GET)
	public String changePasswd(UserVO vo, HttpSession session, HttpServletRequest request) throws Exception {

		return "/profile/password";
	}

	// 마이페이지 비밀번호 변경 로직처리
	@RequestMapping(value = "/change_password.do", method = RequestMethod.POST)
	public String changePasswd1(String cur_pw, HttpSession session, HttpServletRequest request) throws Exception {
		UserVO loginInfo = (UserVO)session.getAttribute("login");
		
		String u_email = request.getParameter("u_email");
		String u_pw = request.getParameter("u_pw");

		UserVO user = new UserVO();
		user.setU_email(u_email);
		user.setU_pw(u_pw);


		if (cur_pw.equals(loginInfo.getU_pw())) {
			profileService.pass_change(user);
			return "/profile/newsletter";
		} else {
			return "/profile/password";
		}
	}

	// 리뷰 추가 페이지
	@RequestMapping(value = "/insertReviewForm.do")
	public String insertReviewForm() {
		return "/profile/InsertReviewForm";
	}

	// 리뷰 추가 페이지
	@RequestMapping(value = "/company1.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String company1(String rev_name) {

		String rev_name1 = profileService.searchc(rev_name);
		String msg;

		if (rev_name1 != null) {
			msg = rev_name1;
		} else {
			msg = "존재하지 않는 회사입니다.";
		}
		return msg;
	}
	
	//리뷰 수정 페이지 이동
    @RequestMapping(value="/updateReviewView.do", method = RequestMethod.GET)
    public String updateReview(ReviewVO vo1, Model model,int rev_no) {
    	ReviewVO reviewVO = profileService.getReview(rev_no);
    	model.addAttribute("reviewVO", reviewVO);
    	
    	return "profile/UpdateReviewForm";
    }
    
    //리뷰 수정폼 로직
    @RequestMapping(value="/updateReviewCon.do", method = RequestMethod.POST)
    public String updateReview1(ReviewVO vo1, Model model) {
    	profileService.updateReview(vo1);

    	return "redirect:/reviews.do";
    }
    
    
	//리뷰 삭제
    @RequestMapping(value="/deleteReview.do")
	public String deleteReview(int rev_no) {
    	
		profileService.deleteReview(rev_no);
		
		return "redirect:/reviews.do";
	}
    
    //해당 리뷰 가져오기
    @RequestMapping(value="/getReview.do", method = RequestMethod.GET)
    public String getReview5(int rev_no, Model model) {
    	
    	ReviewVO reviewVO = profileService.getReview(rev_no);    	
    	model.addAttribute("reviewVO", reviewVO);

		return "/profile/GetReview";
    	
    }

}
