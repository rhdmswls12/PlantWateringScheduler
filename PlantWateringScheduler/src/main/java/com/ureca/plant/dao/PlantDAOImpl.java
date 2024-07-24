package com.ureca.plant.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ureca.plant.dto.Plant;
import com.ureca.util.DBUtil;

@Repository
public class PlantDAOImpl implements PlantDAO {

	@Autowired
	DBUtil dbUtil;
	
	@Override
	public int insert(Plant plant) throws SQLException {
		Connection conn = dbUtil.getConnection();
		String sql = "insert into plant (name,period,date) values (?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
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
		
//		pstmt.setString(1, plant.getImage());
		pstmt.setString(1, plant.getName());
		pstmt.setString(2, plant.getPeriod());
		pstmt.setDate(3, sqlDate); // 주기가 계산된 날짜로 db에 저장
		
		return pstmt.executeUpdate();
	}

	@Override
	public int update(Plant plant) throws SQLException {
		Connection conn = dbUtil.getConnection();
		String sql = "update plant set name=?, period=?, date=? where id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, plant.getName());
		pstmt.setString(2, plant.getPeriod());
		pstmt.setDate(3, plant.getDate());
		pstmt.setInt(4, plant.getId());
		
		return pstmt.executeUpdate();
	}
	
//	@Override
//	public int updateDate(Plant plant) throws SQLException {
//		Connection conn = dbUtil.getConnection();
//		String sql = "update plant set date=DATE_ADD(date, interval ? day)";
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		
//		pstmt.setString(1, plant.getImage());
//		
//		return pstmt.executeUpdate();
//	}

	@Override
	public int delete(int id) throws SQLException {
		Connection conn = dbUtil.getConnection();
		String sql = "delete from plant where id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql); 
		
		pstmt.setInt(1, id);
		
		return pstmt.executeUpdate();
	}

	@Override
	public Plant select(int id) throws SQLException {
		Connection conn = dbUtil.getConnection();
		String sql = "select id, name, period, date from plant where id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql); 
		
		pstmt.setInt(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		Plant todo = null;
		
		if (rs.next()) {
			
			todo = new Plant(
				rs.getInt("id"),
				rs.getString("name"),
				rs.getString("period"),
				rs.getDate("date")
			);
		}
		return todo;
	}

	@Override
	public List<Plant> selectAll() throws SQLException {
		Connection conn = dbUtil.getConnection();
		String sql = "select id, name, period, date from plant";
		PreparedStatement pstmt = conn.prepareStatement(sql); 
		
		ResultSet rs = pstmt.executeQuery();
		List<Plant> list = new ArrayList<>();
		
		while (rs.next()) { 
			list.add(new Plant(
				rs.getInt("id"),
				rs.getString("name"),
				rs.getString("period"),
				rs.getDate("date")
			));
		}
		return list;
	}

}
