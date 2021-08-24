package com.star.seat.store.service;

import javax.servlet.http.HttpServletRequest;

public interface StoreService {
	public void addStore(HttpServletRequest request);
	
	public void getMyStores(HttpServletRequest request);
	
	public void getMyStore(HttpServletRequest request);
}
