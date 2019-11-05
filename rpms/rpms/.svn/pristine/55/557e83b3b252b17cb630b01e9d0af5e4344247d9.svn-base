<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>还车管理</title>
    <%@include file="/WEB-INF/views/common.jsp"%>

    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <style type="text/css">
        #r-result{padding: 0px;}
        .el-dialog__header{padding: 5px !important;}
        .el-dialog__body{padding: 5px !important;}
    </style>
</head>
<body>

    <div id="app">
        <el-container>
            <el-main style="padding: 5px">
                <el-row style="margin-bottom: 2px">
                    <el-col :span="8" style="width:50px ;">
                        <div style="margin-top: 10px;margin-left: 1px;">
                            客户：
                        </div>
                    </el-col>
                    <el-col :span="8" style="width:250px ;">
                        <div>
                            <el-input placeholder="请输入内容" v-model="input" class="input-with-select">
                                <el-button slot="append" type="primary" icon="el-icon-search" @click="query()">查询</el-button>
                            </el-input>
                        </div>
                    </el-col>
                    <el-col :span="5" style="width:200px ;height: 40px ;">
                        <el-button type="primary" icon="el-icon-error" @click="openMap()">还车路线</el-button>
                    </el-col>
                </el-row>
                <el-row >
                    <el-table ref="singleTable" border
                              :data="tableData"
                              highlight-current-row
                              @row-click="clickRow"
                              style="width: 100%;">
                        <el-table-column type="index" width="40"></el-table-column>
                        <el-table-column prop="id" label="序号" width="120"></el-table-column>
                        <el-table-column prop="customer" label="姓名" width="120"></el-table-column>
                        <el-table-column prop="mainId" label="维修单" width="100"></el-table-column>
                        <el-table-column prop="settedtime" label="结算时间" width="120"></el-table-column>
                        <el-table-column prop="reAmount" label="应付金额" width="100"></el-table-column>
                        <el-table-column prop="payAmount" label="实付金额" width="100"></el-table-column>
                        <el-table-column prop="way" label="支付方式" width="120"></el-table-column>
                        <el-table-column prop="returnCar" label="是否还车" width="120"></el-table-column>
                        <el-table-column prop="address" label="地址" width="120"></el-table-column>
                    </el-table>
                    <div class="block" >
                        <span class="demonstration" hidden="hidden"></span>
                        <el-pagination
                                @size-change="handleSizeChange"
                                @current-change="handleCurrentChange"
                                :current-page="currentPage"
                                :page-sizes="[5, 10, 15, 20]"
                                :page-size="10"
                                layout="total, sizes, prev, pager, next, jumper"
                                higth=""
                                :total="totalNum">
                        </el-pagination>
                    </div>
                </el-row>
            </el-main>
        </el-container>
        <el-dialog
                width="100%"
                title="百度地图"
                :visible.sync="innerVisible"
                append-to-body>
            <%--地图div--%>
                <div id="allmap" style="width: 1200px;height: 500px;"></div>
                <div id="driving_way">
                    <select>
                        <option value="0">最少时间</option>
                        <option value="1">最短距离</option>
                        <option value="2">避开高速</option>
                    </select>
                    <input type="button" id="result" value="查询"/>
                </div>
                <div id="r-result"></div>
        </el-dialog>
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el:'#app',
            data:{
                //选中当前行
                currentRow: null,
                //表格数据
                tableData: [],
                //多选数组
                totalNum:0,
                currentPage: 1,
                pageNum:0,
                pageSize:10,
                innerVisible:false,
                input:'',
            },
            methods:{
                clickRow(row, column, event){
                    //赋值当前选中行
                    this.currentRow = row;
                    console.debug(row.id)
                },
                setCurrent(row) {
                    this.$refs.singleTable.setCurrentRow(row);
                    console.debug(this.currentRow)
                },
                handleSizeChange(val) {
                    console.debug(val);
                    this.pageSize = val;
                    this.loadData();
                },
                handleCurrentChange(val) {
                    //调用分页查询：
                    this.pageNum = val;
                    this.loadData();
                },
                //打开地图
                openMap(){
                    app.innerVisible = true;
                    // 百度地图API功能
                    var map = new BMap.Map("allmap");    // 创建Map实例
                    map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
                    //添加地图类型控件
                    map.addControl(new BMap.MapTypeControl({
                        mapTypes:[
                            BMAP_NORMAL_MAP,
                            BMAP_HYBRID_MAP
                        ]}));
                    map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
                    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
                    var geolocation = new BMap.Geolocation();
                    geolocation.getCurrentPosition(function(r){
                        if(this.getStatus() == BMAP_STATUS_SUCCESS){
                            var mk = new BMap.Marker(r.point);
                            map.addOverlay(mk);
                            map.panTo(r.point);
                            alert('您的位置：'+r.point.lng+','+r.point.lat);
                        }
                        else {
                            alert('failed'+this.getStatus());
                        }
                    },{enableHighAccuracy: true})


                    var geoc = new BMap.Geocoder();
                    map.addEventListener("click", function(e){
                        var pt = e.point;
                        geoc.getLocation(pt, function(rs){
                            var addComp = rs.addressComponents;
                            alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
                        });
                    });
                    // 创建地址解析器实例
                    var myGeo = new BMap.Geocoder();
                    // 将地址解析结果显示在地图上,并调整地图视野
                    myGeo.getPoint("重庆互联网学院", function(point){
                        if (point) {
                            map.centerAndZoom(point, 16);
                            map.addOverlay(new BMap.Marker(point));
                        }else{
                            alert("您选择地址没有解析到结果!");
                        }
                    }, "重庆市");

                    var start = "重庆互联网学院";
                    var end = "重庆房地产职业学院";
                    //三种驾车策略：最少时间，最短距离，避开高速
                    var routePolicy = [BMAP_DRIVING_POLICY_LEAST_TIME,BMAP_DRIVING_POLICY_LEAST_DISTANCE,BMAP_DRIVING_POLICY_AVOID_HIGHWAYS];
                    $("#result").click(function(){
                        map.clearOverlays();
                        var i=$("#driving_way select").val();
                        search(start,end,routePolicy[i]);
                        function search(start,end,route){
                            var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true},policy: route});
                            driving.search(start,end);
                        }
                    });
                },
                //模糊查询
                query(){
                    console.debug(this.input);
                    let params = {"keyWord":this.input};
                    _this=this;
                    axios.post('/settedbill/query',params).then(function (response) {
                        _this.tableData=response.data
                    }).catch(function (){});
                },
                handleSelect(key, keyPath) {
                    console.log(key, keyPath);
                },
                handleOpen(key, keyPath) {
                    console.log(key, keyPath);
                },

                handleClose(key, keyPath) {
                    console.log(key, keyPath);
                },
                /*标签页*/
                handleClick(tab, event) {
                    console.log(tab, event);
                },
                //发送异步请求加载数据
                loadData(){
                    _this=this;
                    //axios.post("请求路径"，参数).then().catch()
                    axios.post("/settedbill/findAll").then(function (response) {
                        _this.tableData = response.data;
                        console.debug(response);
                    })
                }
            },
            //页面入口函数
            mounted: function () {
                this.loadData();
            }
        })
    </script>
    <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=http://api.map.baidu.com/api?v=3.0&ak=vTxic4zRORGA53RDNWwl94kWjRWTHB11"></script>
</body>
</html>
