//Ext.namespace('Ext.Hudongsoft');

var now = new Date();
var now_year = now.getFullYear();
var now_month = now.getMonth()+1;
var now_day = now.getDate();
year_opts = [{n:now.getFullYear()}];
month_opts = [{n:now_month}];
day_opts = [{n:now_day}];

for(var i=2006;i<=now_year;i++) {
    year_opts.push({n:i});
}
for(var i=1;i<=12;i++) {
    month_opts.push({n:i});
}

for(var i=1;i<=31;i++) {
    day_opts.push({n:i});
}

Ext.YearCombox = Ext.extend(Ext.form.ComboBox,{
    editable: false,
	width: 60,
	mode: 'local',
	triggerAction:"all",
    store: new Ext.data.JsonStore({
        fields: ['n'],
        data: year_opts
    }),
	displayField: 'n',
	valueField: 'n',
	value: now_year,
	initComponent: function(){
	    Ext.YearCombox.superclass.initComponent.call(this);
	}
});

Ext.MonthCombox = Ext.extend(Ext.form.ComboBox,{
    editable: false,
	width: 40,
	mode: 'local',
	triggerAction:"all",
    store: new Ext.data.JsonStore({
        fields: ['n'],
        data: month_opts
    }),
	displayField: 'n',
	valueField: 'n',
	value: now_month,
	initComponent: function(){
	    Ext.MonthCombox.superclass.initComponent.call(this);
	}
});

Ext.DayCombox = Ext.extend(Ext.form.ComboBox,{
    editable: false,
	width: 40,
	mode: 'local',
	triggerAction:"all",
    store: new Ext.data.JsonStore({
        fields: ['n'],
        data: day_opts
    }),
	displayField: 'n',
	valueField: 'n',
	value: day_opts,
	initComponent: function(){
	    Ext.DayCombox.superclass.initComponent.call(this);
	}
});

 
//////////////////////////////////////////////////////////////////////////
// 消费项中的数据显示
// 倍率,损耗,滞纳金 选择
//////////////////////////////////////////////////////////////////////////

var bl_data = [];
for(var i=0;i<=100;i++) {
    bl_data[i] = [i];
}				 
var v_data = [];
for(var i=0;i<=20;i++) {
    v_data[i] = [''+i+'%',i];
}   

Ext.BLCombox = Ext.extend(Ext.form.ComboBox,{
    store : new Ext.data.SimpleStore({
        fields : ['v'],
        data : bl_data
    }),
    valueField : 'v',
    displayField : 'v',
    mode : 'local',
    triggerAction : 'all',
    initComponent: function(){
	    Ext.BLCombox.superclass.initComponent.call(this);
	}
});

Ext.SHCombox = Ext.extend(Ext.form.ComboBox,{//损耗,滞纳金
    store : new Ext.data.SimpleStore({
        fields : ['n','v'],
        data : v_data
    }),
    valueField : 'v',
    displayField : 'n',
    name: 'n',
    mode : 'local',
    triggerAction : 'all',
    initComponent: function(){
	    Ext.SHCombox.superclass.initComponent.call(this);
	}
});

var read_only_css = 'background-color: #D2D2D2;';
function valueRenderer(v, metaData, record, rowIndex, colIndex, store) {
    if(v == "-") metaData.attr += 'style="' + read_only_css + '"';
    return v;		                   
}	
function percentRenderer(v, metaData, record, rowIndex, colIndex, store) {
    if(v == "-") {
        metaData.attr += 'style="' + read_only_css + '"';
        return v;
    }
    return '%'+v;		             
}	            


/*
 *	后台请求规则:
 *  参数: key:'xxx'
 *  返回: [] 数组
 *  不要设置 autoLoad属性
 */
