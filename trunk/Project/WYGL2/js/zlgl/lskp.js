Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.zphtglWin=Ext.extend(Ext.Window ,{
	title:"��ʱ��Ʊ",
	width:520,
	height:330,
	initComponent: function(){
	    var form = new Ext.FormPanel({
	        padding:10,
	        //width:300,
	        items:[
              {
                xtype: 'textfield',
                fieldLabel: '��ҵ԰����',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '�û�����',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '�·�',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '�ͻ�����',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '����',
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