/*
package cn.itsource.lucene.impl;

import cn.itsouce.util.PageList;
import cn.itsource.domain.Part;
import cn.itsource.lucene.PartIndexHelper;
import cn.itsource.lucene.util.LuceneUtils;
import cn.itsource.query.PartQuery;
import com.alibaba.fastjson.JSONObject;
import org.apache.lucene.document.*;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.search.highlight.*;
import org.apache.lucene.search.highlight.Scorer;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Component
public class PartIndexHelperImpl implements PartIndexHelper {
    @Override
    public void createIndex(List<Part> Part) {
        IndexWriter indexWriter = null;
        //获取到IndexWriter
        indexWriter = LuceneUtils.getIndexWriter();
        try {
        for (Part part : Part) {
            Document document = new Document();
            //第一个Field Part对象。做好转化为json对象存储，方便取出转化为对象
            String partJSONStr = JSONObject.toJSONString(part);
            StringField obj = new StringField("Part", partJSONStr, Field.Store.YES);
            document.add(obj);
            //第二个Field用作关键字查询。以配件名称和配件描述作为查询 字段
            String keyword = part.getName() + "_" + (part.getContext() != null ? part.getContext() : "");
            TextField keywordField = new TextField("keyword", keyword, Field.Store.YES);
            document.add(keywordField);
            //第四个Field用作录入时间查询。转化为Long类型，方便比较
            LongField createTimeField = new LongField("createTime", part.getCreatetime().getTime(), Field.Store.YES);
            document.add(createTimeField);
            indexWriter.addDocument(document);
            }
        } catch (IOException e) {
                e.printStackTrace();
        } finally {
            try {
                //提交事务，释放资源
                indexWriter.commit();
                indexWriter.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    */
/**
     * 当数据库数据发送变化时，需要重新生产索引所以需要先删除原来的索引再创建
     *//*

    @Override
    public void deleteIndex() {
        IndexWriter indexWriter = null;
        try {
            indexWriter = LuceneUtils.getIndexWriter();
            indexWriter.deleteAll();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                indexWriter.commit();
                indexWriter.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public PageList<Part> query(PartQuery PartQuery) {
        //创建一个PageList用来封装分页数据
        PageList<Part> pageList = new PageList<>();
        //获取一个IndexReader对象
        IndexReader indexReader = LuceneUtils.getIndexReader();
        //获取一个IndexSearcher对象
        IndexSearcher indexSearcher = new IndexSearcher(indexReader);
        //查询索引
        //查询条件
        try {
            BooleanQuery.Builder builder = new BooleanQuery.Builder();
            //关键字
            if(!StringUtils.isEmpty(PartQuery.getKeyword())){
                QueryParser parser = new QueryParser("keyword",LuceneUtils.getAnalyzer());

                builder.add(parser.parse("keyword:"+PartQuery.getKeyword()), BooleanClause.Occur.MUST);
            }
            //录入的起始时间
            if(PartQuery.getBeginDate()!=null){
                long begin = PartQuery.getBeginDate().getTime();
                NumericRangeQuery<Long> beginQuery = NumericRangeQuery.newLongRange("createTime", begin, null, true, false);
                builder.add(beginQuery, BooleanClause.Occur.MUST);
            }
            //录入的结束时间
            if(PartQuery.getEndDate()!=null){
                long end = PartQuery.getEndDate().getTime();
                NumericRangeQuery<Long> endQuery = NumericRangeQuery.newLongRange("createTime", null, end, false, true);
                builder.add(endQuery, BooleanClause.Occur.MUST);
            }
            if(CollectionUtils.isEmpty(builder.build().clauses())){
                builder.add(new WildcardQuery(new Term("keyword","*")),BooleanClause.Occur.SHOULD);
            }
            //构建一个query对象
            Query query = builder.build();
            //创建一个List来封装当前页的数据
            List<Part> customerList = new ArrayList<>();
            TopDocs topDocs = indexSearcher.search(query,PartQuery.getPageNum()*PartQuery.getPageSize());//TODO
            //根据索引的docID查询文档
            int total = topDocs.totalHits;
            ScoreDoc[] scoreDocs = topDocs.scoreDocs;
            for (ScoreDoc scoreDoc : scoreDocs) {
                int docID = scoreDoc.doc;
                Document document = indexSearcher.doc(docID);
                //将文档数据封装到Customer对象中
                String jsonStr = document.get("part");
                String keyword = document.get("keyword");

                //高亮处理【相当于就是一个html标签包含有样式】
                Formatter formatter = new SimpleHTMLFormatter("<font color='red'>","</font>");//格式化文本  配置包裹关键词的标签
                Scorer fragmentScorer = new QueryScorer(query);
                //获取到一个高亮处理器
                Highlighter highlighter = new Highlighter(formatter,fragmentScorer);
                //调用getBestFragment对结果进行高亮处理
                //第一个参数分词器 注意和创建索引的保存一致第二个参列名称,第三个参数对那个结果集进行处理
                keyword = highlighter.getBestFragment(LuceneUtils.getAnalyzer(), "keyword", keyword);
                //json字符串转java对象
                Part part = JSONObject.parseObject(jsonStr, Part.class);
                //保存到存放Part数据的集合中
                customerList.add(part);
            }
            //处理分页数据在前n条中取出当前页的数据
            int pageNum = PartQuery.getPageNum();
            int pageSize = PartQuery.getPageSize();
            int beginIndex = (pageNum-1)*pageSize;

            //结束的索引值
            int endIndex = pageNum*pageSize;
            //拿总数据和pageNum*pageSize做个比较
            if(pageNum*pageSize>total){
                //如果最后索引值大于最数据量 那么最后的索引值就取总数据量
                endIndex = total;
            }

            List<Part> rows = new ArrayList<>();
            for(int i=beginIndex;i<endIndex;i++){
                //把处理过后的数据保存到集合中
                rows.add(customerList.get(i));
            }
            //封装分页数据
            pageList.setTotal(total);
            pageList.setRows(rows);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (InvalidTokenOffsetsException e) {
            e.printStackTrace();
        }
        //返回pageList
        return pageList;
    }
}
*/
