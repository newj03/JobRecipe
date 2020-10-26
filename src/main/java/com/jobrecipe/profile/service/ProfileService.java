package com.jobrecipe.profile.service;

import java.util.ArrayList;

import com.jobrecipe.profile.vo.ActAwardVO;
import com.jobrecipe.profile.vo.CareerVO;
import com.jobrecipe.profile.vo.CertiOtherVO;
import com.jobrecipe.profile.vo.EducationVO;
import com.jobrecipe.profile.vo.PortfolioVO;
import com.jobrecipe.profile.vo.ProfileVO;
import com.jobrecipe.profile.vo.ResumeVO;
import com.jobrecipe.review.vo.ReviewVO;
import com.jobrecipe.user.vo.UserVO;

public interface ProfileService {
	
	//회원가입시 프로필 등록
	public void insertProfile(ProfileVO profileVO);
	
	//작성한 모든 이력서의 정보를 가지고 옴
	public ArrayList<ResumeVO> getAllResumes(int u_no);
	
	//기존의 기본 정보를 가지고 옴
	public ProfileVO getProfile(int u_no);
	
	//기존의 학력 사항 정보를 가지고 옴
	public ArrayList<EducationVO> getEducation(int e_no);
	
	//기존의 경력 사항 정보를 가지고 옴
	public ArrayList<CareerVO> getCareer(int car_no);
	
	//기존의 활동 및 수상내역 정보를 가지고 온다.
	public ArrayList<ActAwardVO> getActAward(int act_no);
	
	//기존의 자격증 및 기타내역 정보를 가지고 온다.
	public ArrayList<CertiOtherVO> getCertiOther(int cer_no);
	
	//기존의 포트폴리오 정보를 가지고 온다.
	public ArrayList<PortfolioVO> getPortfolio(int por_no);
	
	//이력서에서 프로필 정보 수정시 업데이트 
	public void updateProfile(ProfileVO profileVO);
	
	//이력서 입력 : 학력사항
	public void insertEducation(EducationVO educationVO);
	
	//이력서 입력 : 경력사항
	public void insertCareer(CareerVO careerVO);
	
	//이력서 입력 : 활동 및 수상내역
	public void insertActAward(ActAwardVO actAwardVO);
	
	//이력서 입력 : 자격증 및 기타
	public void insertCertiOther(CertiOtherVO certiOtherVO);
	
	//이력서 입력 : 포트폴리오
	public void insertPortfolio(PortfolioVO portfolioVO);
	
	//이력서 취합 정보 입력
	public void insertResume(ResumeVO resumeVO);
	
	//이력서 수정 : 학력사항
	public void updateEducation(EducationVO educationVO);
	
	//이력서 수정 : 경력사항
	public void updateCareer(CareerVO careerVO);
	
	//이력서 수정 : 활동 및 수상내역
	public void updateActAward(ActAwardVO actAwardVO);
	
	//이력서 수정 : 자격증 및 기타
	public void updateCertiOther(CertiOtherVO certiOtherVO);
	
	//이력서 수정 : 포트폴리오
	public void updatePortfolio(PortfolioVO portfolioVO);
	
	//이력서 취합 정보 수정
	public void updateResume(ResumeVO resumeVO);
	
	//특정 이력서의 취합 정보를 불러옴
	public ResumeVO getResumeInfo(int res_no);
	
	//학력사항 삭제
	public void deleteEducation(int e_no);

	//경력사항 삭제
	public void deleteCareer(int car_no);
	
	//활동 및 수상내역 삭제
	public void deleteActAward(int act_no);
	
	//자격증 및 기타 삭제
	public void deleteCertiOther(int cer_no);
	
	//포트폴리오 삭제
	public void deletePortfolio(int por_no);
	
	//특정 이력서 삭제 
	public void deleteResume(int res_no);
	
	public void drafts(UserVO vo) throws Exception;
	
	public void job_applicants(UserVO vo) throws Exception;
	
	//이메일수신 설정
	public void newsCheck(UserVO vo) throws Exception;
	
	//비밀번호 변경
	public void pass_change(UserVO vo1) throws Exception;

	//기업검색
	public String searchc(String rev_name);

	//내가 쓴 전체 리뷰 불러오기
	public ArrayList<ReviewVO> getAllReview(int u_no) throws Exception;
	
	//내가 쓴 전체 리뷰 개수 확인
	public int getAllRevCount(int u_no) throws Exception;
	
	//특정 리뷰 불러오기
    public ReviewVO getReview(int rev_no);
	
    //리뷰 업데이트
    public void updateReview(ReviewVO vo1);
    
    //리뷰 삭제
    public void deleteReview(int rev_no);
    

}
