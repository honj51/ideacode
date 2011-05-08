Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.gyyglGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"工业园管理列表",
	store:new Ext.data.JsonStore({
		//xtype:"jsonstore",
		autoLoad:true,
		url: 'gyygl.aspx?action=load_data',
		fields:[
		    'id','序号','工业园名称','工业园面积'
		]
	}),
	width:778,
	height:544,
	columns:[
		{
			header:"编号",
			sortable:true,
			resizable:true,
			dataIndex:"序号",
			width:100
		},
		{
			header:"工业园名称",
			sortable:true,
			resizable:true,
			dataIndex:"工业园名称",
			width:100
		},
		{
			header:"工业面积（平方米）",
			sortable:true,
			resizable:true,
			dataIndex:"工业园面积",
			width:120
		}
	],
	initComponent: function(){
		this.tbar=[
			{
				text:"添加工业园"
			},
			{
				text:"修改工业园"
			},
			{
				text:"删除工业园"
			},
			{
				text:"编辑房产类型"
			}
		]
		Ext.Hudongsoft.gyyglGrid.superclass.initComponent.call(this);
	}
})