package com.ureca.plant.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ureca.plant.dto.Plant;
import com.ureca.plant.model.service.PlantService;

@Controller
@RequestMapping("/plant")
public class PlantController {
	
	@Autowired
	PlantService service;
	
	@GetMapping("/form")
	public String form() { // 입력 폼 보이기
		
		return "form";
	}
	
	@PostMapping("/form")
	public String regist(Plant plant, Model model) { // DB 입력
//		System.out.println(">>>POST form");
//		System.out.println("plant>>"+plant);
//		try {
//		} catch(SQLException e) {
//			e.printStackTrace();
//		}
		

//		service.add(plant);
		int period = Integer.parseInt(plant.getPeriod());
		Date currentDate = plant.getDate();
		
		// SimpleDateFormat을 사용하여 날짜 형식 지정
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, period);
		String nextDateStr = format.format(cal.getTime());
		
		
		// String을 java.sql.Date로 변환
        java.util.Date utilDate = null;
		try {
			utilDate = format.parse(nextDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

		System.out.println("date>>"+ sqlDate);

		try {
			service.add(plant.getName(), plant.getPeriod(), sqlDate);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:list";
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		try {
			List<Plant> list = service.getAll();
			
			model.addAttribute("list", list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "list";
	}
	
	@ResponseBody
	@GetMapping("/date")
	public java.sql.Date updatedList(@RequestParam("id") int id) {
	
		java.sql.Date response = null;
		System.out.println(id);
		try {
			Plant plant = service.get(id);
			int period = Integer.parseInt(plant.getPeriod()); // 주기
			Date currentDate = plant.getDate(); // 마지막 물 준 날짜
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.setTime(currentDate);
			cal.add(Calendar.DATE, period);
			String nextDateStr = format.format(cal.getTime());
			
			// String을 java.sql.Date로 변환
	        java.util.Date utilDate = null;
	        try {
				utilDate = format.parse(nextDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
	        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

			response = sqlDate;
			service.editDate(id, sqlDate); // db 갱신
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return response;
	}
	
	@GetMapping("/upform") // 수정폼 보여주기
	public String upform(@RequestParam("id") int id, Model model) {
		try {
			model.addAttribute("plant", service.get(id));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "upform";
	}
	
	@PostMapping("/upform")
	public String modify(Plant plant) { // DB 수정 요청
		try {
			service.edit(plant);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("id") int id) { // DB 삭제 요청
		try {
			service.remove(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:list";
	}
	
}
