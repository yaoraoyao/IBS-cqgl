$(function () {
    $("#dg").datagrid({
        url: '/purchasebillitem/list',
        method: 'post',
        fit: 'true',
        rownumbers: true,
        remoteSort: false,
        nowrap: false,
        toolbar: '#toolbar',
        frozenColumns: [[{field: 'hhhhhh', checkbox: true, width: '5%'}]],
        columns: [[
            {field: 'id', title: '编号', width: 50, align: 'center'},
            {field: 'supplierName', title: '供应商', width: 200, align: 'center'},
            {field: 'buyerName', title: '采购员', width: 150, align: 'center'},
            {field: 'productName', title: '商品', width: 150, align: 'center'},
            {field: 'productTypeName', title: '商品类型', width: 150, align: 'center'},
            {field: 'vdate', title: '采购日期', width: 100, align: 'center'},
            {field: 'num', title: '采购数量', width: 100, align: 'center'},
            {field: 'price', title: '采购单价', width: 100, align: 'center'},
            {field: 'amount', title: '小计', width: 100, align: 'center'},
            {field: 'status', title: '状态', width: 60, align: 'center', formatter: formatStatus}
        ]],
        groupField: 'groupBy',		//按哪个字段值分组
        view: groupview,			//展示的方式
        groupFormatter: function (value, rows) {	//分组统计数据的格式化  value表示分组的字段值，rows表示当前小组内的所有行
            var totalnum = 0, totalamount = 0;
            for (var i = 0; i < rows.length; i++) {
                totalnum += rows[i].num;
                totalamount += rows[i].amount;
            }
            return value + ' - <span style="color: #398035;">共' + rows.length +
                '条数据</span> <span style="color: #804627;">共' + totalnum +
                '件商品</span> <span style="color: #ff0000;">共计金额￥' + totalamount + '</span>';
        }
    });
});
window.methods = {
    search: function () {
        $("#dg").datagrid('loading');
        //往两个隐藏文本框中填值
        $("#pageNo").val(1);
        $("#pageSize").val(10);
        //load方法传入一个json对象用来取代datagrid的queryParams属性，将其放入请求中作为请求参数传递到后端，每次翻页的请求地址不变
        $("#dg").datagrid('load', $("#searchForm").toJson());
    },
    searchAll: function () {
        $("#searchForm").form("reset");
        this.search();
    },
    charts_3d: function () {
        $("#container").dialog("open");
        $.postJSON("/purchasebillitem/find3DData", $("#searchForm").toJson(), function (data) {
            //Highcharts.chart表示创建图表  图表展示到id为container的div中
            Highcharts.chart('container', {
                chart: {//图表的基本属性
                    type: 'pie',        //图表类型  pie表示饼图
                    options3d: {        //3D特效的属性
                        enabled: true,  //3D特效的开关
                        alpha: 45,      //3D的倾斜角度
                        beta: 0
                    }
                },
                title: {//标题
                    text: '采购报表'
                },
                credits: {                          //右下角文本不显示
                    enabled: false
                },
                tooltip: {//提示信息
                    /**
                     * point 表示的是分组后的饼图中的每一块【其中包含name、y、percentage】
                     *  name表示分组的字段值
                     *  y表示分组的统计总金额
                     *  percentage 当前point的y属性值【总金额】占所有的总金额总和的百分比
                     *      .2f  表示小数点后面显示2位小数【四舍五入】
                     */
                    pointFormat: '{series.name}：{point.y}  占比：<b>{point.percentage:.2f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,     //是否允许选中
                        cursor: 'pointer',
                        depth: 35,                  //深度
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}'
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: '采购金额',
                    data: data//数据【List集合中包含多个Map集合这样的数据结构】
                }]
            });
        });
    },
    charts_3d_column: function () {
        $("#container2").dialog("open");
        var xtext = [];
        var ytext = [];
        $.postJSON("/purchasebillitem/find3DData", $("#searchForm").toJson(), function (data) {
            for (i=0;i<data.length;i++) {
                xtext.push(data[i].name);
                ytext.push(data[i].y);
            }
            console.debug(xtext,ytext);
            var chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'container2',
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 15,
                        beta: 15,
                        depth: 50,
                        viewDistance: 25
                    }
                },
                title: {
                    text: '采购报表'
                },
                subtitle: {
                    text: ''
                },
                credits: {                          //右下角文本不显示
                    enabled: false
                },
                xAxis: {//数据结构：一个Map中包含两个List集合【其中一个List集合放名称，另一个List集合放总金额】
                    //Map.put("names", 所有名称的集合)
                    categories: [],//Highcharts.getOptions().lang.shortMonths,
                    labels: {
                        skew3d: true,
                        style: {
                            fontSize: '16px'
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: null
                    }
                },
                series: [{
                    name: '金额',
                    data:[]
                }]
            });
            chart.series[0].setData(ytext);
            chart.xAxis[0].setCategories(xtext);
        });
    }
};

function formatStatus(value, row, index) {
    if (value == 0) return "<b style='color: #ff7025;'>待审</b>";
    else if (value == 1) return "<b style='color: #11801c;'>已审</b>";
    else return "<b style='color: #80797e;'>作废</b>";
}