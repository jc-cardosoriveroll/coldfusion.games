component {

    this.name              = "websockets";
    this.sessionmanagement = true;
    this.sessiontimeout    = createTimeSpan(1,0,0,0);
    this.serialization.preservecaseforstructkey = true;

    // websockets
    this.wschannels = [
        { name:"websockets" }
    ];

    public boolean function onApplicationStart(){
        application.timestamp                   = getHttpTimeString();
        application.publishedMessages           = 0;
        application.publishedPreviousMessages   = 0;
        return true;
    }

    function onError(exception,eventName){
        writeDump(arguments.exception);
    }

    public boolean function onRequestStart(targetPage){
        if ( structKeyExists(url,"reload") ){
            // tell everyone to reconnect
            for( var key in wsGetAllChannels() )
                wsPublish(key,"FORCE-RECONNECT");
            applicationStop();
            location('./',false);
        }
        return true;
    }

}