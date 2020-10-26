package com.jobrecipe.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobrecipe.admin.service.dao.AdminDAO;
import com.jobrecipe.admin.vo.AdvertiseVO;
import com.jobrecipe.admin.vo.CompanyVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO admindao;

	@Override
	public CompanyVO selectCompanyOne(String c_name) { //회사 검색
		
		return this.admindao.selectCompanyOne(c_name);
	}

	@Override
	public void insertCompany(CompanyVO vo) { //회사 추가
		
		this.admindao.insertCompany(vo);
	}

	@Override
	public String selectCompanyName(String c_name) { //회사명 검색
		
		return this.admindao.selectCompanyName(c_name);
	}

	@Override
	public void updateCompany(CompanyVO vo) { //회사 수정
		
		this.admindao.updateCompany(vo);
	}

	@Override
	public void deleteCompany(String c_name) { //회사 삭제
		
		this.admindao.deleteCompany(c_name);
	}

	@Override
	public void insertAdvertise(AdvertiseVO vo) {
	
		this.admindao.insertAdvertise(vo);
	}

}
