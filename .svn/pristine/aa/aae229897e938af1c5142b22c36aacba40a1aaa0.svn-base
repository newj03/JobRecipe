package com.jobrecipe.review.service;

import java.util.ArrayList;

import com.jobrecipe.review.vo.ReviewVO;

public interface ReviewService {

	ArrayList<ReviewVO> getAllReview(ReviewVO vo); //모든 리뷰
	
	void insertReview(ReviewVO vo); //리뷰 추가
	
	void reviewCntUp(int rev_no); //리뷰 추천수 증가
	
	ReviewVO getOneReview(int rev_no); //리뷰 한개
	
	int getReviewCount(String rev_name); //리뷰 갯수
	
	String getReviewStar(String rev_name); //평균 평점
	
	void companyStarUpdate(ReviewVO vo); //리뷰 추가한 회사 평균 평점 업데이트

}
