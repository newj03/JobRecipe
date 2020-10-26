package com.jobrecipe.advertisement.service;

import java.util.ArrayList;

import com.jobrecipe.advertisement.vo.AdvertisementVO;
import com.jobrecipe.advertisement.vo.Paging;
import com.jobrecipe.advertisement.vo.SearchCriteria;

public interface AdvertisementService {
	ArrayList<AdvertisementVO> searchInfo() throws Exception; //디데이순 전체 출력
	
	ArrayList<AdvertisementVO> cInfo_Date(Paging pa) throws Exception; //마감일순 공고 리스트
	
	AdvertisementVO aInfo(AdvertisementVO vo) throws Exception; //상세 공고
	
	ArrayList<AdvertisementVO> cInfo_Star(Paging pa) throws Exception; //평점수순 공고 리스트
	
	int listCount() throws Exception; //공고 갯수

	ArrayList<AdvertisementVO> countInfo(); //조회수순 전체 출력

	ArrayList<AdvertisementVO> searchTitle(SearchCriteria scri); //검색
	
	int searchList(SearchCriteria scri); //검색한 갯수

/*	void UpdateSave(AdvertisementVO vo); //저장

	void UpdateSaveCancel(AdvertisementVO vo); //저장 취소
*/	
	AdvertisementVO selectSaveOne(AdvertisementVO vo); //공고 하나만

	void UpdateCount(AdvertisementVO vo); //조회수 증가
	
	AdvertisementVO cInfo_Date_Vo(Paging pa); //마감순에서 각 페이지마다 첫 번째 공고
	
	AdvertisementVO cInfo_Star_Vo(Paging pa); //평점순에서 각 페이지마다 첫 번째 공고

	ArrayList<AdvertisementVO> allAdvertise(Paging cri); //모든 공고
	
	AdvertisementVO selectOne(int ad_no);

	
}
