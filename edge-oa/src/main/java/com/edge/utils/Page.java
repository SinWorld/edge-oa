package com.edge.utils;

import java.util.List;
import com.edge.utils.MyTask;

/**
 * 分页工具类
 * 
 * @author NingCG
 *
 * @param <T>
 */
public class Page<T> {
	private int total;// 总页数
	private int page;// 当前页
	private int size = 10;// 每页数
	private List<T> rows;//结果集

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

}
