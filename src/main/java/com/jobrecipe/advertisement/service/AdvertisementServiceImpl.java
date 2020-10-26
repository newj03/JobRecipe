package com.jobrecipe.advertisement.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jobrecipe.advertisement.service.dao.AdvertisementDAO;
import com.jobrecipe.advertisement.vo.AdvertisementVO;
import com.jobrecipe.advertisement.vo.Paging;
import com.jobrecipe.advertisement.vo.SearchCriteria;

@Service("advertisementService")
public class AdvertisementServiceImpl implements AdvertisementService{
	
	@Autowired
	private AdvertisementDAO dao;
	
	@Override
	@Transactional
	public ArrayList<AdvertisementVO> searchInfo() throws Exception {
		return dao.searchInfo();
	}

	@Override
	public ArrayList<AdvertisementVO> cInfo_Date(Paging pa) throws Exception {
		return dao.cInfo_Date(pa);
	}

	@Override
	public AdvertisementVO aInfo(AdvertisementVO vo) throws Exception {
		return dao.aInfo(vo);
	}

	@Override
	public ArrayList<AdvertisementVO> cInfo_Star(Paging pa) throws Exception {
		return dao.cInfo_Star(pa);
	}

	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

	@Override
	public ArrayList<AdvertisementVO> countInfo() {
		return dao.countInfo();
	}

	@Override
	public ArrayList<AdvertisementVO> searchTitle(SearchCriteria scri) {
		return dao.searchTitle(scri);
	}
	
	@Override
	public int searchList(SearchCriteria scri) {
		return dao.searchList(scri);
	}

	/*@Override
	public void UpdateSave(AdvertisementVO vo) {
		dao.UpdateSave(vo);
	}

	@Override
	public void UpdateSaveCancel(AdvertisementVO vo) {
		dao.UpdateSaveCancel(vo);
	}*/
	
	@Override
	public AdvertisementVO selectSaveOne(AdvertisementVO vo) {
		return dao.selectSaveOne(vo);
	}

	@Override
	public void UpdateCount(AdvertisementVO vo) {
		dao.UpdateCount(vo);
	}

	@Override
	public AdvertisementVO cInfo_Date_Vo(Paging pa) {
		return dao.cInfo_Date_Vo(pa);
	}

	@Override
	public AdvertisementVO cInfo_Star_Vo(Paging pa) {
		return dao.cInfo_Star_Vo(pa);
	}

	@Override
	public ArrayList<AdvertisementVO> allAdvertise(Paging cri) {
		return dao.allAdvertise(cri);
	}

	@Override
	public AdvertisementVO selectOne(int ad_no) {
		return dao.selectOne(ad_no);
	}

	

	

}
