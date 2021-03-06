<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>维修单</title>
    <%@include file="/WEB-INF/views/common.jsp"%>
    <link type="text/css" rel="stylesheet" href="/static/css/repairorder/repairorder.css"/>
</head>
<body>
<div id="app">
    <el-container>
        <el-main id="main">
            <el-row style="margin-bottom: 1px">
                <el-col :span="2" style="width: 60px ;height: 40px ;">
                    <el-button-group  >
                        <el-button class="btn-group" type="primary"  icon="el-icon-plus" @click="openDialog1()"></el-button>
                    </el-button-group>
                </el-col>
                <el-col :span="2" style="width: 60px ;height: 40px ;">
                    <el-button-group >
                        <el-button class="btn-group" type="warning" icon="el-icon-edit" @click="edit()"></el-button>
                    </el-button-group>
                </el-col>
                <el-col :span="2" style="width: 60px ;height: 40px ;">
                    <el-button-group >
                        <el-button class="btn-group" type="danger" icon="el-icon-delete" @click="remove()"></el-button>
                    </el-button-group>
                </el-col>
                <el-col :span="3" style="width:117px ;height: 40px ;">
                    <el-button-group >
                        <el-button class="btn-group" type="primary" icon="el-icon-plus" @click="openDialog3()">新增明细</el-button>
                    </el-button-group>
                </el-col>
                <%--<el-col :span="3" style="width:117px ;height: 40px ;">--%>
                    <%--<el-button-group >--%>
                        <%--<el-button class="btn-group" type="primary" icon="el-icon-plus" @click="openDialog2()">订单结算</el-button>--%>
                    <%--</el-button-group>--%>
                <%--</el-col>--%>
                <el-col :span="8" style="width:250px ;">
                    <div>
                        <el-input placeholder="请输入内容" v-model="input" class="input-with-select">
                            <el-button slot="append" type="primary" icon="el-icon-search" @click="query()"></el-button>
                        </el-input>
                    </div>
                </el-col>
            </el-row>
            <el-row >
                <el-table ref="singleTable" border
                          :data="tableData"
                          highlight-current-row
                          @row-dblclick="loadItem"
                          @row-click="clickRow"
                          style="width: 100%;">
                    <el-table-column type="index" width="40"></el-table-column>
                    <el-table-column prop="id" label="维修单号" width="100"></el-table-column>
                    <el-table-column prop="customer" label="客户姓名" width="100"></el-table-column>
                    <el-table-column prop="carnum" label="车牌号" width="100"></el-table-column>
                    <el-table-column prop="createtime" label="创建时间" width="150"></el-table-column>
                    <el-table-column prop="status" label="状态" width="80"></el-table-column>
                    <el-table-column prop="optId.username" label="维修人员" width="100"></el-table-column>
                    <el-table-column prop="address" label="地址" width="150"></el-table-column>
                    <el-table-column label="操作 ">
                        <template slot-scope="scope">
                            <el-button type="primary" size="mini" icon="el-icon-plus" @click="handleSetted(scope.$index, scope.row)">结算</el-button>
                        </template>
                    </el-table-column>
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
            <%--维修明细单开始--%>
            <span style="color: #14bf07; font-weight: bold;margin-right: 900px">---维修工单明细主单号:&emsp;{{itemform.mainid}}&emsp;---</span>
            <el-row>
                <el-table ref="singleTable" :data="items" highlight-current-row @current-change="handleCurrentChange"
                          style="width: 100%;">
                    <el-table-column type="index" width="40"></el-table-column>
                    <el-table-column prop="id" label="维修明细单号" width="130"></el-table-column>
                    <el-table-column prop="mainid" label="维修单号" width="130"></el-table-column>
                    <el-table-column prop="optid.username" label="维修员" width="100"></el-table-column>
                    <el-table-column prop="pid" label="维修配件" width="100"></el-table-column>
                    <el-table-column prop="amt1" label="配件价格" width="100"></el-table-column>
                    <el-table-column prop="amt2" label="工时费" width="180"></el-table-column>
                    <el-table-column prop="num" label="配件数量" width="180"></el-table-column>
                    <el-table-column prop="totalamt" label="维修总金额" width="180"></el-table-column>
                </el-table>
                <div class="block">
                    <span class="demonstration" hidden="hidden"></span>
                    <el-pagination
                            @size-change="handleSizeChange"
                            @current-change="handleCurrentChange"
                            :current-page="currentPage"
                            :page-sizes="[5, 10, 15, 20]"
                            :page-size="10"
                            layout="total, sizes, prev, pager, next, jumper"
                            :total="totalItems">
                    </el-pagination>
                </div>
            </el-row>
            <%--维修单明细单结束--%>
        </el-main>
    </el-container>
    <!-- Form -->
    <el-dialog title="维修单编辑/新增" :visible.sync="dialogFormVisible1">
        <el-form ref="form" :model="form" label-width="80px">
            <el-form-item label="客户姓名">
                <el-input  v-model="form.customer" style="width: 193px"></el-input>
            </el-form-item>
            <el-form-item label="车牌号">
                <el-input  v-model="form.carnum" style="width: 193px"></el-input>
            </el-form-item>
            <el-form-item label="维修人员" prop="optId.id" >
                <el-select  v-model="form.optId" placeholder="请选择维修人员">
                    <el-option
                            v-for="item in oprators"
                            :key="item.id"
                            :label="item.username"
                            :value="item.id">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="地址">
                <el-input  v-model="form.address"></el-input>
            </el-form-item>
            <el-form-item label="状态"  prop="status" >
                <el-select v-model="form.status" placeholder="请选择">
                    <el-option
                            v-for="item in repairorderState"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible1 = false">取 消</el-button>
            <el-button type="primary" @click="onSubmit()">确 定</el-button>
        </div>
    </el-dialog>
    <el-dialog title="订单结算" :visible.sync="dialogFormVisible2">
        <el-form :model="settedform">
            <el-form ref="settedform" :model="settedform" label-width="80px">
                <el-form-item label="客户姓名">
                    <el-input  v-model="settedform.customer" style="width: 193px"></el-input>
                </el-form-item>
                <el-form-item label="应付金额">
                    <el-input  v-model="settedform.reAmount" style="width: 193px"></el-input>
                </el-form-item>
                <el-form-item label="实付金额">
                    <el-input  v-model="settedform.payAmount" style="width: 193px"></el-input>
                </el-form-item>
                <el-form-item label="支付方式">
                    <el-select  v-model="settedform.way" placeholder="请选择">
                        <el-option
                                v-for="item in payways"
                                :key="item.id"
                                :label="item.way"
                                :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>
                <%--计算总价--%>
                <span  style="display:none">{{itemform.totalamt=(itemform.amt1*itemform.num)+itemform.amt2*1}}</span>
            </el-form>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible2 = false">取 消</el-button>
            <el-button type="primary" @click="handleState()">确 定</el-button>
        </div>
    </el-dialog>
    <el-dialog title="维修单明细新增" :visible.sync="dialogFormVisible3">
        <el-form :model="itemform">
            <el-form ref="itemform" :model="itemform" label-width="80px">
                <el-form-item label="维修零件">
                    <el-select  v-model="itemform.pid" placeholder="请选择零件" @change="loadOnepidPrice($event)">
                        <el-option
                                v-for="item in parts"
                                :key="item.id"
                                :label="item.name"
                                :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="零件数量">
                    <el-input  v-model="itemform.num" style="width: 193px"></el-input>
                </el-form-item>
                <el-form-item label="零件金额">
                    <el-input  v-model="itemform.amt1" style="width: 193px"></el-input>
                </el-form-item>
                <el-form-item label="工时费">
                    <el-input  v-model="itemform.amt2" style="width: 193px"></el-input>
                </el-form-item>
                <el-form-item label="维修人员">
                    <el-select  v-model="itemform.opid" placeholder="请选择维修人员">
                        <el-option
                                v-for="item in oprators"
                                :key="item.id"
                                :label="item.username"
                                :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>
            </el-form>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible3 = false">取 消</el-button>
            <el-button type="primary" @click="handleSubmitItem()">确 定</el-button>
        </div>
    </el-dialog>

