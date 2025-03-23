package dao;

import java.util.List;

import model.SelectCar;

public interface SelectCarMapper {
    List<SelectCar> getAll();
    List<SelectCar> getMySelectCar(String user);
    SelectCar selectByPrimaryKey(String id);
    int insert(SelectCar record);
    int deleteByPrimaryKey(String id);
    int updateByPrimaryKeyForOrders(SelectCar record);
}