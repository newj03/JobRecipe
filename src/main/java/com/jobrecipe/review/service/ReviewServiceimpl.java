package com.jobrecipe.review.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jobrecipe.review.service.dao.ReviewDAO;
import com.jobrecipe.review.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceimpl implements ReviewService{

	@Autowired
	private ReviewDAO reviewdao;

	@Override
	@Transactional
	public ArrayList<ReviewVO> getAllReview(ReviewVO vo) {
		return this.reviewdao.getAllReview(vo);
	}

	@Override
	public void insertReview(ReviewVO vo) {
		this.reviewdao.insertReview(vo);
	}

	@Override
	public void reviewCntUp(int rev_no) {
		this.reviewdao.reviewCntUp(rev_no);
	}

	@Override
	public ReviewVO getOneReview(int rev_no) {
		return this.reviewdao.getOneReview(rev_no);
	}

	@Override
	public int getReviewCount(String rev_name) {
		return this.reviewdao.getReviewCount(rev_name);
	}

	@Override
	public String getReviewStar(String rev_name) {
		return this.reviewdao.getReviewStar(rev_name);
	}

	@Override
	public void companyStarUpdate(ReviewVO vo) {
		this.reviewdao.companyStarUpdate(vo);
	}

	
	
}