</div>
<script type="text/javascript">
    var app = new Vue({
        el:'#app',
        data:{
            totalamt:0,//维修总费用
            //选中当前行
            currentRow: null,
            //维修单状态
            repairorderState: [{
                value: 0,
                label: '已录入'
            }, {
                value: 1,
                label: '已结算'
            }],
            //维修零件
            parts:[],
            //维修人员
            oprators:[],
            //支付方式下拉框
            payways:[],
            //维修单明细表数据
            items:[],
            //表格数据
            tableData: [],
            //多选数组
            totalNum:0,
            //总行数
            totalItems:0,
            currentPage: 1,
            pageNum:0,
            pageSize:10,
            //新增维修单
            dialogFormVisible1: false,
            //结算单
            dialogFormVisible2: false,
            //维修单明细
            dialogFormVisible3: false,
            input:'',
            //维修单form
            form:{
                id:'',
                customer:'',
                carnum:'',
                createtime:'',
                status:0,//默认状态未1
                optId:{
                    id:'',
                    username:''
                },
                address:'',
                items:[]
            },
            //维修单明细form
            itemform:{
                id:'',
                mainid:'',
                optId:{
                    id:'',
                    username:''
                },
                pid:'',
                amt1:'',
                amt2:'',
                num:'',
                totalamt:''
            },
            //结算单form
            settedform:{
                mainid:'',
                custormer:'',
                re_Amount:0,
                pay_Amount:0,
                way:0,
                address:''
            }
        },
        methods:{
            //明细模态框提交按钮
            //todo 点击编辑按钮后 再点击添加 点确认执行的是修改的方法
            handleSubmitItem(){
                    axios.post("/repairorderitem/save", this.itemform)
                        .then((res) => {
                            //成功后的回调
                            let data = res.data;
                            if(data.success) {
                                //成功
                                this.$message({
                                    message: data.message,
                                    type: 'success'
                                });
                                //重新加载table明细
                                this.loadItemsData();
                                //关闭模态框
                                this.dialogFormVisible3 = false;
                            } else {
                                //失败
                                this.$message.error(data.msg);
                            }
                    })
            },
            //获取一个配件的
            loadOnepidPrice(id){
                //发送ajax请求加载数据
                axios.get('/part/findOne',{
                    //get方式传参
                    params:{
                        id:id
                    }
                })
                    .then((res)=>{
                        let data = res.data;
                        console.log(data);

                        this.itemform.amt1 =data.price;
                    });
            },
            clickRow(row, column, event){
                //赋值当前选中行
                this.currentRow = row;
                this.itemform.mainid=row.id;
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
                console.debug(this.optId.id);
            },
            //模糊查询
            query(){
                console.debug(this.input);
                let params = {"keyWord":this.input};
                _this=this;
                axios.post('/repairorder/query',params).then(function (response) {
                    _this.tableData=response.data
                }).catch(function (){});
            },
            //编辑
            edit(){
                if(this.currentRow != null){
                    //打开对话框
                    this.dialogFormVisible1=true;
                    this.form=this.currentRow;

                }else {
                    this.$message({
                        message: '请选中一条需要编辑的数据!!!',
                        type: 'warning'
                    });
                }
            },
            openDialog1(){
                this.loadOprator();
                this.form={};
                this.dialogFormVisible1=true;
            },

            openDialog2(){
                this.loadPayWay();
                this.settedform={};
                this.dialogFormVisible2=true;
            },
            //结算提交按钮
            handleState(){
                _this=this;
                //发送请求修改维修单状态为已结算1
                var params = this.settedform;
                console.debug(params);
                axios.post('/repairorder/updateState',params).then((res)=>{
                    let data = res.data;
                    if(data.success) {
                        //成功
                        this.$message({
                            message: data.msg,
                            type: 'success'
                        });
                        //重新加载table
                        this.loadData();
                    } else {
                        //失败
                        this.$message.error(data.msg);
                    }
                    //关闭模态框
                    this.dialogFormVisible2=false
                });
            },
            // 回填确认结算单
            handleSetted(index,row){
                //打开确认结算模态框
                this.dialogFormVisible2=true;
                //发送请求查维修单和维修单的明细
                axios.get('/repairorder/getReAmount',{params:{id:row.id}}).then((res)=>{
                    this.settedform = res.data;

                });

            },
            //维修明细单新增
            openDialog3(){
                if(this.itemform.mainid){
                    //打开dialog时加载数据
                    this.loadOprator();
                    this.loadPart();
                    this.itemform={};
                    //获取主单id
                    this.itemform.mainid=this.currentRow.id;
                    console.debug(this.itemform.mainid);
                    this.dialogFormVisible3 = true;
                }else{
                    this.$message({
                        message: '请先选中一行维修单',
                        type: 'warning'
                    });
                }

            },
            /*标签页*/
            handleClick(tab, event) {
                console.log(tab, event);
            },
            onSubmit() {
                var params=this.form;
                console.debug(params);
                _this = this;
                axios.post('/repairorder/save',params).then(function (response) {
                    console.debug(122222);
                    if(response.data.success){
                        _this.dialogFormVisible1 =false;
                        _this.loadData();
                    }else {
                        this.$message({
                            type:'error',
                            message:response.data.msg
                        })
                    }
                });
            },
            //维修明细新增提交
            submitItem() {
                this.itemform.mainid=this.currentRow.id;
                var params=this.itemform;
                 console.debug(params);
                _this = this;
                axios.post('/repairorderitem/save',params).then(function (response) {
                    if(response.data.success){
                        _this.dialogFormVisible3 =false;
                        _this.loadData();
                    }else {
                        this.$message({
                            type:'erroe',
                            message:response.data.msg
                        })
                    }
                });
            },
            //发送异步请求加载数据
            loadData(){
                _this=this;
                //axios.post("请求路径"，参数).then().catch()
                axios.post("/repairorder/findAll").then(function (response) {
                    console.debug(response);
                    _this.tableData = response.data;
                    _this.totalNum=response.data.total;
                }).catch()
            },
            //加载维修明细表
            loadItemsData(){
                _this=this;
                //axios.post("请求路径"，参数).then().catch()
                axios.post("/repairorderitem/findAll").then(function (response) {
                    console.debug(response);
                    _this.items = response.data;
                    _this.totalItems=response.data.total;
                }).catch()
            },
            //根据维修单动态加载维修明细单
            loadItem(row,colunm,event){
                let rowId = row.id;
                _this = this;
                axios.get("/repairorderitem/findByMainId?mainid="+rowId).then(function (req) {
                    _this.items=[];
                    _this.items=req.data;
                })
            },
            //加载维修人员
            loadOprator(){
                _this=this;
                axios.post("/employee/findAll").then(function (req) {
                    console.debug(req.data);
                    _this.oprators=req.data;
                })
            },
            //加载一个员工
            LoadOneOrator(id){

            },
            //加载零件
            loadPart(){
                _this=this;
                axios.post("/part/findAll").then(function (req) {
                    _this.parts=req.data;
                })
            },
            //加载支付方式
            loadPayWay(){
                _this=this;
                axios.post("/payway/findAll").then(function (req) {
                    _this.payways=req.data;
                })
            }
        },
        //页面入口函数
        mounted: function () {
            this.loadOprator();
            this.loadData();
            this.loadItemsData();
            this.loadPayWay();
        }
    })
</script>

</body>
</html>
