component extends="CFIDE.websocket.ChannelListener" {

	public boolean function allowSubscribe(struct subscriberInfo){
		f(!structKeyExists(arguments.subscriberInfo, "userinfo")) return false;
		var attemptuser = arguments.subscriberInfo.userinfo.username;
			   
				//lock me baby
					lock type="exclusive" timeout=30 {
					//get all users 
					var users = wsGetSubscribers('chat');
					res = arrayfind(users, function(item) {
						return item.subscriberinfo.userinfo.username eq attemptuser;
					});
					if(res) return false;
					return true;
				}
	}

	public any function beforePublish( any message, struct publisherInfo){
		lock scope="application" timeout="10" type="exclusive"{
			application.publishedMessages++;
		}

		if (structKeyExists(arguments.publisherInfo,"username"))
			arguments.message = arguments.publisherInfo.username & " : " & arguments.message;

		return arguments.message;
	}

	public function afterUnsubscribe(struct subscriberInfo){
		wsPublish("game","unsubscribed");
	}

}