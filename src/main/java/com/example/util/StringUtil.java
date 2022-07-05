package com.example.util;
//字符串工具类，判断字符串是否为空
public class StringUtil {
    /**
     * 判断str是否为空
     * @param str
     * @return 如果为空返回true，否则返回false
     */
    public static boolean isEmpty(String str){
        if(str==null||"".equals(str.trim())){
            return true;
        }else{
            return false;
        }
    }
}
