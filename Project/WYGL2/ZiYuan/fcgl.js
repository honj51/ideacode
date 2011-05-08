Ext.namespace('Ext.Hudongsoft');


Ext.Hudongsoft.fcglGrid=Ext.extend(Ext.grid.GridPanel ,{
xtype:"grid",
	title:"房产管理",
	store:new Ext.data.JsonStore({
		autoLoad:true,
		url: 'fcgl.aspx?action=load_data',
		fields:[
		    'id','工业园名称','房产类型','房号'
		]
	}),
	width:785,
	height:576,
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
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
			header:"房产类型",
			sortable:true,
			resizable:true,
			dataIndex:"房产类型",
			width:100
		},
		{
			header:"房号",
			sortable:true,
			resizable:true,
			dataIndex:"房号",
			width:100
		}
	],
	initComponent: function(){
		this.tbar=[
			{
				text:"新增房产"
				
			},
			{
				text:"修改"
			},
			{
				text:"删除"
			}
		]
		Ext.Hudongsoft.fcglGrid.superclass.initComponent.call(this);
	}
})


