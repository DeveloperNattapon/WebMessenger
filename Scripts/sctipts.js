var confirmWindow = null;
var btnCustomRadWindowConfirm = null;
var btnYes = null;

//Standard Window.confirm
function StandardConfirm(sender, args) {
    args.set_cancel(!window.confirm("Are you sure you want to submit the page?"));
}

//RadConfirm
function RadConfirm(sender, args) {
    var callBackFunction = function (shouldSubmit) {
        if (shouldSubmit) {
            //initiate the original postback again
            sender.click();
            if (Telerik.Web.Browser.ff) { //work around a FireFox issue with form submission, see http://www.telerik.com/support/kb/aspnet-ajax/window/details/form-will-not-submit-after-radconfirm-in-firefox
                sender.get_element().click();
            }
        }
    };

    var text = "Are you sure you want to submit the page?";
    radconfirm(text, callBackFunction, 300, 200, null, "RadConfirm");
    //always prevent the original postback so the RadConfirm can work, it will be initiated again with code in the callback function
    args.set_cancel(true);
}

//Custom RadWindow Confirm
function CustomRadWindowConfirm(sender, args) {
    //Open the window
    confirmWindow.show();
    //Focus the Yes button
    btnYes.focus();
    //Cancel the postback
    args.set_cancel(true);
}
function YesOrNoClicked(sender, args) {
    confirmWindow.close();
    //determine which button was clicked and initiate the original postback again
    if (sender.get_text() == "Yes") {
        btnCustomRadWindowConfirm.click();
    }
}