package com.galaxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (GoodsTags)实体类
 *
 * @author makejava
 * @since 2020-05-13 08:14:19
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsTags implements Serializable {
    private static final long serialVersionUID = -95614936059944742L;
    
    private Integer id;
    
    private String name;



}