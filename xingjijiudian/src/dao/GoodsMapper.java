package dao;

import java.util.List;

import model.Goods;

public interface GoodsMapper {
    List<Goods> getAll(Goods gs);
    List<Goods> getAllGoodsForAdmin(Goods record);
    Goods selectByPrimaryKey(String id);
    int insert(Goods record);
    int updateByPrimaryKey(Goods record);
}