package com.galaxy.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.galaxy.dao.GoodsInfoDao;
import com.galaxy.dao.GoodsInfoGoodsCategoryDao;
import com.galaxy.dao.GoodsInfoGoodsTagsDao;
import com.galaxy.dao.GoodsPhotoDao;
import com.galaxy.entity.GoodsInfo;
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

    /**
     *
     * @param goodsInfo
     * @param pages
     * @return
     */
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
        //插入商品数据
        goodsInfoDao.insert(goodsInfo);
        //插入商品与类别关联数据
    if(categoryId!=null){
        for(Integer id :categoryId){
            GoodsInfoGoodsCategory goodsInfoGoodsCategory = new GoodsInfoGoodsCategory();
            goodsInfoGoodsCategory.setCategoryId(id);
            goodsInfoGoodsCategory.setGoodsId(goodsInfo.getId());
            goodsInfoGoodsCategoryDao.insert(goodsInfoGoodsCategory);
        }
    }
       //插入商品与标签关联数据
       if(tagsId!=null){
           for(Integer id :tagsId){
               GoodsInfoGoodsTags goodsInfoGoodsTags = new GoodsInfoGoodsTags();
               goodsInfoGoodsTags.setTagsId(id);
               goodsInfoGoodsTags.setGoodsId(goodsInfo.getId());
               goodsInfoGoodsTagsDao.insert(goodsInfoGoodsTags);
           }
       }
        //上传图片
        if(!files.isEmpty()&&files.size()>0){
            String realPath = request.getServletContext().getRealPath(ConstantNum.uploadPath());
            File file = new File(realPath);
            if(!file.exists())file.mkdirs();
            for(MultipartFile multipartFile:files){
                String[] split = multipartFile.getOriginalFilename().split("\\.");
                String filename =new Date().getTime() + "."+split[split.length - 1];
                System.out.println(realPath+filename);
                try {
                    multipartFile.transferTo(new File(realPath+filename));
                    GoodsPhoto goodsPhoto = new GoodsPhoto();
                    goodsPhoto.setPhotoAddr("/goodsPhoto/"+filename);
                    System.out.println(goodsPhoto.getPhotoAddr());
                    goodsPhoto.setGoodsId(goodsInfo.getId());
                    //插入商品图片关联数据
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

    @Override
    public Page<GoodsInfo> queryList(Integer pages) {
        return goodsInfoDao.selectPage(new Page<GoodsInfo>(pages,ConstantNum.PAGESIZE),null);
    }
}