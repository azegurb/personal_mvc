
Zapatec.Tree=function(el,config){if(typeof config=="undefined")
config={};function param_default(name,value){if(typeof config[name]=="undefined")config[name]=value;};param_default('d_profile',false);param_default('hiliteSelectedNode',true);param_default('compact',false);param_default('dynamic',false);param_default('initLevel',false);if(config.dynamic)
config.initLevel=0;this.config=config;if(this.config.d_profile){var T1=new Date().getTime();profile={items:0,trees:0,icons:0};}
if(typeof el=="string")
el=document.getElementById(el);this.list=el;this.items={};this.trees={};this.selectedItem=null;this.id=el.id||Zapatec.Utils.generateID("tree");var top=this.top_parent=Zapatec.Utils.createElement("div");top.className="tree tree-top";this.createTree(el,top,0);el.parentNode.insertBefore(top,el);el.parentNode.removeChild(el);Zapatec.Tree.all[this.id]=this;if(this.selectedItem)
this.sync(this.selectedItem.__msh_item);if(this.config.d_profile){alert("Generated in "+(new Date().getTime()-T1)+" milliseconds\n"+
profile.items+" total tree items\n"+
profile.trees+" total (sub)trees\n"+
profile.icons+" total icons");}};Zapatec.Tree.all={};Zapatec.Tree.prototype.createTree=function(list,parent,level){if(this.config.d_profile)
++profile.trees;var id=list.id||Zapatec.Utils.generateID("tree.sub"),self=this;function _makeIt(){self.creating_now=true;var
last_li=null,next_li,i=list.firstChild,items=parent.__msh_items=[];self.trees[id]=parent;parent.__msh_level=level;parent.__msh_treeid=id;while(i){if(last_li)
last_li.className+=" tree-lines-c";if(i.nodeType!=1)
i=i.nextSibling;else{next_li=Zapatec.Utils.getNextSibling(i,'li');if(i.tagName.toLowerCase()=='li'){last_li=self.createItem(i,parent,next_li,level);if(last_li){items[items.length]=last_li.__msh_item;}}
i=next_li;}}
i=parent.firstChild;if(i&&!level){i.className=i.className.replace(/ tree-lines-./g,"");i.className+=(i==last_li)?" tree-lines-s":" tree-lines-t";}
if(last_li&&(level||last_li!==i)){last_li.className=last_li.className.replace(/ tree-lines-./g,"");last_li.className+=" tree-lines-b";}
self.creating_now=false;};if(this.config.dynamic&&level>0)
this.trees[id]=_makeIt;else
_makeIt();return id;};Zapatec.Tree.prototype.createItem=function(li,parent,next_li,level,atStart){if(this.config.d_profile)
++profile.items;if(!li.firstChild)
return;var afterNode=null;if(atStart){afterNode=atStart;}
var
id=li.id||Zapatec.Utils.generateID("tree.item"),item=this.items[id]=((afterNode==null)?Zapatec.Utils.createElement("div",parent):Zapatec.Utils.createElement("div")),t=Zapatec.Utils.createElement("table",item),tb=Zapatec.Utils.createElement("tbody",t),tr=Zapatec.Utils.createElement("tr",tb),td=Zapatec.Utils.createElement("td",tr),is_list,tmp,i=li.firstChild,has_icon=false;t.className="tree-table";t.cellSpacing=0;t.cellPadding=0;td.className="label";item.className="tree-item";item.__msh_item=id;item.__msh_tree=this.id;item.__msh_parent=parent.__msh_treeid;if(afterNode){parent.insertBefore(item,afterNode);}
while(i){is_list=i.nodeType==1&&/^[ou]l$/i.test(i.tagName);if(i.nodeType!=1||!is_list){if(i.nodeType==3){tmp=i.data.replace(/^\s+/,'');tmp=tmp.replace(/\s+$/,'');li.removeChild(i);if(tmp){i=Zapatec.Utils.createElement("span");i.className="label";i.innerHTML=tmp;i.onclick=Zapatec.Tree.onItemToggle;td.appendChild(i);}}else if(i.tagName.toLowerCase()=='img'){this.item_addIcon(item,i);has_icon=true;}else{i.onclick=Zapatec.Tree.onItemToggle;td.appendChild(i);}
i=li.firstChild;continue;}
if(is_list){this.item_addIcon(item,null);var np;if(afterNode!=null){np=Zapatec.Utils.createElement("div");parent.insertBefore(np,afterNode);}else{np=Zapatec.Utils.createElement("div",item.parentNode);}
np.__msh_item=id;np.className="tree";if(next_li)
np.className+=" tree-lined";item.__msh_subtree=this.createTree(i,np,level+1);if((this.config.initLevel!==false&&this.config.initLevel<=level)||(this.config.compact&&!/(^|\s)expanded(\s|$)/i.test(li.className))||/(^|\s)collapsed(\s|$)/i.test(li.className)){item.className+=" tree-item-collapsed";this.toggleItem(id);}else
item.className+=" tree-item-expanded";if(/(^|\s)selected(\s|$)/i.test(li.className))
this.selectedItem=item;break;}}
if(!has_icon)
this.item_addDefaultIcon(item,this.config.defaultIcons);return item;};Zapatec.Tree.prototype.item_addDefaultIcon=function(item,className){if(!className)
return;var last_td=item.firstChild.firstChild.firstChild.lastChild,td;var td=Zapatec.Utils.createElement("td");td.className="tgb icon "+className;td.onclick=Zapatec.Tree.onItemToggle;last_td.parentNode.insertBefore(td,last_td);};Zapatec.Tree.prototype.item_addIcon=function(item,img){if(this.config.d_profile)
++profile.icons;var last_td=item.firstChild.firstChild.firstChild,td;last_td=img?last_td.lastChild:last_td.firstChild;if(!img||!item.__msh_icon){td=Zapatec.Utils.createElement("td");td.className="tgb "+(img?"icon":"minus");last_td.parentNode.insertBefore(td,last_td);td.onclick=Zapatec.Tree.onItemToggle;}else{td=item.__msh_icon;img.style.display="none";}
if(!img){td.innerHTML="&nbsp;";item.className+=" tree-item-more";item.__msh_state=true;item.__msh_expand=td;}else{td.appendChild(img);item.__msh_icon=td;}};Zapatec.Tree.prototype.itemClicked=function(item_id){this.selectedItem=this.toggleItem(item_id);if(this.config.hiliteSelectedNode&&this.selectedItem)
Zapatec.Utils.addClass(this.selectedItem,"tree-item-selected");this.onItemSelect(item_id);};Zapatec.Tree.prototype.toggleItem=function(item_id,state){if(item_id){if(this.config.hiliteSelectedNode&&this.selectedItem)
Zapatec.Utils.removeClass(this.selectedItem,"tree-item-selected");var item=this.items[item_id];if(typeof state=="undefined")
state=!item.__msh_state;if(state!=item.__msh_state){var subtree=this._getTree(item.__msh_subtree,this.creating_now);if(subtree){subtree.style.display=state?"block":"none";Zapatec.Utils.removeClass(item,"tree-item-expanded");Zapatec.Utils.removeClass(item,"tree-item-collapsed");Zapatec.Utils.addClass(item,state?"tree-item-expanded":"tree-item-collapsed");}
var img=item.__msh_expand;if(img)
img.className="tgb "+(state?"minus":"plus");item.__msh_state=state;img=item.__msh_icon;if(img){img.firstChild.style.display="none";img.appendChild(img.firstChild);img.firstChild.style.display="block";}
if(this.config.compact&&state){var a=this._getTree(item.__msh_parent).__msh_items;for(var i=a.length;--i>=0;)
if(a[i]!=item_id)
this.toggleItem(a[i],false);}}
return item;}
return null;};Zapatec.Tree.prototype.collapseAll=function(){for(var i in this.trees)
this.toggleItem(this._getTree(i).__msh_item,false);};Zapatec.Tree.prototype.expandAll=function(){for(var i in this.trees)
this.toggleItem(this._getTree(i).__msh_item,true);};Zapatec.Tree.prototype.makeNode=function(html,type){if(!type){type="li";}
var node=Zapatec.Utils.createElement(type);if(html){node.innerHTML=html;}
return node;}
Zapatec.Tree.prototype.getParent=function(id,mode){var parent=null;for(var i in this.trees){if((this.trees[i].__msh_treeid==id)||(this.trees[i].__msh_item==id)){parent=this.trees[i];break;}}
if((mode!=null)&&((mode.toUpperCase()=="I")||(mode.toUpperCase()=="R"))){if(parent!=null){if(parent.className!=this.top_parent.className)
parent=parent.previousSibling;}else parent=this.items[id.toLowerCase()];}
if(!parent){parent=this.items[id.toLowerCase()];}
return parent;}
Zapatec.Tree.prototype.appendChild=function(parent,newChild,atStart){atStart=(atStart!=null&&atStart==true);if(parent==null||newChild==null||(typeof parent=="undefined")||(typeof newChild=="undefined")||this.items[newChild.id])return;var item=null;if(atStart){item=this.createItem(newChild,parent,parent.firstChild.nextSibling,parent.__msh_level,parent.firstChild);}else{item=this.createItem(newChild,parent,null,parent.__msh_level);}
if(item){var this_node=null;var next_node=null;var prev_node=null;var subtree=false;if(atStart){this_node=parent.childNodes[0];if(item.__msh_subtree==null){next_node=parent.childNodes[1];}else{next_node=parent.childNodes[2];}}else{if(!item.__msh_subtree){this_node=parent.childNodes[parent.childNodes.length-1];prev_node=parent.childNodes[parent.childNodes.length-2];subtree=(prev_node.className!=null&&prev_node.className=="tree");if(subtree){prev_node.className+=" tree-lined";prev_node=parent.childNodes[parent.childNodes.length-3];}}else{this_node=parent.childNodes[parent.childNodes.length-2];prev_node=parent.childNodes[parent.childNodes.length-3];subtree=(prev_node.className!=null&&prev_node.className=="tree");if(subtree){prev_node.className+=" tree-lined";prev_node=parent.childNodes[parent.childNodes.length-4];}}}
if(this_node){this_node.className=this_node.className.replace(/ tree-lines-./g,"");if(atStart){this_node.className+=" tree-lines-t";if(next_node){next_node.className=next_node.className.replace(/ tree-lines-./g,"");next_node.className+=" tree-lines-c";}}else{this_node.className+=" tree-lines-b";if(prev_node){prev_node.className=prev_node.className.replace(/ tree-lines-./g,"");prev_node.className+=" tree-lines-c";if(subtree){prev_node.className+=" tree-lines-c";}}}}}};Zapatec.Tree.prototype.insertBefore=function(newChild,refChild){if(newChild==null||refChild==null||(typeof newChild=="undefined")||(typeof refChild=="undefined")||this.items[newChild.id])return;var parent=refChild.parentNode;var item=this.createItem(newChild,parent,parent.firstChild.nextSibling,parent.__msh_level,refChild);var nodeBefore=false,nodeAfter=false;var next_node=null;if(item.previousSibling)nodeBefore=true;if(item.nextSibling)nodeAfter=true;item.className=item.className.replace(/ tree-lines-./g,"");if(nodeBefore&&nodeAfter)
item.className+=" tree-lines-c";else if(nodeBefore)item.className+=" tree-lines-b";else if(nodeAfter){item.className+=" tree-lines-t";if(item.className.indexOf("tree-item-more tree-item")>-1){next_node=item.nextSibling.nextSibling;}else{next_node=item.nextSibling;}
next_node.className=next_node.className.replace(/ tree-lines-./g,"");if(next_node.className.indexOf("tree-item-more tree-item")>-1){if(next_node.nextSibling.nextSibling!=null)
next_node.className+=" tree-lines-c";else
next_node.className+=" tree-lines-b";}else{if(next_node.nextSibling!=null)
next_node.className+=" tree-lines-c";else
next_node.className+=" tree-lines-b";}}};Zapatec.Tree.prototype.removeChild=function(oldChild){if(oldChild==null||(typeof oldChild=="undefined"))return;else if(oldChild.className==this.top_parent.className){alert("Removing root node not allowed.")
return;}
var p=oldChild.parentNode;if(oldChild.__msh_item&&oldChild.__msh_tree&&oldChild.__msh_parent){var prev_node=oldChild.previousSibling;var next_node=oldChild.nextSibling;var hasPrevNode=false;var hasNextNode=false;if(prev_node){if(prev_node.__msh_treeid){prev_node=prev_node.previousSibling;}
hasPrevNode=true;}else{if(oldChild.parentNode&&oldChild.parentNode.className!=this.top_parent.className){hasPrevNode=true;}}
if(next_node){if(oldChild.__msh_subtree){next_node=next_node.nextSibling;if(next_node)
hasNextNode=true;}else{hasNextNode=true;}}
if(oldChild.__msh_subtree){var subtreeNode=oldChild.nextSibling;if(subtreeNode&&oldChild.__msh_subtree==subtreeNode.__msh_treeid){for(var i=0;i<subtreeNode.childNodes.length;i++){if(subtreeNode.childNodes[i])
delete this.items[subtreeNode.childNodes[i].__msh_item];}
delete this.items[subtreeNode.__msh_item];p.removeChild(subtreeNode);}
delete this.trees[oldChild.__msh_subtree];p.removeChild(oldChild);}else{delete this.items[oldChild.__msh_item];p.removeChild(oldChild);}
if(!hasPrevNode&&hasNextNode){if(next_node){next_node.className=next_node.className.replace(/ tree-lines-./g,"");next_node.className+=" tree-lines-t";}}else if(hasPrevNode&&!hasNextNode){if(prev_node){if(prev_node.__msh_subtree){prev_node.nextSibling.className=prev_node.nextSibling.className.replace(/ tree-lined/g,"");}
prev_node.className=prev_node.className.replace(/ tree-lines-./g,"");prev_node.className+=" tree-lines-b";}}}};Zapatec.Tree.prototype.toggleAll=function(){for(var i in this.trees)
this.toggleItem(this._getTree(i).__msh_item);};Zapatec.Tree.prototype.sync=function(item_id){var item=this.items[item_id];if(item){this.collapseAll();this.selectedItem=item;var a=[];while(item.__msh_parent){a[a.length]=item;var pt=this._getTree(item.__msh_parent);if(pt.__msh_item)
item=this.items[pt.__msh_item];else
break;}
for(var i=a.length;--i>=0;)
this.toggleItem(a[i].__msh_item,true);Zapatec.Utils.addClass(this.selectedItem,"tree-item-selected");}};Zapatec.Tree.prototype.destroy=function(){var p=this.top_parent;p.parentNode.removeChild(p);};Zapatec.Tree.prototype._getTree=function(tree_id,dont_call){var tree=this.trees[tree_id];if(typeof tree=="function"){if(dont_call)
tree=null;else{tree();tree=this.trees[tree_id];}}
return tree;};Zapatec.Tree.prototype.onItemSelect=function(){};Zapatec.Tree.onItemToggle=function(){var item=this;var body=document.body;while(item&&item!==body&&!/tree-item/.test(item.className))
item=item.parentNode;Zapatec.Tree.all[item.__msh_tree].itemClicked(item.__msh_item);};