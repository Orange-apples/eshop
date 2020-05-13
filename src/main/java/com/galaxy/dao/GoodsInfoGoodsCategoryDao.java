package com.galaxy.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.galaxy.entity.GoodsInfoGoodsCategory;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (GoodsInfoGoodsCategory)表数据库访问层
 *
 * @author makejava
 * @since 2020-05-12 20:45:49
 */
@CacheNamespace(blocking = true)
public interface GoodsInfoGoodsCategoryDao extends BaseMapper<GoodsInfoGoodsCategory> {


}