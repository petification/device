const cid = "a6fbc88d-2512-43ec-9a83-0b442dec6a9c";
const uname = "petification";
const topicBase = `users/${uname}/${cid}/`;

msg.action = "connect";

msg.broker = {
    // Basic host setting
    broker: "petificationblue.ddns.net",
    port: 8883,
    clientid: cid,
    
    // Boolean setting
    force: true,
    
    // Security
    username: uname,
    password: "t00Rt00R",
    
    birth: {
        topic: topicBase + "birth",
        payload: "Connected",
        qos: 1,
        retain: true
    },
    
    close: {
        topic: topicBase + "close",
        payload: "Disconnected",
        qos: 1,
        retain: true
    },
    
    will: {
        topic: topicBase + "error",
        payload: "Unexpected Disconnect",
        qos: 1,
        retain: true
    }
};

return msg;
