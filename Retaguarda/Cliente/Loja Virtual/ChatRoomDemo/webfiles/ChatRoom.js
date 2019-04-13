//when the web page is left (either by navigating to another page, or closing the tab/window, the session will be closed, terminating the callback
window.onbeforeunload = stopChannel;

var channel = null;
var admin = null;
var userName = null;
var cachedUsers = null;

//used to get the user list, as well as to notify and broadcast. NOTE: notify and broadcast functions off of DSAdmin
//are restricted so the user can not execute them. This is to enforce the message format for messages being sent,
//and to prevent one user from making it look like a message came from a different user.
var ChatRoomMethods = null;

//default values here aren't required, but placed here anyway for sake of showing functionality
var connectionInfo = {"dscontext":"datasnap", "restcontext":"rest"};

//wait a short time and then load the chat room. This wait prevents some browsers (Chrome, safari)
//from constantly showing the web page status as loading.
setTimeout("loadChatRoom()", 127);

/*
 * Set 'nullIfError' to true here if you want null to be returned on an error instead of any error
 * message the server may have send you. If you don't specify a value, it will default to false.
 */
function getUserList(nullIfError) {
  nullIfError = nullIfError == null ? false : nullIfError;

  //create a new isntance of the ChatRoomMethods proxy to the server methods class.
  //this will use the latest connection information, with the encoded user name
  ChatRoomMethods = new TChatRoomServerMethods(connectionInfo);

  //attempt to get the list of users. If authentication failed this call will fail
  var resultObj = ChatRoomMethods.GetUserList();

  if (resultObj != null && resultObj.result != null)
  {
    //authentication passed, there is a result!
    return resultObj.result;
  }

  //authentication failed, you'll need to try another user name.
  return nullIfError ? null : resultObj;
};

/*
 * Prompt for a user name, connect to the server, populate the list of users and register the messaging callback.
 */
function loadChatRoom()
{
  //bring up a dialog for the user to choose a user name.
  //the dialog will continue to come up until the user either cancels or enters a valid user name.
  userName = chooseUserName();

  if (userName != null)
  {
    //the user entered a valid user name, so load the list of users
    loadUsers();

    //start the callback, so that the user can receive messages from other clients
    startChannel();
  }
}

/*
 * Helper function to encode the user name and populate the global instance of 'sessionInfo' with the new authentication value.
 */
function updateUserNameInfo(newUserName)
{
  var authStr = convertStringToBase64(newUserName + ":fast");
  connectionInfo.authentication = authStr;
  return newUserName != null;
}

/*
 * Internal to the 'loadChatRoom()' function, for prompting the user to enter a user name and to test the validity of that name.
 */
function chooseUserName()
{
  var userName = prompt("Please choose a user name", "");

  while (userName != null && updateUserNameInfo(userName) && getUserList(true) == null)
  {
    $$SessionID$$ = null;
    userName = prompt("That name is invalid or already taken, please choose another.", "");
  }
  var userLabel = document.getElementById("loginlabel");
  if (userName != null)
  {
    userLabel.innerHTML = "<b>Logged in as:</b> " + userName;
  }
  else
  {
    userLabel.innerHTML = "<b>Not Logged In!</b> (you didn't specify a user name)";
  }
  return userName;
}

/*
 * Internal to the 'loadChatRoom()' function, for registering the messaging callback (which will receive messages from other clients)
 * once a valid user name is chosen and a successful connection to the server has been made. 
 */
function startChannel()
{
  if (userName == null)
  {
    throw new Error("User Name not supplied!");
  }

  //use the user name as the Client Channel unique ID, so that other clients know what ID to use for messaging you.
  userName = escape(userName);
  channel = new ClientChannel(userName, "ChatRoom", connectionInfo);

  //create the messaging callback, to handle messages from the server and from other clients
  var callback = new ClientCallback(channel, userName, function(jsonValue, dataType) {
    if (jsonValue != null)
    {
      if (dataType == "closed")
      {
        addMessage(null, "You have been disconnected from the server. Sorry!", null, true);
      }
      else if (jsonValue.notificationType != null)
      {
        var type = jsonValue.notificationType;
      
        //the list of users has changed, so update it on the page
        if (type == "user_login" || type == "user_logout")
        {
          loadUsers();
        }
        //you received a public or private message, so add it to the message area
        else if (type == "message" || type == "privatemessage")
        {
          var isPrivate = type == "privatemessage";
          var from = jsonValue.from;
          var message = jsonValue.message;
 
          addMessage(from, message, isPrivate);
        }
      }
      //your session has expired!
      else if(jsonValue.SessionExpired != null)
      {
        addMessage(null, jsonValue.SessionExpired, null, true);

        //NOTE: you don't need to call stopChannel here, because the session has expired and therefore
        //this is the last message you will receive before the tunnel closes.
      }
    }
    return true;
  });
  channel.connect(callback);
}

/*
 * Closes the session on the server, which will in turn terminate the client channel.
 */
function stopChannel()
{
  if (channel != null && channel.callbackLoop != null)
  {
    //channel.disconnect(); Not required because clearing the session will terminate the tunnel!
    channel.closeSession();
  }
}

