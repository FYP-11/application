/**
 * Created by john on 4/13/15.
 */


import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

public class MQTT_Callback
        implements  MqttCallback {

    MqttClient myClient;
    MqttConnectOptions connOpt;

    static final String BROKER_URL = "tcp://192.248.10.70:8000";
    static final String M2MIO_DOMAIN = "Department";
    static final String M2MIO_STUFF = "ENTC1";
    MemoryPersistence persistence = new MemoryPersistence();

    //static final String M2MIO_THING = "myclientid_"+Math.random() * 100;
    /*static final String M2MIO_USERNAME = "";
    static final String M2MIO_PASSWORD_MD5 = "";*/

    /**
     * connectionLost
     * This callback is invoked upon losing the MQTT connection.
     */
    @Override
    public void connectionLost(Throwable t) {
        System.out.println("Connection lost!");
        // code to reconnect to the broker would go here if desired
    }

    @Override
    public void messageArrived(String s, MqttMessage mqttMessage) throws Exception {
        System.out.println("-------------------------------------------------");
        System.out.println("| Topic:" + s);
        System.out.println("| Message: " + new String(mqttMessage.getPayload()));
        System.out.println("-------------------------------------------------");
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {

    }


    public static void main(String args[]){
        MQTT_Callback smc = new MQTT_Callback();
        smc.runClient();
        System.out.println("ServletContextListener started");
    }


    public void runClient() {
        // setup MQTT Client
        String clientID = "myclientid_"+(int)(Math.random() * 100);
        System.out.println(clientID);
        connOpt = new MqttConnectOptions();

        connOpt.setCleanSession(true);
        connOpt.setKeepAliveInterval(30);
        /*connOpt.setUserName(M2MIO_USERNAME);
        connOpt.setPassword(M2MIO_PASSWORD_MD5.toCharArray());*/

        // Connect to Broker
        try {
            myClient = new MqttClient(BROKER_URL, clientID);
            System.out.println(myClient.isConnected());
            myClient.connect(connOpt);
            System.out.println("After connect");
            //myClient.setCallback(this);
        } catch (MqttException e) {
            System.out.println("Exception in MQTT");
            e.printStackTrace();
            System.exit(-1);
        }

        System.out.println("Connected to " + BROKER_URL);

        // setup topic
        // topics on m2m.io are in the form <domain>/<stuff>/<thing>
        String myTopic = M2MIO_DOMAIN + "/" + M2MIO_STUFF;
        MqttTopic topic = myClient.getTopic(myTopic);

        // subscribe to topic if subscriber

        try {
            int subQoS = 0;
            myClient.subscribe(myTopic, subQoS);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}