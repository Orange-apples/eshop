package com.galaxy.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * (GoodsInfo)实体类
 *
 * @author makejava
 * @since 2020-05-12 14:05:49
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName(value = "goods_info",excludeProperty = {"categories","tags","photos"},resultMap = "goodsMap")
public class GoodsInfo extends Model<GoodsInfo> implements Serializable {
    private static final long serialVersionUID = -43418615348735147L;
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;

    private String name;
    
    private String title;
    
    private Double price;
    
    private String description;

    private Integer total;

    private List<GoodsCategory> categories;

    private List<GoodsTags> tags;

    private List<String> photos;

}