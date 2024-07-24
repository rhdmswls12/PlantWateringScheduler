package com.ureca.plant.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		System.out.println(">>>POST form");
		System.out.println("plant>>"+plant);
		try {
			service.add(plant);
		} catch(SQLException e) {
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
