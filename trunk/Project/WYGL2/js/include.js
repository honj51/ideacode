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

// 工业园选择
Ext.GyyCombox = Ext.extend(Ext.form.ComboBox,{
    editable: false,
	width: 80,
	mode: 'local',
	triggerAction:"all",
	lx_store: null,
    store: new Ext.data.JsonStore({
        autoLoad:true,
	    url: "ajax/zlgl/zphtgl.aspx?action=fclx_list",
	    fields: ['gyyName']
    }),
	displayField: 'gyyName',
	valueField: 'gyyName',
	initComponent: function(){
	    var self = this;
	    this.on('select',function (combo, record,index) {
	        self.lx_store.reload({params : {
	            gyy: combo.value
	        }});
	    })
	    Ext.MonthCombox.superclass.initComponent.call(this);
	}
});

// 房产类型选择 (工业园)
Ext.GyyLxCombox = Ext.extend(Ext.form.ComboBox,{
    editable: false,
	width: 80,
	mode: 'local',
	triggerAction:"all",
    store: new Ext.data.JsonStore({
        //autoLoad:true,
	    url: "ajax/zlgl/zphtgl.aspx?action=find_gyy_fclx",
	    fields: ['lx']
    }),
	displayField: 'lx',
	valueField: 'lx',
	//value: now_month,
	initComponent: function(){
	    Ext.MonthCombox.superclass.initComponent.call(this);
	}
});
 //消费项目
// Ext.sfxmCombox = Ext.extend(Ext.form.ComboBox,{
//    editable:false,
//    width:120,
//    mode:'local',
//    triggerAction:'all',
//    store:new Ext.data.JsonStore({
//        url:"ajax/zlgl/skfltj.aspx?action=find_sfxm",
//        field:['sfxm']
//    }),
//    displayField: 'sfxm',
//	valueField: 'sfxm',
//	initComponent: function(){
//	    Ext.MonthCombox.superclass.initComponent.call(this);
//	}
// });


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
var textEditor = new Ext.form.TextField();
var blCombox = new Ext.form.ComboBox({ //倍率
    store : new Ext.data.SimpleStore({
        fields : ['v'],
        data : bl_data
    }),
    valueField : 'v',
    displayField : 'v',
    mode : 'local',
    triggerAction : 'all'
});         
var vCombox = new Ext.form.ComboBox({ //损耗,滞纳金
    store : new Ext.data.SimpleStore({
        fields : ['n','v'],
        data : v_data
    }),
    valueField : 'v',
    displayField : 'n',
    name: 'n',
    //value: 'text',
    mode : 'local',
    triggerAction : 'all'
});

var read_only_css = 'background-color: #D2D2D2;';
function valueRenderer(v, metaData, record, rowIndex, colIndex, store) {
    if(v == "-") metaData.attr += 'style="' + read_only_css + '"';
    return v;		                   
}	
function percentRenderer(v) {
    return '%'+v;		         
}	            
