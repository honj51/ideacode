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

 
 //消费项目
 Ext.sfxmCombox = Ext.extend(Ext.form.ComboBox,{
    editable:false,
    width:120,
    triggerAction:'all',
    store:new Ext.data.JsonStore({
        url:"ajax/zlgl/tj.aspx?action=xfxm",
        fields:['sfxm']
    }),
    displayField: 'sfxm',
	valueField: 'sfxm',
	initComponent: function(){
	    Ext.sfxmCombox.superclass.initComponent.call(this);
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
 */
Ext.LinkCombox = Ext.extend(Ext.form.ComboBox,{
    appendItems: [],    // 附加的选项
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
        var skip = false;
        for(var i=0; i<self.appendItems.length;i++) {
            if (self.appendItems[i] == v) {
                skip = true;
                break;
            }
        }
        if (skip) return;
        
        if(!self.nextCombox) return;
        // 刷新下级关联框
        self.reloadNextCombox(v);
    },
    reloadNextCombox: function (v) {
        var self = this;
        var key = self.nextCombox.keyField?self.nextCombox.keyField:self.nextCombox.valueField;
        var p = {};
        p[key] = v;
        self.nextCombox.store.load({
            params : p
        });
    },
	initComponent: function(){
	    var self = this;
	    this.store.on('load',function (store,record,opts) {
	        for(var i=0; i<self.appendItems.length;i++) {
	            // 增加附加的选项
	            var toAppend = self.appendItems[i];
	            var df = self.displayField;
	            var vf = self.valueField;
	            var r = new Ext.data.Record({ df:toAppend, vf: toAppend}); 
				store.add(r);
	        }
	        if (self.selectFirst) {
	            //self.setValue(record[0].data.value);
	        }
	    });
	    this.on('select', function (combo, record,index) {
	        self.lastValue = combo.value;

	        if(!self.nextCombox) return;
	        // 刷新下级关联框
	        //self.reloadNextCombox(combo.value);
	    });
	    Ext.LinkCombox.superclass.initComponent.call(this);
	}
});

// 工业园选择
Ext.GyyCombox = Ext.extend(Ext.LinkCombox,{
	width: 80,
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
    store: new Ext.data.JsonStore({
	    url: "ajax/zlgl/zphtgl.aspx?action=find_gyy_fclx",
	    fields: ['lx']
    }),
	displayField: 'lx',
	valueField: 'lx',
	keyField: 'gyy',
	initComponent: function(){
	    Ext.GyyLxCombox.superclass.initComponent.call(this);
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