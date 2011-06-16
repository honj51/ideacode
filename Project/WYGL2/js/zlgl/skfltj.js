Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.skfltsGrid=Ext.extend(Ext.grid.GridPanel ,{
    xfxtj: false,		
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
	    self.title = self.xfxtj?"收款详细统计":"收款分类统计";
        var xfxm = new Ext.sfxmCombox({hidden: !self.xfxtj});
        var gyy_lx = new Ext.GyyLxCombox({value:'厂房'}); //{nextCombox: xfxm}
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
	    
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
				text:"消费项目",
				hidden: !self.xfxtj
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
				            xfxtj: self.xfxtj,
				            gyy: gyy.getValue(),
				            gyy_lx:gyy_lx.getValue(),
				            xfxm:xfxm.getValue(),
				            nian:nian.getValue(),
				            yue:yue.getValue()
				        }
				    });
				}
			},
			'->',
			{
			    text:"打印",
			    iconCls:'icon-batch_print',
			    handler:function () {
			        window.open("Print2.aspx?gyy="+ escape(gyy.getValue()) +'&gyy_lx=' + escape(gyy_lx.getValue()) +'&xfxm='+ escape(xfxm.getValue()) +'&nian='+nian.getValue()+'&yue='+yue.getValue()+'&xfxtj='+self.xfxtj);
			    }
			}			
		];
		self.store = new Ext.data.JsonStore({
            totalProperty : 'totalProperty',
            url: 'ajax/zlgl/tj.aspx?action=fltj',
		    fields:[
		        '序号','工业园名称','房产类型','消费项目','月份','费用'
		    ]	
        });
		self.store.load({
		    params:{
		        xfxtj: self.xfxtj,
		        gyy_lx: '厂房',
		        nian:nian.getValue(),
			    yue:yue.getValue()
		    }
		});
		Ext.Hudongsoft.skfltsGrid.superclass.initComponent.call(this);
	}
})