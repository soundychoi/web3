package com.passtoss.myhome.domain;

public class MemberManage {
	private int companyId;
	private int belong = 1; // 탭 메뉴
	private String searchOptions; // 검색 옵션
	private String searchWord; // 검색어
	private int page = 1;// 페이지
	private int limit = 10;// 페이지당 보여질 목록개수
	private int startrow;
	private int endrow;
	private int listcount; // 회원 수
	private int maxpage; // 총 페이지 수
	private int startpage; // 현재 페이지에서 보여질 시작 페이지
	private int endpage; // 현재 페이지에서 보여질 마지막 페이지

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getBelong() {
		return belong;
	}

	public void setBelong(int belong) {
		this.belong = belong;
	}

	public String getSearchOptions() {
		return searchOptions;
	}

	public void setSearchOptions(String searchOptions) {
		this.searchOptions = searchOptions;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getStartrow() {
		return startrow;
	}

	public int getEndrow() {
		return endrow;
	}

	public int getListcount() {
		return listcount;
	}

	public void setListcount(int listcount) {
		this.listcount = listcount;
	}

	public int getMaxpage() {
		return maxpage;
	}

	public int getStartpage() {
		return startpage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void pagination() {
		this.maxpage = (listcount + limit - 1) / limit;
		this.startpage = ((page - 1) / 10) * 10 + 1;
		this.endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
	}

	public void setRowNum() {
		this.startrow = (page - 1) * limit + 1;
		this.endrow = startrow + limit - 1;
	}

}
