package com.jobrecipe.advertisement.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount; //게시판 글 전체 갯수
	private int startPage; //게시판 화면에 보여질 첫번쨰 페이지 번호
	private int endPage; //게시판을 화면에 보여질 마지막 페이지 번호
	private boolean prev; //이전 페이지 버튼 활성화 여부
	private boolean next; //다음 페이지 버튼 활성화 여부
	private int displayPageNum = 10; //한 화면에 보여질 페이지 갯수
	private Paging pa;
	
	public void setCri(Paging pa) {
		this.pa = pa;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public Paging getCri() {
		return pa;
	}
	 
	private void calcData() {
		endPage = (int) (Math.ceil(pa.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
	  
		int tempEndPage = (int) (Math.ceil(totalCount / (double)pa.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * pa.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
						    .queryParam("page", page)
							.queryParam("perPageNum", pa.getPerPageNum())
							.build();
		   
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page) {
	  
	 UriComponents uriComponents =
	            UriComponentsBuilder.newInstance()
	            .queryParam("page", page)
	            .queryParam("perPageNum", pa.getPerPageNum())
	            .queryParam("keyword", encoding(((SearchCriteria)pa).getKeyword()))
	            .build(); 
	    return uriComponents.toUriString();  
	}

	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) { 
			return "";
		}
		 
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch(UnsupportedEncodingException e) { 
			return ""; 
		}
	}
}