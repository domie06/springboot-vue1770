package dao;

import java.util.List;

import model.Word;

public interface WordMapper {
    List<Word> getAll();
    int insert(Word record);
}