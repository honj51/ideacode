//Ext.namespace('Ext.Hudongsoft');

var now = new Date();
var now_year = now.getFullYear();
var now_month = now.getMonth()+1;
year_opts = [{n:now.getFullYear()}];
month_opts = [{n:now_month}];
for(var i=2006;i<=now_year;i++) {
    year_opts.push({n:i});
}
for(var i=1;i<=12;i++) {
    month_opts.push({n:i});
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
