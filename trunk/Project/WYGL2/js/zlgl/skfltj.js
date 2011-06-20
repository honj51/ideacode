Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.skfltsGrid=Ext.extend(Ext.grid.GridPanel ,{
    xfxtj: false,		
	width:792,
	height:560,
	columns:[
		{
			header:"���",
			dataIndex:"���",
			width:50
		},
		{
			header:"��ҵ԰����",
			dataIndex:"��ҵ԰����",
			width:100
		},
		{
			header:"��������",
			dataIndex:"��������",
			width:100
		},
		{
			header:"������Ŀ",
			dataIndex:"������Ŀ",
			width:100
		},
		{
			header:"�·�",
			dataIndex:"�·�",
			width:100
		},
		{
			header:"����",
			dataIndex:"����",
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    self.title = self.xfxtj?"�տ���ϸͳ��":"�տ����ͳ��";
        var xfxm = new Ext.sfxmCombox({hidden: !self.xfxtj});
        var gyy_lx = new Ext.GyyLxCombox({value:'����'}); //{nextCombox: xfxm}
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
	    
	    var nian = new Ext.YearCombox();
	    var yue = new Ext.MonthCombox();
//        var sf = new Ext.sfxmCombox();
		this.tbar=[
			{
				xtype:"label",
				text:"��ҵ԰���ƣ�"
			},
		    gyy,
			{
				xtype:"label",
				text:"�������ͣ�"
			},
			gyy_lx,
			
			{
				xtype:"label",
				text:"������Ŀ",
				hidden: !self.xfxtj
			},
			xfxm,
			{
				xtype:"label",
				text:"�꣺"
			},
			nian,
			{
				xtype:"label",
				text:"�£�"
			},
			yue,
			{
				text:"����",
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
			    text:"��ӡ",
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
		        '���','��ҵ԰����','��������','������Ŀ','�·�','����'
		    ]	
        });
		self.store.load({
		    params:{
		        xfxtj: self.xfxtj,
		        gyy_lx: '����',
		        nian:nian.getValue(),
			    yue:yue.getValue()
		    }
		});
		Ext.Hudongsoft.skfltsGrid.superclass.initComponent.call(this);
	}
});