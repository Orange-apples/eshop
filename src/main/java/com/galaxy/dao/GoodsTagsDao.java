package com.galaxy.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.galaxy.entity.GoodsTags;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (GoodsTags)表数据库访问层
 *
 * @author makejava
 * @since 2020-05-13 08:14:20
 */
//@CacheNamespace(blocking = true)
public interface GoodsTagsDao extends BaseMapper<GoodsTags> {
}