/*
 * Adds a message to the message area. This message will either be a message from another user, from yourself, or an error message.
 */
function addMessage(from, message, isPrivate, isError)
{
  if (isPrivate == null)
  {
    isPrivate = false;
  }
  if (isError == null)
  {
    isError = false;
  }

  if ((from != null || isError) && message != null)
  {
    var newDiv = document.createElement("div");
    newDiv.classname = "entry";

    if ( isError )
    {
      newDiv.innerHTML = "<span class=\"messagefail\">" + message + "</span>"; 
    }
    else
    {
      newDiv.innerHTML = "<b>" + from + "></b> " + (isPrivate ? "<small><i>(private)</i></small> " : "") + message;
    }

    var chatBox = document.getElementById("chatarea");
    chatBox.appendChild(newDiv);
    newDiv.scrollIntoView(false);
  }
}

function loadUsers()
{
  var users = getUserList();
  var userListObj = document.getElementById("userlist");

  if (users == null)
  {
    addMessage(null, 'Connection to the server could not be established.', null, true);
    stopChannel();
    userListObj.innerHTML = "[no users]";

    return false;    
  }

  if(users.SessionExpired != null)
  {
    addMessage(null, users.SessionExpired, null, true);
    stopChannel();
    userListObj.innerHTML = "[no users]";

    return false;
  }

  if (users != null && userListObj != null)
  {
    //cache the users for later, like when sending private messages
    cachedUsers = users;

    if (users.length > 0)
    {
      var newContent = new Array("");
      for (var i = 0; i < users.length; i++){ 
        newContent.push(users[i]);
        newContent.push("<br />\n");
      } 
      userListObj.innerHTML = newContent.join("");
    }
    else
    {
      userListObj.innerHTML = "[no users]";
    }
  }
}

function sendOnEnter(e)
{
  if (e) {
    var ev = e;
  } else {
    var ev = window.event;
  }

  if(ev.which) { 
    var keycode = ev.which;
  } else {
    var keycode = ev.keyCode;
  }

  if (keycode == 13) {
    sendMessage();
  }
}

function sendMessage()
{
  var fieldObj = document.getElementById("messageField");
 
  if (channel != null && fieldObj != null)
  {
    var messageText = fieldObj.value.trim();
    fieldObj.value = "";

    if (messageText.length > 0)
    {
      var broadcastResult = ChatRoomMethods.SendMessage(messageText);
      if (broadcastResult = null || broadcastResult.result == null || broadcastResult.result !== true)
      {
        var errMsg = "ERROR: your message could not be sent to one or more users. Please try again.";
        if ((broadcastResult != null && broadcastResult.SessionExpired != null))
        {
          stopChannel();
          errMsg = broadcastResult.SessionExpired;
        }
        addMessage(null, errMsg, null, true);
      }
    }
  }
}

function openPrivateMessageDialog()
{
  var fieldObj = document.getElementById("messageField");
  if (fieldObj != null)
  {
    var messageText = fieldObj.value.trim();
    if (messageText != "")
    {
      populatePrivateMessageUserList();
      toggleModal();
    }
  }
}

function toggleModal()
{
  var userDialog = document.getElementById("modal");
  userDialog.style.visibility = (userDialog.style.visibility == "visible") ? "hidden" : "visible";
}

function sendPrivateMessage()
{
  var chosenUserName = document.getElementById("chosenuser").value.trim();
 
  if (chosenUserName != "" && chosenUserName != userName)
  {
    toggleModal();

    var fieldObj = document.getElementById("messageField");
    var messageText = fieldObj.value.trim();
    fieldObj.value = "";

    if (messageText.length > 0)
    {
      addMessage(userName, messageText, true);
      var notifyResult = ChatRoomMethods.SendMessageToUser(messageText, chosenUserName);
      if (notifyResult = null || notifyResult.result == null || notifyResult.result !== true)
      {
        var errMsg = "ERROR: your message could not be sent. Please try again.";
        if ((notifyResult != null && notifyResult.SessionExpired != null))
        {
          stopChannel();
          errMsg = notifyResult.SessionExpired;
        }
        addMessage(null, errMsg, null, true);
      }
    }
  }
}

function updateChosenUser()
{
  var chosenUserField = document.getElementById("chosenuser");
  var chosenUserSelect = document.getElementById("privateusers");

  chosenUserField.value = chosenUserSelect.value;
}

function populatePrivateMessageUserList()
{
  var privateUserList = document.getElementById("privateusers");

  //clear the list
  for (var x = privateUserList.length; x >= 0; x--){
    privateUserList[x] = null;
  }

  privateUserList[privateUserList.length] = new Option("Choose a User", "");
  for (var i = 0; i < cachedUsers.length; i++){ 
    var thisUser = cachedUsers[i];
    //can't send private messages to yourself
    if ((thisUser != userName) && (thisUser != 'admin')) {
      privateUserList[privateUserList.length] = new Option(thisUser, thisUser);
    }
  }
}

if (!String.prototype.trim)
{
  String.prototype.trim = function () { return this.replace(/^\s*/, "").replace(/\s*$/, ""); }
}