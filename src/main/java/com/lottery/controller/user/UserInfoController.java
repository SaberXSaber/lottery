package com.lottery.controller.user;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lottery.condition.PageCondition;
import com.lottery.controller.BaseController;
import com.lottery.pojo.UserInfoEntity;
import com.lottery.service.UserInfoService;
import com.lottery.utils.ConstantParm;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/3
 * Time: 16:48
 * Description：
 */
@Controller
@RequestMapping("/")
public class UserInfoController extends BaseController {

    @Autowired
    private UserInfoService userInfoService;


    @RequestMapping(value="/userinfolist",method = RequestMethod.GET)
    public String userInfolist(ModelMap model){
       /* if(!hasRight()){
            return "403";
        }*/
        return "userinfo/userinfo";
    }


    @RequestMapping(value = "/userinfodata")
    @ResponseBody
    public Map list(PageCondition pageCondition){
        Map reslut = new HashMap();
        List<UserInfoEntity> listUserInfos =userInfoService.getUserInfoByPage(pageCondition);
        int recordTotal = userInfoService.getTotal(pageCondition);
        pageCondition.setRecordTotal(recordTotal);
        reslut.put("total", pageCondition.getTotal());
        reslut.put("rows", listUserInfos);
        return reslut;
    }

    @RequestMapping(value="/userinfoedit")
    @ResponseBody
    public String edit( UserInfoEntity usersEntity,String oper){

        boolean result= false;
        if(ConstantParm.OPER_ADD.equals(oper)){
            result=userInfoService.addUserInfo(usersEntity);
            System.out.println("用户添加");
        }else if(ConstantParm.OPER_EDIT.equals(oper)){
            result=userInfoService.updateUserInfo(usersEntity);
            System.out.println("用户修改");
        }else if(ConstantParm.OPER_DEL.equals(oper)){
            result=userInfoService.deleteUserInfo(usersEntity);
            System.out.println("用户删除");
        }else {
            result =true;
        }

        JSONObject res = new JSONObject();
        if(result){
            res.put("msg", "操作成功");
            res.put("successs", result);
            res.put("status", 200);

        }else {
            res.put("msg", "操作失败");
            res.put("successs", result);
            res.put("status", 500);
        }
        return res.toString();

    }

    @RequestMapping("/fileUpload")
    @ResponseBody
    public String fileUpload(HttpServletRequest request) throws IOException {
        System.out.println("文件上传————————————————————————————————————》");
        String filePath ="E:/";
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String,Object> mapParamter = new HashMap<String,Object>();
        //设置保存上传文件的目录
        for (String key : multipartRequest.getMultiFileMap().keySet()) {
            List<MultipartFile>  f =multipartRequest.getMultiFileMap().get(key);
            MultipartFile fi = f.get(0);



            if(StringUtils.isNotBlank(fi.getOriginalFilename())){
                String fileFloder = "abcd";
                String newFilePath = getFilePath(fi.getOriginalFilename(),fileFloder);
                String imageUrl = StringUtils.replace(StringUtils.substringAfter(newFilePath, "E:/"),
                        "\\", "/");
                fi.transferTo(new File(newFilePath));
                mapParamter.put(key,"http://localhost:8080/"+imageUrl);
                mapParamter.put("code", 200);
                mapParamter.put("msg","文件上传成功");
            }else {
                mapParamter.put("code", 500);
                mapParamter.put("msg","文件上传失败");
                mapParamter.put("success",false);
                return JSONObject.toJSONString(mapParamter);
            }
        }
        return JSONObject.toJSONString(mapParamter);
    }

    public String getFilePath(String sourceFileName, String dir) {
        String fileFolder = "E:/" + File.separator + dir;
        File file = new File(fileFolder);
        if (!file.isDirectory()) {
            // 如果目录不存在，则创建目录
            file.mkdirs();
        }
        // 生成新的文件名
        int index = sourceFileName.lastIndexOf(".");
        String end = sourceFileName.substring(index);
        Date d = new Date();
        SimpleDateFormat s = new SimpleDateFormat("yyyyMMddhhmmss");
        String day = s.format(d);
        Random r = new Random();
        String fileName = day + r.nextInt(9999) + end;
        return fileFolder + File.separator + fileName;
    }

}
