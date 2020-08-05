package com.atjone.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Message {

    private int code; // 状态信息 200表示处理成功，100表示处理失败
    private String message; // 返回码
    private Map<String,Object> extend = new HashMap<String, Object>(); // 用户要返回给浏览器的数据


    public static Message success(){
        Message message = new Message();
        message.setCode(200);
        message.setMessage("处理成功");
        return message;
    }

    public static Message fail(){
        Message message = new Message();
        message.setCode(100);
        message.setMessage("处理失败");
        return message;
    }

    public Message add(String key,Object object) {
        this.extend.put(key, object);
        return this;
    }
}
