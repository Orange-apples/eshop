package com.galaxy.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.galaxy.entity.GoodsCategory;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (GoodsCategory)表数据库访问层
 *
 * @author makejava
 * @since 2020-05-12 14:07:30
 */
@CacheNamespace(blocking = true)
public interface GoodsCategoryDao extends BaseMapper<GoodsCategory> {



}