package com.goods.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.goods.bean.DemoBean;
import com.goods.bean.GoodsBean;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoodsMapper extends BaseMapper<GoodsBean> {

}
