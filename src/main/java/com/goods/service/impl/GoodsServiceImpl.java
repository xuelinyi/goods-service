package com.goods.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.goods.bean.GoodsBean;
import com.goods.mapper.GoodsMapper;
import com.goods.service.GoodsService;
import com.rabbitmq.client.Channel;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Headers;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Map;

@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, GoodsBean> implements GoodsService {


    private static final Logger logger = LoggerFactory.getLogger(GoodsServiceImpl.class);

    @Autowired
    private GoodsMapper goodsMapper;

    @RabbitListener(queues = "order_dic_queue")
    public void process(Message message, @Headers Map<String, Object> headers, Channel channel) throws Exception {
        String messageId = message.getMessageProperties().getMessageId();
        String msg = new String(message.getBody(), "UTF-8");
        System.out.println("派单服务平台" + msg + ",消息id:" + messageId);
        JSONObject jsonObject = JSONObject.parseObject(msg);
        String goodsId = jsonObject.getString("goodsId");
        if (StringUtils.isEmpty(goodsId)) {
            // 日志记录
            return;
        }
        try {
            GoodsBean goodsBean = new GoodsBean();
            // 订单id
            goodsBean.setId(Integer.parseInt(goodsId));
            // 外卖员id
            goodsBean.setCount(1);
            int insertDistribute = goodsMapper.updateById(goodsBean);
            if (insertDistribute > 0) {
                // 手动签收消息,通知mq服务器端删除该消息
                channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // // 丢弃该消息
            channel.basicNack(message.getMessageProperties().getDeliveryTag(), false, false);
        }
    }

}
