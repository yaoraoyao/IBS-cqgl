package cn.itsouce.util;

import java.util.ArrayList;
import java.util.List;

public class PageList<T> {
    //总共有多少行
    private Long total=0L;

    //当前页的数据集合
    private List<T> rows = new ArrayList<>();

    public Long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    @Override
    public String toString() {
        return "PageList{" +
                "total=" + total +
                ", rows=" + rows +
                '}';
    }

}
