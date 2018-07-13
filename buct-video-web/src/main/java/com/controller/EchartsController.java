package com.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.RecordPojo;
import com.service.RecordPojoService;
import com.util.JsonUtils;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/echarts")
public class EchartsController {

	@Autowired
	private RecordPojoService recordPojoService;
	
	/**
	 * 获取图表数据
	 * @param interval
	 * @param record
	 * @return
	 */
	@RequestMapping(value="/getEchartsData",produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getEchartsData(@RequestParam(required=false) String time,
			@RequestParam(required=false,defaultValue="7") String interval,RecordPojo record) {
		Map<String,Object> map=new HashMap<>();
		if(time!=null && time!="") {
			map.put("time", time);
		}
		
		map.put("interval", interval);
		
		//向图表中设置字段和值的集合
		List<String> xAxisData = new ArrayList<>();  
        List<String> SpeakerList = new ArrayList<>();
        List<String> AuditorList = new ArrayList<>();
        List<String> AllUserList = new ArrayList<>();
		
        //查询演讲者数据
        map.put("rolePower", 1);
		Map<String, Integer> recordMap = recordPojoService.selectRecord(map);
		Set<Entry<String, Integer>> set = recordMap.entrySet();
		for (Entry<String, Integer> entry : set) {
			xAxisData.add(entry.getKey());
			SpeakerList.add(entry.getValue().toString());
		}
		//查询听讲者数据
		map.put("rolePower", 2);
		recordMap = recordPojoService.selectRecord(map);
		set = recordMap.entrySet();
		for (Entry<String, Integer> entry : set) {
			AuditorList.add(entry.getValue().toString());
		}
		//查询所有人数据
		map.put("rolePower", null);
		recordMap = recordPojoService.selectRecord(map);
		set = recordMap.entrySet();
		for (Entry<String, Integer> entry : set) {
			AllUserList.add(entry.getValue().toString());
		}
		
		Collections.reverse(SpeakerList);
		Collections.reverse(AuditorList);
		Collections.reverse(AllUserList);
		Collections.reverse(xAxisData);
		//xAxisData和seriesList转为json 
		JSONObject jsonObject1 = new JSONObject();  
		   
		jsonObject1.put("xAxisData", xAxisData);  
		   
		jsonObject1.put("SpeakerList", SpeakerList);
		jsonObject1.put("AuditorList", AuditorList);
		jsonObject1.put("AllUserList", AllUserList);
		return jsonObject1.toString();
	}
	
	/**
	 * 获取演讲者、听讲者使用时长
	 * @param rolePower
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getSpeakerTime")
	public String getUseTime(String rolePower) {
		Map<String,Object> map=new HashMap<>();
		if(rolePower!="" & rolePower!=null) {
			map.put("rolePower", rolePower);
		}
		Integer hour = recordPojoService.selectEchartsData(map);
		
		if(hour!=null){
			String hourString = hour.toString();
			if(hourString.length()>4){
				String substring = hourString.substring(0, hourString.length()-4);
				hour=Integer.parseInt(substring);
			}else{
				hour=1;
			}
		}else{
			hour=0;
		}
		return JsonUtils.objectToJson(hour);
	}
}
