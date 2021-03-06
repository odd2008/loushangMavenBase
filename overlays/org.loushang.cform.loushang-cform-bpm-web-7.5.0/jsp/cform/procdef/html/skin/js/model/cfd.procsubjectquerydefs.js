(function($){
	var overrideQueryDefs = {
		childList : null,
		init:function(){
			this.childList={};
		},
		generateXml : function() {
			var root = CFlow.xmlDoc.createElement("ProcSubjectQueryDefs");
			
			for (var i in this.childList) {
				var childElement = this.childList[i];
				root.appendChild(childElement.generateXml());
			}
			return root;
		},
		
		parseXml : function(element) {
			for (var i = 0; i < element.childNodes.length; i++) {
				var child = element.childNodes[i];
				if(child.nodeName == "ProcSubjectQueryDef") {
					var childModel = new CFProcSubjectQueryDef();
					childModel.parseXml(child);
					this.childList[i] = childModel;
	         	}
			}
		}
	};
	CFProcSubjectQueryDefs = $.inherit(CFBase, overrideQueryDefs);
})(jQuery);