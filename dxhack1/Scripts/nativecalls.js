function windowSystemPrompt () {
  //Feature detect for Windows
	if(typeof Windows != 'undefined') {
		// Create the message dialog and set its content
    var message = "This is a system popup message";
		var msg = new Windows.UI.Popups.MessageDialog(message);
		// Add commands
		msg.commands.append(new Windows.UI.Popups.UICommand("Okay", systemAlertCommandInvokedHandler));
		// Set default command
		msg.defaultConnadnIndex = 1;
		// Show the message dialog
		msg.showAsync();
	}
}

function  systemAlertCommandInvokedHandler() {
  console.log ("OUTPUT: The " + command.label + " was selected");
}