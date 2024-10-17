component extends="CFIDE.websocket.ChannelListener" {

	public boolean function allowSubscribe(struct subscriberInfo){
		return true;
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