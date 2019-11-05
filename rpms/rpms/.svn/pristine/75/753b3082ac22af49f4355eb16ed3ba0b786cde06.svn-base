package cn.itsource.systemlogindex;

import cn.itsource.domain.SystemLog;
import cn.itsource.service.ISystemLogService;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.ResultSet;
import java.util.List;


public class SystemLogLucene {

    public static Directory getDirectory(){
        String filePath = "E:/IdeaProjects/rpms/index/syslog";
        Path path = Paths.get(filePath);
        Directory directory =null;
        try {
            directory = FSDirectory.open(path);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return directory;
    }

    public static IndexWriterConfig getConf(){
      return   new IndexWriterConfig(getAnalyzer());
    }

    //创建索引
    public static void index(ResultSet rs){
        try{
            IndexWriter indexWriter = new IndexWriter(getDirectory(),getConf());
            while (rs.next()) {
                Document doc = new Document();
                doc.add(new TextField("opuser", rs.getString(2), Field.Store.YES));
                doc.add(new TextField("opip", rs.getString(3), Field.Store.YES));
                doc.add(new TextField("function", rs.getString(4), Field.Store.YES));
                doc.add(new TextField("params", rs.getString(5), Field.Store.YES));
                doc.add(new TextField("optime", rs.getString(6), Field.Store.YES));
                 indexWriter.addDocument(doc);
            }
            indexWriter.commit();
            indexWriter.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static Analyzer getAnalyzer(){
        return new StandardAnalyzer();
    }

    //搜索索引
    public static List seacher(String queryString) {
        Directory directory = getDirectory();
        IndexReader r =null;
        List list = null;
        ScoreDoc[] scoreDocs =null;
        try {
            r = DirectoryReader.open(directory);
            IndexSearcher indexSearcher = new IndexSearcher(r);
            QueryParser queryParser =new QueryParser("opuser",getAnalyzer());
            Query query=queryParser.parse("opuser:"+queryString);
            TopDocs topDocs = indexSearcher.search(query, 10);
            scoreDocs = topDocs.scoreDocs;
            for (ScoreDoc scoreDoc : scoreDocs) {
                System.out.println(scoreDoc);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (org.apache.lucene.queryparser.classic.ParseException e) {
            e.printStackTrace();
        }

        return null;
    }

}
