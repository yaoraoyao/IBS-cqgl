<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/views/common.jsp"%>
    <title>结算单查询</title>

</head>
<body>
    <div id="app">
        <el-row>
            <div style="width: 400px ;float: left" >
                <el-input v-model="input" placeholder="请输入结算单号：">
                    <el-button  slot="append" icon="el-icon-search" plain @click="loadSetted">查询结算单</el-button>
                </el-input>
                <el-divider></el-divider>
            </div>
        </el-row>
        <div>
            <%--<table class="table-body">--%>
                <%--<tr class="tr-body" v-for="(row, outerIndex) in dataArray" :key="outerIndex">--%>
                    <%--<!-- flex: 0 0 x% 自适应布局，每一大列的宽度按百分比显示 -->--%>
                    <%--<div class="td-box"  v-for="(col, innerIndex) in row" :key="innerIndex">--%>
                        <%--<td class="td-key">{{ col.key }}</td>--%>
                        <%--<td class="td-value">{{ col.value }}</td>--%>
                    <%--</div>--%>
                <%--</tr>--%>
            <%--</table>--%>
            <template>
                <div class="table-box">
                    <table class="table-body">
                        <tr class="tr-body" >
                            <div class="td-box" >
                                <td class="td-key"></td>
                                <td class="td-value"></td>
                            </div>
                        </tr>
                    </table>
                </div>
            </template>
        </div>
    </div>
</body>
<script>
    var app=new Vue({
        el:'#app',
        data:{
            input:'',
            dataArray: {
                type: Array,
                require: true
            }
        },
        methods:{
            loadSetted(){
                let param=this.input;
                console.debug(param);
                _this=this;
                axios.get("/webservice/findAll",param).then(function (req) {
                    console.debug(req);
                    if(req.data){
                        let table = [] ;// 大表格
                        let tmpRow = [] ;// 临时数组，表示 row，一行数据
                    }
                })
            },
            handleData(){

            }
        },
        mounted(){

        }

    });
</script>
</html>