Ext.LinkCombox = Ext.extend(Ext.form.ComboBox,{
    appendItems: ['(全部)'],    // 附加的选项
    append: true,
    preCombox: null,
    nextCombox: null,   // 下一个关联Combox
    keyField: null,     // 条件字段
    selectFirst: true, // 自动选中第一项
    editable:false,    
    triggerAction:'all',
    mode:'local',
    setValue: function (v) {
        var self = this;
        Ext.LinkCombox.superclass.setValue.apply(this, arguments);
        // 选中项没改变
        if (self.lastValue && self.lastValue == v) return;
        // 忽略附加的选项
        if (self.appendItems && self.appendItems.indexOf(v)>0) return;
        
        if(!self.nextCombox) return;
        // 刷新下级关联框
        self.reloadNextCombox(v);
    },
    reloadNextCombox: function (v) {
        var self = this;
        var p = {};
        var f = self.nextCombox.keyField? self.nextCombox.keyField: self.nextCombox.valueField;
        if (!Ext.isArray(f)) f = [f];
        
        //var kfs = Ext.isArray(self.nextCombox.keyField)?self.nextCombox.keyField:[self.nextCombox.valueField];
        var c = self;
        for (i=0;i<=f.length;i++) {
            if (!c) break;
            p[f[i]] = c.value;
            c = c.preCombox;
        }
        self.nextCombox.store.load({
            params : p
        });
    },
	initComponent: function(){
	    Ext.LinkCombox.superclass.initComponent.call(this);

	    var self = this;
	    if (self.nextCombox) {
	        self.nextCombox.preCombox = this;
	    }
	    self.store.on('load',function (store,record,opts) {
	        // 增加附加的选项
	        if (self.append && self.appendItems) {
	            for(var i=0; i<self.appendItems.length;i++) {	            
	                var toAppend = self.appendItems[i];
	                var p = {};
	                p[self.displayField] = toAppend;
	                p[self.valueField] = toAppend;
	                var r = new Ext.data.Record(p); 
	                if (store.findExact(self.valueField,toAppend) == -1) {
	                    store.insert(0,r);
	                }				    
	            }
	        }	        
	        if (self.getValue()) {
	            self.setValue(self.getValue());
	        }
	        else {
	            if (self.selectFirst && store.getCount()>0) {
	                var firstValue = store.getAt(0).data[self.valueField];
	                if (firstValue) {
	                    self.setValue(firstValue);
	                }	            
	            }
	        }
	    });
	    self.on('select', function (combo, record,index) {
	        self.lastValue = combo.value;
	    });
	    if (!self.preCombox) { // 没有上一个关联框
	        self.store.load();
	    }	    
	}
});

// 工业园选择
Ext.GyyCombox = Ext.extend(Ext.LinkCombox,{
	width: 100,	
    store: new Ext.data.JsonStore({
        autoLoad:true,
	    url: "ajax/zlgl/zphtgl.aspx?action=fclx_list",
	    fields: ['gyyName']
    }),
	displayField: 'gyyName',
	valueField: 'gyyName',
	initComponent: function(){	    
	    Ext.GyyCombox.superclass.initComponent.call(this);	    
	}
});

// 房产类型选择 (工业园)
Ext.GyyLxCombox = Ext.extend(Ext.LinkCombox,{
    width: 100,    
    store: new Ext.data.JsonStore({
	    url: "ajax/zlgl/zphtgl.aspx?action=find_gyy_fclx",
	    fields: ['lx']
    }),
	displayField: 'lx',
	valueField: 'lx',
	keyField: ['gyy'],
	initComponent: function(){
	    Ext.GyyLxCombox.superclass.initComponent.call(this);        
	}
});

 //消费项目
Ext.sfxmCombox = Ext.extend(Ext.LinkCombox,{
    editable:false,
    width:120,
    triggerAction:'all',
    appendItems:  ['(全部)'],
    store:new Ext.data.JsonStore({
        url:"ajax/zlgl/tj.aspx?action=xfxm",
        fields:['sfxm']
    }),
    displayField: 'sfxm',
    valueField: 'sfxm',
    keyField: ['fclx','gyy'],
    initComponent: function(){
        Ext.sfxmCombox.superclass.initComponent.call(this);
    }
});

// 客户选择
Ext.KehuCombox = Ext.extend(Ext.form.ComboBox,{
    triggerAction:'all',
    editable:false,
    store: new Ext.data.JsonStore({
        autoLoad: true,
	    url: "ajax/zygl/zrrlb.aspx?action=list_names",
	    fields: ['bm','mc']
    }),
	displayField: 'mc',
	valueField: 'bm',
	initComponent: function(){
	    Ext.KehuCombox.superclass.initComponent.call(this);
	}
});


