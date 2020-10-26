package com.jobrecipe.admin.service;

import com.jobrecipe.admin.vo.AdvertiseVO;
import com.jobrecipe.admin.vo.CompanyVO;

public interface AdminService {
	
	CompanyVO selectCompanyOne(String c_name); //회사 검색
	
	void insertCompany(CompanyVO vo); //회사 추가
	
	String selectCompanyName(String c_name); //회사명 검색
	
	void updateCompany(CompanyVO vo); //회사 수정
	
	void deleteCompany(String c_name); //회사 삭제
	
	void insertAdvertise(AdvertiseVO vo);

}
