package dao;

import java.util.List;

import model.Orders;
import model.SelectCar;

public interface OrdersMapper {
    List<Orders> getAll();
    List<Orders> getMyOrders(String user);
    Orders selectByPrimaryKey(String id);
    int insert(Orders record);
    int deleteByPrimaryKey(String id);
}