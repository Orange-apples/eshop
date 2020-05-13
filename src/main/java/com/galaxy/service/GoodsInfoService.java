package com.galaxy.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.galaxy.entity.GoodsInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * (GoodsInfo)表服务接口
 *
 * @author makejava
 * @since 2020-05-12 14:05:51
 */
public interface GoodsInfoService {
    public IPage<GoodsInfo> queryAll(GoodsInfo goodsInfo, Integer pages);

    GoodsInfo queryById(Integer id);

    void insert(GoodsInfo goodsInfo, Integer[] categoryId, Integer[] tagsId, List<MultipartFile> files, HttpServletRequest request);

    void delete(Integer id);

    Page<GoodsInfo> queryList(Integer pages);
}