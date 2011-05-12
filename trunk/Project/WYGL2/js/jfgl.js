﻿Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.jfglGrid=Ext.extend(Ext.grid.GridPanel ,{
xtype:"grid",
	title:"缴费列表",
	store:{
		xtype:"jsonstore",
		url: 'sjlr.aspx?action=load_data',
		
		autoLoad:true
	},
	width:802,
	height:475,
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"data1",
			width:40
		},
		{
			header:"编码",
			sortable:true,
			resizable:true,
			dataIndex:"data2",
			width:70
		},
		{
			header:"客户名称",
			sortable:true,
			resizable:true,
			dataIndex:"data3",
			width:70
		},
		{
			header:"所属工业园",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:80
		},
		{
			header:"所属房产",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:80
		},
		{
			header:"合同开始时间",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100
		},
		{
			header:"合同结束时间",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100
		},
		{
			header:"月份",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:70
		},
		{
			header:"缴费状态",
			sortable:true,
			resizable:true,
			dataIndex:"",
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
		]
		Ext.Hudongsoft.jfglGrid.superclass.initComponent.call(this);
	}
})