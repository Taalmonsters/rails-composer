var data = null;
var xFn = null;
var yFn = null;
var x = null;
var y = null;
var svg = null;
var start = null;
var end = null;

var refreshGraph = function() {

	x.domain(d3.extent(data, xFn));
	y.domain(d3.extent(data, yFn));

	var circles = svg.selectAll("circle").data(data, xFn);

	circles.transition()
	.attr("cx", function(d) { return x(xFn(d)) })
	.attr("cy", function(d) { return y(yFn(d)) });

	circles.enter()
	.append("svg:circle")
	.attr("r", 4)
	.attr("cx", function(d) { return x(xFn(d)) })
	.attr("cy", function(d) { return y(yFn(d)) });

	circles.exit()
	.remove();
};

function displayGraph(graph_data, target, w, h, xf, yf) {
	data = graph_data;
	xFn = xf;
	yFn = yf;
	start = d3.min(data, xFn);
	end = d3.max(data, xFn);
	x = d3.scale.linear()
	.range([0, end]);
	y = d3.scale.linear()
	.range([0, d3.max(data, yFn)]);
	svg = d3.select(target).append("svg:svg")
	.attr("width", w)
	.attr("height", h);
	refreshGraph();
}
