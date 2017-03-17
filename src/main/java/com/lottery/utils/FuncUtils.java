package com.lottery.utils;

import com.lottery.pojo.OperationLog;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/2/24
 * Time: 16:28
 * Description：
 */
public class FuncUtils {
    private  static  final Logger logger = LoggerFactory.getLogger(FuncUtils.class);

    //日志操作类型
    public  static  final Integer OperationLogTypeAdd =0;
    public  static  final Integer OperationLogTypeDelete =1;
    public  static  final Integer OperationLogTypeUpdate =2;
    public  static  final Integer OperationLogTypeLogin =3;//登录
    public  static  final Integer OperationLogTypeOther =4;//其他


    public static OperationLog setOperationLog(int userId,int operatortype,
                                               String desc,String params,String ip){
        OperationLog operationLog = new OperationLog();
        operationLog.setUserId(userId);
        operationLog.setOperatorType(operatortype);
        operationLog.setDescr(desc);
        operationLog.setParams(params);
        operationLog.setOperatorTime(new Date());
        operationLog.setRequestIp(ip);
        return operationLog;
    }


    /**
     *  获取 客户请求真实Ip
     * @return String
     */
    public  static String getIpAddr(HttpServletRequest request) {
        if (null == request) {
            return null;
        }

        String proxs[] = { "X-Forwarded-For", "Proxy-Client-IP",
                "WL-Proxy-Client-IP", "HTTP_CLIENT_IP", "HTTP_X_FORWARDED_FOR" };

        String ip = null;
        for (String prox : proxs) {
            ip = request.getHeader(prox);
            if (StringUtils.isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
                continue;
            } else {
                break;
            }
        }
        if (StringUtils.isBlank(ip)) {
            try{
                ip = request.getRemoteAddr();
            }catch (Exception e){
                ip="0.0.0.0";
            }

        }
        if (StringUtils.isBlank(ip)) {
            ip = "0.0.0.0";//解析不出来
        }
        if (ip.equals("127.0.0.1") || ip.indexOf("0:0:0:0:0:0:0:1") != -1) {
            // 根据网卡取本机配置的IP
            try {
                InetAddress inet = InetAddress.getLocalHost();
                if (inet != null) {
                    ip = inet.getHostAddress();
                }
            } catch (UnknownHostException e) {
                logger.error("Can not get localhost.", e);
            }
        }
        // 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if (ip != null && ip.length() > 15) { // "***.***.***.***".length() = 15
            if (ip.indexOf(",") > 0) {
                ip = ip.substring(0, ip.indexOf(","));
            }
        }
        return ip;
    }


    /**
     *
     * @return
     */
    /*public static  Date earliestTime(String time){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
        Date date= null;
        try {
            date = sdf.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.set(Calendar.HOUR_OF_DAY,0);
        c.set(Calendar.MINUTE,0);
        c.set(Calendar.SECOND,0);
        return  c.getTime();
    }

    *//**
     *
     * @return
     *//*
    public static  Date latestTime(String time){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
        Date date= null;
        try {
            date = sdf.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Calendar c = Calendar.getInstance();
        c.set(Calendar.HOUR_OF_DAY,23);
        c.set(Calendar.MINUTE,59);
        c.set(Calendar.SECOND,59);
        return  c.getTime();
    }*/
}
