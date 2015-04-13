/* globals api, Window */
/* jshint curly:false */

var debugMode = true;
function debug( message ) {
	if ( debugMode ) api.alert( message );
}

/***********************************************
 * BINDINGS
 ***********************************************/

debugMode = false;

var simpleMods = ['alt', 'cmd'];
var preciseMods = ['ctrl', 'cmd', 'alt'];

var preciseAdjustment = 30;

api.bind( 'f', simpleMods, function() {
	debug( 'Maximizing current window' );
	Window.focusedWindow().maximize();
} );

api.bind( 'left', simpleMods, function() {
	debug( 'Moving to left-half' );
	var win = Window.focusedWindow(),
		screenFrame = win.screen().frameWithoutDockOrMenu();
	win.setFrame( {x: screenFrame.x, y: screenFrame.y, width: screenFrame.width / 2, height: screenFrame.height} );
} );

api.bind( 'right', simpleMods, function() {
	debug( 'Moving to right-half' );
	var win = Window.focusedWindow(),
		screenFrame = win.screen().frameWithoutDockOrMenu();
	win.setFrame( {x: screenFrame.x + screenFrame.width / 2, y: screenFrame.y, width: screenFrame.width / 2, height: screenFrame.height} );
} );

api.bind( 'right', preciseMods, function() {
	debug( 'Increasing size to the right' );
	var win = Window.focusedWindow(),
		screenFrame = win.screen().frameWithoutDockOrMenu();

	win.setFrame( {
		x: win.topLeft().x,
		y: win.topLeft().y,
		width: win.size().width + ( screenFrame.width / preciseAdjustment ),
		height: win.size().height
	} );
} );

api.bind( 'left', preciseMods, function() {
	debug( 'Increasing size to the left' );
	var win = Window.focusedWindow(),
		screenFrame = win.screen().frameWithoutDockOrMenu();

	win.setFrame( {
		x: win.topLeft().x - ( screenFrame.width / preciseAdjustment ),
		y: win.topLeft().y,
		width: win.size().width + ( screenFrame.width / preciseAdjustment ),
		height: win.size().height
	} );
} );

