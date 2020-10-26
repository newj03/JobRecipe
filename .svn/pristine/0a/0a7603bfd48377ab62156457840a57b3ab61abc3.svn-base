package com.jobrecipe.review.service.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.jobrecipe.review.vo.ReviewVO;

@Repository
public interface ReviewDAO {

	ArrayList <ReviewVO>getAllReview(ReviewVO vo);
	
	void insertReview(ReviewVO vo);

	void reviewCntUp(int rev_no);

	ReviewVO getOneReview(int rev_no);

	int getReviewCount(String rev_name);

	String getReviewStar(String rev_name);

	void companyStarUpdate(ReviewVO vo);
	
	
	
}
