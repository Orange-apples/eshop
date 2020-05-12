package com.galaxy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.galaxy.dao.GoodsInfoGoodsCategoryDao;
import com.galaxy.dao.GoodsInfoGoodsTagsDao;
import com.galaxy.dao.GoodsPhotoDao;
import com.galaxy.entity.GoodsInfo;
import com.galaxy.dao.GoodsInfoDao;
import com.galaxy.entity.GoodsInfoGoodsCategory;
import com.galaxy.entity.GoodsInfoGoodsTags;
import com.galaxy.entity.GoodsPhoto;
import com.galaxy.service.GoodsInfoService;
import com.galaxy.util.ConstantNum;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Generated;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
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
    public IPage<GoodsInfo> queryAll(GoodsInfo goodsInfo, Integer pages) {
        return goodsInfoDao.queryAll(new Page<GoodsInfo>(pages, ConstantNum.PAGESIZE), goodsInfo);
    }

    @Override
    public GoodsInfo queryById(Integer id) {
        return goodsInfoDao.selectById(id);
    }

    @Resource
    GoodsInfoGoodsCategoryDao goodsInfoGoodsCategoryDao;
    @Resource
    GoodsInfoGoodsTagsDao goodsInfoGoodsTagsDao;
    @Resource
    GoodsPhotoDao goodsPhotoDao;

    @Override
    @Generated(value = "id")
    public void insert(GoodsInfo goodsInfo, Integer[] categoryId, Integer[] tagsId, List<MultipartFile> files,HttpServletRequest request) {
        goodsInfoDao.insert(goodsInfo);
       for(Integer id :categoryId){
           GoodsInfoGoodsCategory goodsInfoGoodsCategory = new GoodsInfoGoodsCategory();
           goodsInfoGoodsCategory.setCategoryId(id);
           goodsInfoGoodsCategory.setGoodsId(goodsInfo.getId());
           goodsInfoGoodsCategoryDao.insert(goodsInfoGoodsCategory);
       }
        for(Integer id :tagsId){
            GoodsInfoGoodsTags goodsInfoGoodsTags = new GoodsInfoGoodsTags();
            goodsInfoGoodsTags.setTagsId(id);
            goodsInfoGoodsTags.setGoodsId(goodsInfo.getId());
            goodsInfoGoodsTagsDao.insert(goodsInfoGoodsTags);
        }
        if(!files.isEmpty()&&files.size()>0){
            String realPath = request.getServletContext().getRealPath("/goodsPhoto/");
            File file = new File(realPath);
            if(!file.exists())file.mkdirs();
            for(MultipartFile multipartFile:files){
                String filename =new Date().getTime()+ multipartFile.getOriginalFilename();
                System.out.println(realPath+filename);
                try {
                    multipartFile.transferTo(new File(realPath+filename));
                    GoodsPhoto goodsPhoto = new GoodsPhoto();
                    goodsPhoto.setPhotoAddr(realPath+filename);
                    System.out.println(goodsPhoto.getPhotoAddr());
                    goodsPhoto.setGoodsId(goodsInfo.getId());
                    goodsPhotoDao.insert(goodsPhoto);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public void delete(Integer id) {
        goodsInfoDao.deleteById(id);
    }
}