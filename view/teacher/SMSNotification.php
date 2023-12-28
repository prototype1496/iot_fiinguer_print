<?php
include_once "../../vendor/autoload.php";
use Infobip\Api\SmsApi;
use Infobip\Configuration;
use Infobip\ApiException;
use Infobip\Model\SmsAdvancedTextualRequest;
use Infobip\Model\SmsDestination;
use Infobip\Model\SmsTextualMessage;


class SMSNotification {


    public static function sendSMS($generated_message){

        $configuration = new Configuration(
            host: 'https://n8pp9e.api.infobip.com',
            apiKey: '27855b49f56caf847183afe27b15b25c-24f2db1e-e832-4a23-8ff9-cc896058b53d'
        );


        $sendSmsApi = new SmsApi(config: $configuration);

        $message = new SmsTextualMessage(
            destinations: [
                new SmsDestination(to: '260966800644')
        
            ],
            from: 'STMS',
            text: $generated_message
        );

        $request = new SmsAdvancedTextualRequest(messages: [$message]);

        try {
            $smsResponse = $sendSmsApi->sendSmsMessage($request);
        } catch (ApiException $apiException) {

        }


    }
}

