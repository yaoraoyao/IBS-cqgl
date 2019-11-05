package cn.it.utils;

import org.apache.shiro.crypto.hash.SimpleHash;

public class MD5Util {
    private static final String ALGORITHMNAME = "MD5";

    private static final Object SALT = "cn.it";

    private static final int HASHITERATIONS = 10;

    public static String getMD5Password(String password){
        SimpleHash hash = new SimpleHash(ALGORITHMNAME, password, SALT, HASHITERATIONS);
        return hash.toString();
    }

}
