package com.ureca.plant.model.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.ureca.plant.dto.Plant;

public interface PlantService {
	// 명세 => Plant 추가/수정/삭제/조회/모두 조회
	
		public int add(Plant plant) throws SQLException;
		public int edit(Plant plant) throws SQLException;
		public int editDate(int id, Date date) throws SQLException;
		public int remove(int id) throws SQLException;
		
		public Plant get(int id) throws SQLException;
		public List<Plant> getAll() throws SQLException;
}
