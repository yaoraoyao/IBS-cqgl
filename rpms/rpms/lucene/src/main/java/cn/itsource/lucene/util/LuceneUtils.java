package cn.itsource.lucene.util;

import org.apache.ibatis.io.Resources;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.Properties;

/*public class LuceneUtils {
 *//*   private static String IDNEXPATH;//索引库的路径
    //使用静态库读取属性文件初始化索引库路径
    static{
        try {
            Properties properties = Resources.getResourceAsProperties("index.properties");
            IDNEXPATH = properties.getProperty("path");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    *//**//**
     * 获取索引库的抽象路径的对象
     * @return
     *//**//*
    private static Directory getDirectory(){
        try {
            return FSDirectory.open(Paths.get(IDNEXPATH));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    *//**//**
     * 获取分词器
     * @return
     *//**//*
    public static Analyzer getAnalyzer(){
        return new SmartChineseAnalyzer();
    }

    *//**//**
     * 返回IndexWriter对象
     * @return
     *//**//*
    public static IndexWriter getIndexWriter(){
        try {
            Directory directory = getDirectory();
            IndexWriterConfig config = new IndexWriterConfig(getAnalyzer());
            return new IndexWriter(directory,config);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    *//**//**
     * 获取IndexReader
     * @return
     *//**//*
    public static IndexReader getIndexReader(){
        try {
            return DirectoryReader.open(getDirectory());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }*//*
}*/
