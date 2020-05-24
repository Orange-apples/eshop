package com.galaxy.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.galaxy.entity.GoodsInfo;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;

/**
 * (GoodsInfo)表数据库访问层
 *
 * @author makejava
 * @since 2020-05-12 14:05:51
 */
//@CacheNamespace(blocking = true)
public interface GoodsInfoDao extends BaseMapper<GoodsInfo> {

    Page<GoodsInfo> queryAll(Page<GoodsInfo> page, @Param("goodsInfo") GoodsInfo goodsInfo);

}