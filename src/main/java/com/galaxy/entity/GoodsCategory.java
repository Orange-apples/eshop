package com.galaxy.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (GoodsCategory)实体类
 *
 * @author makejava
 * @since 2020-05-12 14:07:30
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName(value = "goods_category")
public class GoodsCategory implements Serializable {
    private static final long serialVersionUID = -65378712674024898L;
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;
    
    private String name;



}