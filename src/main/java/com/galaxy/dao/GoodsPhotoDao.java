package com.galaxy.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.galaxy.entity.GoodsPhoto;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (GoodsPhoto)表数据库访问层
 *
 * @author makejava
 * @since 2020-05-12 20:45:49
 */
@CacheNamespace(blocking = true)
public interface GoodsPhotoDao extends BaseMapper<GoodsPhoto> {



}