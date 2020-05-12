package com.galaxy.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.galaxy.entity.GoodsInfo;
import java.util.List;

/**
 * (GoodsInfo)表服务接口
 *
 * @author makejava
 * @since 2020-05-12 14:05:51
 */
public interface GoodsInfoService {
    public Page<GoodsInfo> queryAll(GoodsInfo goodsInfo, Integer pages);

}