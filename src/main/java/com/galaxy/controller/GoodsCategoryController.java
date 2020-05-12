package com.galaxy.controller;

import com.galaxy.entity.GoodsCategory;
import com.galaxy.service.GoodsCategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * (GoodsCategory)表控制层
 *
 * @author makejava
 * @since 2020-05-12 14:07:30
 */
@Controller
@RequestMapping("/category")
public class GoodsCategoryController {
    @Resource
    GoodsCategoryService goodsCategoryService;
    @RequestMapping("/insert")
    public String insert(GoodsCategory goodsCategory){
        System.out.println(goodsCategory);
        goodsCategoryService.insert(goodsCategory);
        return "redirect:index.html";
    }
    @ResponseBody
    @RequestMapping("/queryAll")
    public List<GoodsCategory> queryAll(){
        return goodsCategoryService.queryAll();
    }

}