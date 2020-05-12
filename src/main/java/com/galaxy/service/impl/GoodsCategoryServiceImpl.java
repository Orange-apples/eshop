package com.galaxy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.galaxy.dao.GoodsCategoryDao;
import com.galaxy.entity.GoodsCategory;
import com.galaxy.service.GoodsCategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("goodsCategoryService")
public class GoodsCategoryServiceImpl implements GoodsCategoryService {

@Resource
    GoodsCategoryDao goodsCategoryDao;
    @Override
    public void insert(GoodsCategory goodsCategory) {
        goodsCategoryDao.insert(goodsCategory);
    }

    @Override
    public List<GoodsCategory> queryAll() {
        return goodsCategoryDao.selectList(new QueryWrapper<GoodsCategory>());
    }
}
