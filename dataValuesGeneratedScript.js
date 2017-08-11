var fs = require('fs');
var config = require('./config.json');
var data = {"dataValues":[]};
var period = config.period;
var numberOfDataValues = 400;
for ( var i = 200,j=period;i<numberOfDataValues;i++,j--) {
	var template = { "dataElement": config.dataElementId, "period":'', "orgUnit": config.orgUnitId, "value": '' };
	template.period = j;
	template.value = i;
	data.dataValues.push(template);
}
fs.writeFile('dataValues.json',JSON.stringify(data),function(err){
	if(err) return err;
});
