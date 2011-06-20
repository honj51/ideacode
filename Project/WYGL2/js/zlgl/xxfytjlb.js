Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.xxfytjlbGrid=Ext.extend(Ext.grid.GridPanel ,{
    title:"��ϸ����ͳ���б�",
	store : new Ext.data.JsonStore({
        //root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=xxtj',
		fields:[
		    '���','����','�ͻ�����','������ҵ԰','��������','��ͬ��ʼʱ��','��ͬ����ʱ��','�·�','����'
		]	
    }),
	width:843,
	height:560,
	columns:[
		{
			header:"���",
			dataIndex:"���",
			width:50
		},
		{
			header:"����",
			dataIndex:"����",
			width:160
		},
		{
			header:"�ͻ�����",
			dataIndex:"�ͻ�����",
			width:80
		},
		{
			header:"������ҵ԰",
			dataIndex:"������ҵ԰",
			width:100
		},
		{
			header:"��������",
			dataIndex:"��������",
			width:100
		},
		{
			header:"��ͬ��ʼʱ��",
			dataIndex:"��ͬ��ʼʱ��",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"��ͬ����ʱ��",
			dataIndex:"��ͬ����ʱ��",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
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
			width:50
		},
		{
			header:"����",
			dataIndex:"����",
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
	    
	    var iField = new Ext.form.TextField({ //������
            emptyText:'����������',
	        width:80
    	   
        });

        var gyy_lx = new Ext.GyyLxCombox();
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
	    var nian = new Ext.YearCombox();
	    var yue = new Ext.MonthCombox();
		this.tbar=[
			"���ƣ�",
			iField,
			{
				xtype:"label",
				text:"��ҵ԰��"
			},
			gyy,
			{
				xtype:"label",
				text:"�������ͣ�"
			},
			gyy_lx,
			{
				xtype:"label",
				text:"���ڣ�"
			},
			nian,
			yue,
			{
				text:"����",
				iconCls: 'icon-query',
				handler:function () {
				    self.store.baseParams = {
			            gyy: gyy.getValue(),
			            gyy_lx:gyy_lx.getValue(),
			            iField:iField.getValue(),
			            nian:nian.getValue(),
			            yue:yue.getValue()
				    };
				    self.store.load({
				        params: {
				            start:0,
		                    limit:20
				        }
				    });	
				}
			}
		];
		self.store.load({
		    params:{
		        nian:nian.getValue(),
			    yue:yue.getValue(),
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.xxfytjlbGrid.superclass.initComponent.call(this);
	}
});