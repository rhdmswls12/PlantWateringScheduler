package com.ureca.plant.dao;

import java.sql.SQLException;
import java.util.List;

import com.ureca.plant.dto.Plant;

public interface PlantDAO {
	public int insert(Plant plant) throws SQLException;
	public int update(Plant plant) throws SQLException; // 정보 수정
//	public int updateDate(Plant plant) throws SQLException; // 날짜 갱신
	public int delete(int id) throws SQLException;
	public Plant select(int id) throws SQLException;
	public List<Plant> selectAll() throws SQLException;
}
