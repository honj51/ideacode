Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.zphtglWin=Ext.extend(Ext.Window ,{
	title:"临时开票",
	width:520,
	height:330,
	initComponent: function(){
	    var form = new Ext.FormPanel({
	        padding:10,
	        //width:300,
	        items:[
              {
                xtype: 'textfield',
                fieldLabel: '工业园名称',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '用户姓名',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '月份',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '客户类型',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '房产',
                name: 'role_id',
                width:226
              }
    	        
	       ]
	    });
	    this.items=[
	        form
	    ]
		Ext.Hudongsoft.zphtglWin.superclass.initComponent.call(this);
	}
});