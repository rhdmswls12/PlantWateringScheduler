package com.ureca.plant.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ureca.plant.dto.Plant;

@Mapper
public interface PlantDAO {
	@Insert("insert into plant (file, name, period, date) values (#{file}, #{name}, #{period}, #{date})")
	public int insert(String file, String name, int period, Date date) throws SQLException;
	
	@Update("update plant set file=#{file}, name=#{name}, period=#{period}, date=#{date} where id=#{id}")
	public int update(int id, String file, String name, int period, Date date) throws SQLException; // 정보 수정
	
	@Update("update plant set date=#{date} where id=#{id}")
	public int updateDate(int id,Date date) throws SQLException; // 날짜 갱신
	
	@Delete("delete from plant where id=#{id}")
	public int delete(int id) throws SQLException;
	
	@Select("select id, file, name, period, date from plant where id=#{id}")
	public Plant select(int id) throws SQLException;
	
	@Select("select id, file, name, period, date from plant")
	public List<Plant> selectAll() throws SQLException;
}
