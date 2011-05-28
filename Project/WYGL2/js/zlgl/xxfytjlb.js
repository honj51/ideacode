Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.xxfytjlbGrid=Ext.extend(Ext.grid.GridPanel ,{
    title:"详细费用统计列表",
	store : new Ext.data.JsonStore({
        //root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=xxtj',
		fields:[
		    '序号','编码','客户名称','所属工业园','所属房产','合同开始时间','合同结束时间','月份','费用'
		]	
    }),
	width:843,
	height:560,
	columns:[
		{
			header:"序号",
			dataIndex:"序号",
			width:50
		},
		{
			header:"编码",
			dataIndex:"编码",
			width:160
		},
		{
			header:"客户名称",
			dataIndex:"客户名称",
			width:80
		},
		{
			header:"所属工业园",
			dataIndex:"所属工业园",
			width:100
		},
		{
			header:"所属房产",
			dataIndex:"所属房产",
			width:100
		},
		{
			header:"合同开始时间",
			dataIndex:"合同开始时间",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100,
		},
		{
			header:"合同结束时间",
			dataIndex:"合同结束时间",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100,
		},
		{
			header:"消费项目",
			dataIndex:"消费项目",
			width:100
		},
		{
			header:"月份",
			dataIndex:"月份",
			width:50,
		},
		{
			header:"费用",
			dataIndex:"费用",
			width:100,
			format:"0,000.00"
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
		this.tbar=[
			"名称：",
			{
				xtype:"textfield",
				fieldLabel:"标签"
			},
			{
				xtype:"label",
				text:"工业园："
			},
			gyy,
			{
				xtype:"label",
				text:"房产类型："
			},
			gyy_lx,
			{
				xtype:"label",
				text:"日期："
			},
			nian,
			yue,
			{
				text:"搜索",
				iconCls: 'icon-query'
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.xxfytjlbGrid.superclass.initComponent.call(this);
	}
})