//新增消费项窗体
function addxfx (d,fcxfStore,r,local_callback){
    var xflx = new Ext.form.ComboBox({
        fieldLabel:'消费类型',
        width:130,
        mode:'local',
        name:'消费类型',
        triggerAction:'all',
        editable:false,
        store:new Ext.data.SimpleStore({
            fields : ['myId','displayText'],
            data :[['递增','递增'],['固定','固定'],['单价','单价'],['动态','动态']]
        }),
        emptyText:'请选择',
        valueField:'myId',
        displayField:'displayText'
    });
     
    var beilv = new Ext.form.ComboBox({
        fieldLabel:'倍率',
        width:130,
        mode:'local',
        name:'倍率',
        triggerAction:'all',
        editable:false,
        store:new Ext.data.SimpleStore({
            fields : ['myId','displayText'],
            data :[[0,0],[10,10],[20,20],[30,30],[40,40],[50,50],[60,60],[70,70],[80,80],[90,90],[100,100]]
        }),
        emptyText:'请选择',
        valueField:'myId',
        displayField:'displayText'
     });
                 
    var sunhao = new Ext.form.ComboBox({
        fieldLabel:'损耗',
        width:130,
        mode:'local',
        hiddenName:'损耗',
        triggerAction:'all',
        editable:false,
        store:new Ext.data.SimpleStore({
            fields : ['myId','displayText'],
            data :[[0,'0%'],[1,'1%'],[2,'2%'],[3,'3%'],[4,'4%'],[5,'5%'],[6,'6%'],[7,'7%'],[8,'8%'],[9,'9%'],[10,'10%'],[11,'11%']
                    ,[12,'12%'],[13,'13%'],[14,'14%'],[15,'15%'],[16,'16%'],[17,'17%'],[18,'18%'],[19,'19%'],[20,'20%']]
        }),
        emptyText:'请选择',
        valueField:'myId',
        displayField:'displayText'
     });
     
     var znj = new Ext.form.ComboBox({
        fieldLabel:'滞纳金',
        width:130,
        mode:'local',
        hiddenName:'滞纳金',
        triggerAction:'all',
        editable:false,
        store:new Ext.data.SimpleStore({
            fields : ['myId','displayText'],
            data :[[0,'0%'],[1,'1%'],[2,'2%'],[3,'3%'],[4,'4%'],[5,'5%'],[6,'6%'],[7,'7%'],[8,'8%'],[9,'9%'],[10,'10%'],[11,'11%']
                    ,[12,'12%'],[13,'13%'],[14,'14%'],[15,'15%'],[16,'16%'],[17,'17%'],[18,'18%'],[19,'19%'],[20,'20%']]
        }),
        emptyText:'请选择',
        valueField:'myId',
        displayField:'displayText'
     });
     
    var fcxfUiForm = new Ext.FormPanel({
        padding:10,
       	items:[
            {
                xtype: 'hidden',
                name: 'id'
            },
            {
                xtype: 'hidden',
                name: '房产类型',
                value: d?d.data.房产类型:r.data.房产类型 
            },
            {
                xtype: 'hidden',
                name: d?'工业园名称':'所属工业园',
                value: d?d.data.工业园名称:r.data.所属工业园   
            },
            {
                xtype: 'hidden',
                name: '所属房产',
                value:d?'':r.data.所属房产   
            },
            {
                xtype: 'hidden',
                name: '客户名称',
                value:d?'':r.data.客户名称   
            },
            {
                xtype: 'hidden',
                name: '合同编号',
                value:d?'':r.data.编码   
            },
            {
                xtype: 'hidden',
                name: '客户编码',
                value:d?'':r.data.客户编码   
            },
            {
                fieldLabel:'编号',
                name:'序号',
                allowBlank:false,
                xtype: 'textfield' 
            },
            {
                fieldLabel:'消费项目',
                name:'消费项目',
                allowBlank:false,
                xtype: 'textfield' 
            },
           xflx,
            {
                fieldLabel:'值',
                name:'值',
                allowBlank:false,
                xtype: 'numberfield' 
            },
            beilv,
            sunhao,
            znj,
            {
                fieldLabel:'说明',
                name:'说明',
                allowBlank:false,
                xtype: 'textfield' 
            }     
        ],
        buttons:[
            {
                text: '保存',
                iconCls: 'icon-save',
                
                handler:function () {
                    if (local_callback) {
                        local_callback(fcxfUiForm.getForm().getValues());
                        return;
                    }
                       //console.log(fcxfUiForm.getForm().getValues());
                    fcxfUiForm.getForm().submit({
                        url: d?'ajax/zygl/gyygl.aspx':'ajax/zlgl/zphtgl.aspx',
                        params: {
                            action:'add_fcxf'
                        },
                        success: function (form, action) {  
                            //console.log(action.response.responseText);                                      
                            fcxfWinUi.close();
                            fcxfStore.reload();
                        }
                    });
                } 
            },
            {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    fcxfWinUi.close();
                }
            }
        ]
    });
    
    var fcxfWinUi  = new Ext.Window({
        title:'新增房产消费',
        layout:'fit',
        width:300,
        height:300,
        items:[
            fcxfUiForm
        ]
    });
    
    fcxfWinUi.show();
}
