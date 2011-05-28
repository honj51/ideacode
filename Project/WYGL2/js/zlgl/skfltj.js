Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.skfltsGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"费用统计列表",
	store : new Ext.data.JsonStore({
        //root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=fltj',
		fields:[
		    '序号','工业园名称','房产类型','消费项目','月份','费用'
		]	
    }),
	width:792,
	height:560,
	columns:[
		{
			header:"序号",
			dataIndex:"序号",
			width:50
		},
		{
			header:"工业园名称",
			dataIndex:"工业园名称",
			width:100
		},
		{
			header:"房产类型",
			dataIndex:"房产类型",
			width:100
		},
		{
			header:"消费项目",
			dataIndex:"消费项目",
			width:100
		},
		{
			header:"月份",
			dataIndex:"月份",
			width:100
		},
		{
			header:"费用",
			dataIndex:"费用",
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
        var xfxm = new Ext.sfxmCombox({
            emptyText:'请选择'         
        });

	    var gyy_lx = new Ext.GyyLxCombox({
	        xfxm_store: xfxm.store,
	        emptyText:'请选择',	        
	    });

	    var gyy = new Ext.GyyCombox({
	        lx_store: gyy_lx.store,
	        width:100,
	        emptyText:'请选择'
	    });
	    
	    
	    var nian = new Ext.YearCombox();
	    var yue = new Ext.MonthCombox();
//        var sf = new Ext.sfxmCombox();
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
			xfxm,
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
				text:"搜索",
				iconCls: 'icon-query',
			    handler:function () {
				    self.store.load({
				        params:{
				            gyy: gyy.getValue(),
				            gyy_lx:gyy_lx.getValue(),
				            xfxm:xfxm.getValue(),
				            nian:nian.getValue(),
				            yue:yue.getValue()
				        }
				    });
				}
			}
		];
		self.store.load();
		Ext.Hudongsoft.skfltsGrid.superclass.initComponent.call(this);
	}
})