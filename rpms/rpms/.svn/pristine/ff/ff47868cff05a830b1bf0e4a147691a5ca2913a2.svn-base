package cn.itsource.shiro.util;

import org.apache.shiro.crypto.hash.SimpleHash;

public class MD5Utils {
    private static final String ALGORITHMNAME = "MD5";
    private static final String SALT = "cn.itsource";
    private static final Integer HASHITERATIONS = 10;

    public static String getMD5Password(String password){
        SimpleHash simpleHash = new SimpleHash(ALGORITHMNAME,password,SALT,HASHITERATIONS);
        return simpleHash.toString();
    }
    public static void main(String[] arg){
        System.out.println(getMD5Password("admin2"));
    }
}
