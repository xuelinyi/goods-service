package com.goods.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.goods.bean.DemoBean;
import com.goods.mapper.DemoMapper;
import com.goods.service.DemoService;
import org.springframework.stereotype.Service;

@Service
public class DemoServiceImpl extends ServiceImpl<DemoMapper, DemoBean> implements DemoService {
}
