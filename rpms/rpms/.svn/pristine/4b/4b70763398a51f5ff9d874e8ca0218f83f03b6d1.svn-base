//获取数据
function loadData() {
    axios.get("/department/findAll.do",{}).then(function (res) {
        app.tableData=res.data;
    }).catch(function () {
    });
}
//提交数据
function save() {
    var params = this.form;
    axios.get("/department/save.do",params).then(function (data) {
    }).catch(function () {});
}
