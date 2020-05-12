package com.galaxy.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.galaxy.entity.GoodsInfo;
import com.galaxy.service.GoodsInfoService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * (GoodsInfo)表控制层
 *
 * @author makejava
 * @since 2020-05-12 14:05:52
 */
@RestController
@RequestMapping("/goods")
public class GoodsInfoController {
    @Resource
    GoodsInfoService goodsInfoService;

    @RequestMapping("/queryAll")
    public List<GoodsInfo> queryAll(GoodsInfo goodsInfo,Integer pages){
        pages = pages==null?1:pages;
        Page<GoodsInfo> goodsInfoPage = goodsInfoService.queryAll(goodsInfo, pages);
        return goodsInfoPage.getRecords();
    }


}