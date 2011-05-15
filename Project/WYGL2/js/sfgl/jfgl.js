﻿Ext.namespace('Ext.Hudongsoft');
/************************************************************************/
/* 不使用                                                                     */
/************************************************************************/
Ext.Hudongsoft.jfglGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"缴费列表",
	store: new Ext.data.JsonStore({
		url: 'ajax/sfgl/jfgl.aspx?action=list',		
		fields:[
		    'id', '序号','合同编号','客户编号','所属工业园','所属房产','合同开始时间','合同结束时间','月份','缴费状态'
		]
	}),
	width:802,
	height:475,
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"序号",
			width:40
		},
		{
			header:"编码",
			sortable:true,
			resizable:true,
			dataIndex:"编码",
			width:70
		},
		{
			header:"客户名称",
			sortable:true,
			resizable:true,
			dataIndex:"客户编号",
			width:70
		},
		{
			header:"所属工业园",
			sortable:true,
			resizable:true,
			dataIndex:"所属工业园",
			width:80
		},
		{
			header:"所属房产",
			sortable:true,
			resizable:true,
			dataIndex:"所属房产",
			width:80
		},
		{
			header:"合同开始时间",
			sortable:true,
			resizable:true,
			dataIndex:"日期",
			width:100
		},
		{
			header:"合同结束时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同结束时间",
			width:100
		},
		{
			header:"月份",
			sortable:true,
			resizable:true,
			dataIndex:"日期月",
			width:70
		},
		{
			header:"缴费状态",
			sortable:true,
			resizable:true,
			dataIndex:"缴费状态",
			width:100
		},
		{
			header:"操作",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[
		    {
		        text:"新增",
		        iconCls: 'icon-group-create',
		    },
		     {
		        text:"修改",
		        iconCls: 'icon-group-update',
		    },
		     {
		        text:"删除",
		        iconCls: 'icon-group-delete',
		    },
			{
				xtype:"label",
				text:"名称："
			},
			{
				xtype:"textfield",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"工业园："
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"类型："
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"号码："
			},
			{
				xtype:"textfield",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"时间："
			},
			{
				xtype:"datefield",
				fieldLabel:"标签"
			},
			{
				text:"搜索",
				iconCls: 'icon-query'
			}
		];
		//self.store.load();
		self.store.load();
		Ext.Hudongsoft.jfglGrid.superclass.initComponent.call(this);
	}
})