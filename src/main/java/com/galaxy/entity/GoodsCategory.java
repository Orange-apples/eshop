package com.galaxy.entity;

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
public class GoodsCategory implements Serializable {
    private static final long serialVersionUID = -65378712674024898L;
    
    private Integer id;
    
    private String name;



}