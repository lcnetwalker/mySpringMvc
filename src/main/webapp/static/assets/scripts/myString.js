var MyStr = function(){
	return {
		containSeveral: function(str, subString) {
			var num = 0;
			if(str.length > 0) {
				var index = 0;
				while(true) {
					index = str.indexOf(subString, index);
					if(index == -1) {
						break;
					}
					if(index == (str.length-1)) {
						num++;
						break;
					}
					index++;
					num++;
					
				}
			}
			
			return num;
		}
	};
}();