component extends="CFIDE.websocket.ChannelListener" {

	public boolean function allowSubscribe(struct subscriberInfo){
		return true;
	}

	public any function beforePublish( any message, struct publisherInfo){

		return arguments.message;
	}
}