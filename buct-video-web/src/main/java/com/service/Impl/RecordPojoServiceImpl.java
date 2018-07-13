package com.service.Impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.RecordPojoMapper;
import com.model.RecordPojo;
import com.service.RecordPojoService;

@Service
public class RecordPojoServiceImpl implements RecordPojoService {

	@Autowired
	private RecordPojoMapper recordPojoMapper;
	
	@Override
	public Integer selectEchartsData(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return recordPojoMapper.selectEchartsData(map);
	}

	@Override
	public int deleteByPrimaryKey(RecordPojo record) {
		// TODO Auto-generated method stub
		return recordPojoMapper.deleteByPrimaryKey(record.getId());
	}

	@Override
	public int insertSelective(RecordPojo record) {
		// TODO Auto-generated method stub
		return recordPojoMapper.insertSelective(record);
	}

	@Override
	public RecordPojo selectByPrimaryKey(RecordPojo record) {
		// TODO Auto-generated method stub
		return recordPojoMapper.selectByPrimaryKey(record.getId());
	}

	@Override
	public int updateByPrimaryKeySelective(RecordPojo record) {
		// TODO Auto-generated method stub
		return recordPojoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public Map<String, Integer> selectRecord(Map<String, Object> map) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
		  
        Calendar cd = Calendar.getInstance();
        String time=(String) map.get("time");
        Map<String,Integer> record=new LinkedHashMap<>();
        for (int i = 0; i < 7; i++) {
        	if(time!=null && time!=""){
        		try {
					cd.setTime(sdf.parse(time));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}else{
        		cd.setTime(new Date());
        	}
        	String interval= (String) map.get("interval");
        	cd.add(Calendar.DATE, -Integer.parseInt(interval)*i+1);
        	Date startTime=cd.getTime();
        	cd.add(Calendar.DATE, -Integer.parseInt(interval));
        	Date endTime=cd.getTime();
        	map.put("startTime", sdf.format(startTime));
        	map.put("endTime", sdf.format(endTime));
        	
        	SimpleDateFormat sdf1 = new SimpleDateFormat("MM.dd");  
        	
        	Integer hour = recordPojoMapper.selectEchartsData(map);
    		
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
        	record.put(sdf1.format(endTime)+"至"+sdf1.format(startTime), hour);
		}
		return record;
	}

}
