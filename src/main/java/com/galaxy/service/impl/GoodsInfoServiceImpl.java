package com.galaxy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.galaxy.entity.GoodsInfo;
import com.galaxy.dao.GoodsInfoDao;
import com.galaxy.service.GoodsInfoService;
import com.galaxy.util.ConstantNum;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (GoodsInfo)表服务实现类
 *
 * @author makejava
 * @since 2020-05-12 14:05:52
 */
@Service("goodsInfoService")
public class GoodsInfoServiceImpl implements GoodsInfoService {
    @Resource
    private GoodsInfoDao goodsInfoDao;

    @Override
    public Page<GoodsInfo> queryAll(GoodsInfo goodsInfo,Integer pages) {
        return goodsInfoDao.selectPage(new Page<GoodsInfo>(pages, ConstantNum.PAGESIZE), new QueryWrapper<GoodsInfo>());
    }
}