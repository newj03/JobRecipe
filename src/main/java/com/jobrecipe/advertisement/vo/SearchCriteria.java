package com.jobrecipe.advertisement.vo;

public class SearchCriteria extends Paging{

 private String keyword = "";
 
 public String getKeyword() {
  return keyword;
 }
 public void setKeyword(String keyword) {
  this.keyword = keyword;
 }
 
 @Override
 public String toString() {
  return super.toString() + " SearchCriteria [keyword=" + keyword + "]";
 }
}