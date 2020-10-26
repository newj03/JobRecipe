package com.jobrecipe.profile.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobrecipe.profile.service.dao.ProfileDAO;
import com.jobrecipe.profile.vo.ActAwardVO;
import com.jobrecipe.profile.vo.CareerVO;
import com.jobrecipe.profile.vo.CertiOtherVO;
import com.jobrecipe.profile.vo.EducationVO;
import com.jobrecipe.profile.vo.PortfolioVO;
import com.jobrecipe.profile.vo.ProfileVO;
import com.jobrecipe.profile.vo.ResumeVO;
import com.jobrecipe.review.vo.ReviewVO;
import com.jobrecipe.user.vo.UserVO;

@Service("ProfileService")
public class ProfileServiceImpl implements ProfileService{

	@Autowired
	private ProfileDAO profileDAO;
	
	@Override
	public void insertProfile(ProfileVO profileVO) {
		profileDAO.insertProfile(profileVO);
		System.out.println("insertProfile-service call");
	}
	
	@Override
	public ArrayList<ResumeVO> getAllResumes(int u_no) {
		System.out.println("getAllResumes-service call");
		return profileDAO.getAllResumes(u_no);
	}
	
	@Override
	public ProfileVO getProfile(int u_no) {
		System.out.println("getProfile-service call");
		return profileDAO.getProfile(u_no);
	}

	@Override
	public ArrayList<EducationVO> getEducation(int e_no) {
		System.out.println("getEducation-service call");
		return profileDAO.getEducation(e_no);
	}

	@Override
	public ArrayList<CareerVO> getCareer(int car_no) {
		System.out.println("getCareer-service call");
		return profileDAO.getCareer(car_no);
	}

	@Override
	public ArrayList<ActAwardVO> getActAward(int act_no) {
		System.out.println("getActAward-service call");
		return profileDAO.getActAward(act_no);
	}

	@Override
	public ArrayList<CertiOtherVO> getCertiOther(int cer_no) {
		System.out.println("getCertiOther-service call");
		return profileDAO.getCertiOther(cer_no);
	}

	@Override
	public ArrayList<PortfolioVO> getPortfolio(int por_no) {
		System.out.println("getPortfolio-service call");
		return profileDAO.getPortfolio(por_no);
	}
	
	@Override
	public void updateProfile(ProfileVO profileVO) {
		profileDAO.updateProfile(profileVO);
	}

	@Override
	public void insertEducation(EducationVO educationVO) {
		profileDAO.insertEducation(educationVO);
	}

	@Override
	public void insertCareer(CareerVO careerVO) {
		profileDAO.insertCareer(careerVO);
	}

	@Override
	public void insertActAward(ActAwardVO actAwardVO) {
		profileDAO.insertActAward(actAwardVO);
	}

	@Override
	public void insertCertiOther(CertiOtherVO certiOtherVO) {
		profileDAO.insertCertiOther(certiOtherVO);
	}

	@Override
	public void insertPortfolio(PortfolioVO portfolioVO) {
		profileDAO.insertPortfolio(portfolioVO);
	}

	@Override
	public void insertResume(ResumeVO resumeVO) {
		profileDAO.insertResume(resumeVO);
	}

	@Override
	public ResumeVO getResumeInfo(int res_no) {
		return profileDAO.getResumeInfo(res_no);
	}
	
	@Override
	public void updateEducation(EducationVO educationVO) {
		profileDAO.updateEducation(educationVO);	
	}

	@Override
	public void updateCareer(CareerVO careerVO) {
		profileDAO.updateCareer(careerVO);
	}

	@Override
	public void updateActAward(ActAwardVO actAwardVO) {
		profileDAO.updateActAward(actAwardVO);
	}

	@Override
	public void updateCertiOther(CertiOtherVO certiOtherVO) {
		profileDAO.updateCertiOther(certiOtherVO);
	}

	@Override
	public void updatePortfolio(PortfolioVO portfolioVO) {
		profileDAO.updatePortfolio(portfolioVO);
	}

	@Override
	public void updateResume(ResumeVO resumeVO) {
		profileDAO.updateResume(resumeVO);
	}

	@Override
	public void drafts(UserVO vo) throws Exception {
		profileDAO.drafts1(vo);
		
	}

	@Override
	public void job_applicants(UserVO vo) throws Exception {
		profileDAO.job_applicants1(vo);
	}
	
	@Override
	public void deleteEducation(int e_no) {
		profileDAO.deleteEducation(e_no);
	}

	@Override
	public void deleteCareer(int car_no) {
		profileDAO.deleteCareer(car_no);
	}

	@Override
	public void deleteActAward(int act_no) {
		profileDAO.deleteActAward(act_no);
	}

	@Override
	public void deleteCertiOther(int cer_no) {
		profileDAO.deleteCertiOther(cer_no);	
	}

	@Override
	public void deletePortfolio(int por_no) {
		profileDAO.deletePortfolio(por_no);
	}
	
	@Override
	public void deleteResume(int res_no) {
		profileDAO.deleteResume(res_no);
	}
	
	//이메일 수신체크
	@Override
	public void newsCheck(UserVO vo) throws Exception {
		profileDAO.newsCheck(vo);
	}
	
	//비밀번호 변경
	@Override
	public void pass_change(UserVO vo1) throws Exception {	
		profileDAO.pass_change(vo1);
	}
	
	//기업 검색
	public String searchc(String rev_name) {
		return profileDAO.searchc(rev_name);
	}
	
	//내가 쓴 전체 리뷰
	@Override
	public ArrayList<ReviewVO> getAllReview(int u_no) throws Exception {
		return profileDAO.getAllReview(u_no);
	}
	
	//내가 쓴 전체 리뷰 개수 확인
	@Override
	public int getAllRevCount(int u_no) throws Exception {
		return profileDAO.getAllRevCount(u_no);
	}
	
	//해당 리뷰 가져오기
	@Override
	public ReviewVO getReview(int rev_no) {
		return profileDAO.getReview(rev_no);
	}
	
	//리뷰 수정
	@Override
	public void updateReview(ReviewVO vo1) {
		profileDAO.updateReview(vo1);
	}
	
	//리뷰 삭제
	@Override
	public void deleteReview(int rev_no) {
		profileDAO.deleteReview(rev_no);
	}

}
