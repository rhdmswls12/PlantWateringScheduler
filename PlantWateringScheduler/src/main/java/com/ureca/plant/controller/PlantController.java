package com.ureca.plant.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public String regist(
			@RequestParam("targetImage") MultipartFile file,
			@RequestParam("name") String name,
			@RequestParam("period") int period,
			@RequestParam("date") Date date
			) { // DB 입력
		System.out.println(file); //org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@315933c9
//		period = Integer.parseInt(plant.getPeriod());
		
		// 이미지
		String dateStr = new SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		String timeStr = new SimpleDateFormat("HHmmss").format(new java.util.Date());
		String uploadDir = System.getProperty("user.home")+"/Desktop/userGroup/";
	    Path uploadPath = Paths.get(uploadDir);
	    
	    String filePath = null;
		try {
	        if (!Files.exists(uploadPath)) {
	            Files.createDirectories(uploadPath);
	        }

	        String originalFileName = file.getOriginalFilename();
	        String fileExtension = "";
	        String fileNameWithoutExtension = originalFileName;

	        int dotIndex = originalFileName.lastIndexOf(".");
	        if (dotIndex > 0 && dotIndex < originalFileName.length() - 1) {
	            fileExtension = originalFileName.substring(dotIndex);
	            fileNameWithoutExtension = originalFileName.substring(0, dotIndex);
	        }

	        String newFileName = fileNameWithoutExtension + "_" + dateStr + timeStr + fileExtension;
	        filePath = uploadDir + newFileName;
	        System.out.println(filePath);
	        
	        Path destination = Paths.get(filePath);
	        file.transferTo(destination.toFile());
	        String basePath = "/userGroup";
	        int startIndex = filePath.indexOf(basePath);
	        filePath=filePath.substring(startIndex);
	        System.out.println(filePath);
	        
	    } catch (Exception err) {
	        err.printStackTrace();
	    }
		
		Date currentDate = date;
		
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
//		System.out.println(newFileName);
		try {
			service.add(filePath, name, period, sqlDate);
		} catch (SQLException e) {
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
//			int period = Integer.parseInt(plant.getPeriod()); // 주기
			Date currentDate = plant.getDate(); // 마지막 물 준 날짜
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.setTime(currentDate);
			cal.add(Calendar.DATE, plant.getPeriod());
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
	
//	@PostMapping("/create")
//	public String uploadMainPost(@RequestParam("targetImage") MultipartFile file,
//	                             @RequestParam("plantImage") String name) {
//	    System.out.println(file);
//	    System.out.println(name);
//
//	    //이름에 날짜 추가
//	    String dateStr = new SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
//	    String uploadDir = System.getProperty("user.home") + "/Desktop/userGroup/" + name + "/";
//	    Path uploadPath = Paths.get(uploadDir);
//
//	    try {
//	        if (!Files.exists(uploadPath)) {
//	            Files.createDirectories(uploadPath);
//	        }
//
//	        String originalFileName = file.getOriginalFilename();
//	        String fileExtension = "";
//	        String fileNameWithoutExtension = originalFileName;
//
//	        int dotIndex = originalFileName.lastIndexOf(".");
//	        if (dotIndex > 0 && dotIndex < originalFileName.length() - 1) {
//	            fileExtension = originalFileName.substring(dotIndex);
//	            fileNameWithoutExtension = originalFileName.substring(0, dotIndex);
//	        }
//
//	        String newFileName = fileNameWithoutExtension + "_" + dateStr + fileExtension;
//	        String filePath = uploadDir + newFileName;
//	        System.out.println(filePath);
//	        Path destination = Paths.get(filePath);
//	        file.transferTo(destination.toFile());
//
//	        //이름에 uuid 추가
////	        String uuid = UUID.randomUUID().toString();
//
//	        ImageSet tempImageSet = new ImageSet();
//	        tempImageSet.setId("1");
//	        tempImageSet.setUserName(name);
//	        tempImageSet.setImgUrl("/userGroup/" + name + "/" + newFileName);
////	        tempImageSet.setImgUrl("/userGroup/" + name + "/" + newFileName + "?v=" + uuid);
////	        tempImageSet.setLikeStatus(0);
////	        tempImageSet.setPrivateCheck(false);
//
//	        service.add(tempImageSet);
//	    } catch (Exception err) {
//	        err.printStackTrace();
//	    }
//
//	    return "redirect:/form"; // Redirect to the main page
//	}
	
}
