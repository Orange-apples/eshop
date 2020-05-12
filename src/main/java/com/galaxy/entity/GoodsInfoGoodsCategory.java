package com.galaxy.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (GoodsInfoGoodsCategory)实体类
 *
 * @author makejava
 * @since 2020-05-12 20:45:49
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName(value = "goods_info_goods_category")
public class GoodsInfoGoodsCategory implements Serializable {
    private static final long serialVersionUID = -57338047426809253L;
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;
    
    private Integer goodsId;
    
    private Integer categoryId;


}