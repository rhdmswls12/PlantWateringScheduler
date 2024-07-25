package com.ureca.plant.model.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ureca.plant.dao.PlantDAO;
import com.ureca.plant.dto.Plant;

@Service
public class PlantServiceImpl implements PlantService {

	@Autowired
	PlantDAO dao;
	
	@Override
	public int add(Plant plant) throws SQLException {
		return dao.insert(plant);
	}

	@Override
	public int edit(Plant plant) throws SQLException {
		return dao.update(plant);
	}
	
	@Override
	public int editDate(int id, Date date) throws SQLException {
		return dao.updateDate(id, date);
	} // 날짜 갱신

	@Override
	public int remove(int id) throws SQLException {
		return dao.delete(id);
	}

	@Override
	public Plant get(int id) throws SQLException {
		return dao.select(id);
	}

	@Override
	public List<Plant> getAll() throws SQLException {
		return dao.selectAll();
	}

}
