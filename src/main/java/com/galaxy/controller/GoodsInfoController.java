package com.galaxy.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.galaxy.dao.GoodsCategoryDao;
import com.galaxy.dao.GoodsInfoGoodsTagsDao;
import com.galaxy.dao.GoodsTagsDao;
import com.galaxy.entity.GoodsInfo;
import com.galaxy.service.GoodsCategoryService;
import com.galaxy.service.GoodsInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * (GoodsInfo)表控制层
 *
 * @author makejava
 * @since 2020-05-12 14:05:52
 */
@Controller
@RequestMapping("/goods")
public class GoodsInfoController {
    @Resource
    GoodsInfoService goodsInfoService;

    /**
     * 根据条件查询商品
     * @param goodsInfo：查询条件
     * @param pages：当前页
     * @return 返回list
     */
    @ResponseBody
    @RequestMapping("/queryAll")
    public List<GoodsInfo> queryAll(GoodsInfo goodsInfo,Integer pages){
        pages = pages==null?1:pages;
        IPage<GoodsInfo> goodsInfoIPage = goodsInfoService.queryAll(goodsInfo, pages);
        return goodsInfoIPage.getRecords();
    }

    /**
     * 根据id查询商品
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/queryById")
    public GoodsInfo queryById(Integer id){
       return goodsInfoService.queryById(id);
    }

    /**
     *插入数据
     * @param request
     * @param goodsInfo
     * @param categoryId 类别id
     * @param tagsId 标签id
     * @param files 图片文件
     * @return
     */
    @RequestMapping("/insert")
    public String insert(HttpServletRequest request,GoodsInfo goodsInfo, Integer[] categoryId, Integer[] tagsId, List<MultipartFile> files){
        System.out.println(files.size());
        goodsInfoService.insert(goodsInfo,categoryId,tagsId,files,request);


        return "redirect:/index.html";
    }

    /**
     * 根据id删除数据
     * @param id
     * @return
     */
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable(value = "id") Integer id){
        goodsInfoService.delete(id);
        return "redirect:/goods/goodsList";
    }

    @Resource
    GoodsCategoryDao goodsCategoryDao;
    @Resource
    GoodsTagsDao goodsTagsDao;
    @RequestMapping("/insert.html")
    public  String dataInit(HttpServletRequest request, ModelMap modelMap){
        modelMap.addAttribute("categories",goodsCategoryDao.selectList(null));
        modelMap.addAttribute("tags",goodsTagsDao.selectList(null));
        return "/goodsInsert.jsp";
    }


    @RequestMapping("/goodsList")
    public String goodsList(ModelMap modelMap,Integer pages){
        pages = pages==null?1:pages;
       Page<GoodsInfo> page = goodsInfoService.queryList(pages);
        modelMap.addAttribute("goodsList",page.getRecords());
        modelMap.addAttribute("page",page);
        return "/goodsList.jsp";
    }

}