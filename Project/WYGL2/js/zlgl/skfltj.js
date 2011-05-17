Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.skfltsGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"费用统计列表",
	store:{
		xtype:"jsonstore",
		
	},
	width:792,
	height:560,
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"data1",
			width:100
		},
		{
			header:"工业园名称",
			sortable:true,
			resizable:true,
			dataIndex:"data2",
			width:100
		},
		{
			header:"房产类型",
			sortable:true,
			resizable:true,
			dataIndex:"data3",
			width:100
		},
		{
			header:"消费项目",
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
			width:100,
			format:"m/d/Y"
		},
		{
			header:"费用",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100
		}
	],
	initComponent: function(){
	    var gyy_lx = new Ext.GyyLxCombox({
	        emptyText:'请选择' 
	        
	    });
	    var gyy = new Ext.GyyCombox({
	        lx_store: gyy_lx.store,
	        width:100,
	        emptyText:'请选择'
	    });
	    var nian = new Ext.YearCombox();
	    var yue = new Ext.MonthCombox();
        var sf = new Ext.sfxmCombox();
		this.tbar=[
			{
				xtype:"label",
				text:"工业园名称："
			},
		    gyy,
			{
				xtype:"label",
				text:"房产类型："
			},
			gyy_lx,
			
			{
				xtype:"label",
				text:"消费项目"
			},
//			{
//				xtype:"combo",
//				triggerAction:"all",
//				fieldLabel:"标签",
//				width:70
//			},
            sf,
			{
				xtype:"label",
				text:"年："
			},
			nian,
			{
				xtype:"label",
				text:"月："
			},
			yue,
			
			{
				xtype:"datefield",
				fieldLabel:"标签"
			},
			{
				text:"搜索"
			}
		]
		Ext.Hudongsoft.skfltsGrid.superclass.initComponent.call(this);
	}
})