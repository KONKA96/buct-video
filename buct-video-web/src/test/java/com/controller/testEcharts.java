package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.BaseTest;
import com.service.RecordPojoService;

public class testEcharts extends BaseTest{

	@Autowired
	private RecordPojoService RecordPojoService;
	
	@Test
	public void testEchartsData() {
		Map<String,Object> map=new HashMap<>();
		map.put("rolePower", 1);
		map.put("startTime", "2018-06-01 10:45:00");
		map.put("endTime", "2018-07-13 9:45:00");
		Integer selectEchartsData = RecordPojoService.selectEchartsData(map);
		System.out.println(selectEchartsData);
	}
}
