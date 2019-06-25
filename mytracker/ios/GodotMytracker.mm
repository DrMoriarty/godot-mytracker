//
//  GodotMytracker.mm
//
//  Created by Vasiliy on 25.06.19.
//
//

#import <Foundation/Foundation.h>
#import "./GodotMytracker.h"
#import <MyTrackerSDK/MyTrackerSDK.h>

NSDictionary *convertFromDictionary(const Dictionary& dict)
{
    NSMutableDictionary *result = [NSMutableDictionary new];
    for(int i=0; i<dict.size(); i++) {
        Variant key = dict.get_key_at_index(i);
        Variant val = dict.get_value_at_index(i);
        if(key.get_type() == Variant::STRING) {
            NSString *strKey = [NSString stringWithUTF8String:((String)key).utf8().get_data()];
            if(val.get_type() == Variant::INT) {
                int i = (int)val;
                result[strKey] = @(i);
            } else if(val.get_type() == Variant::REAL) {
                double d = (double)val;
                result[strKey] = @(d);
            } else if(val.get_type() == Variant::STRING) {
                NSString *s = [NSString stringWithUTF8String:((String)val).utf8().get_data()];
                result[strKey] = s;
            } else if(val.get_type() == Variant::BOOL) {
                BOOL b = (bool)val;
                result[strKey] = @(b);
            } else if(val.get_type() == Variant::DICTIONARY) {
                NSDictionary *d = convertFromDictionary((Dictionary)val);
                result[strKey] = d;
            } else {
                ERR_PRINT("Unexpected type as dictionary value");
            }
        } else {
            ERR_PRINT("Non string key in Dictionary");
        }
    }
    return result;
}

GodotMytracker::GodotMytracker()
{
}

GodotMytracker::~GodotMytracker()
{
}

void GodotMytracker::init(const String& key) {
    NSString *sdk_key = [NSString stringWithUTF8String:key.utf8().get_data()];
    // Создайте экземпляр трекера
    [MRMyTracker createTracker:sdk_key];
    // Выполните необходимые настройки
    MRMyTrackerParams *trackerParams = [MRMyTracker trackerParams];
    // Настройте параметры трекера trackerParams
    trackerParams.forcingPeriod = 10;
#ifdef DEBUG_ENABLED
    [trackerParams setDebugMode:YES];
#endif 
    // Инициализируйте экземпляр
    [MRMyTracker setupTracker];
}

void GodotMytracker::userID(const String& uid) {
    NSString *user_id = [NSString stringWithUTF8String:uid.utf8().get_data()];
    MRMyTrackerParams *trackerParams = [MRMyTracker trackerParams];
    // Установите пользовательский идентификатор
    trackerParams.customUserId = user_id;
}

void GodotMytracker::registration() {
    [MRMyTracker trackRegistrationEvent];
}

void GodotMytracker::login() {
    [MRMyTracker trackLoginEvent];
}

void GodotMytracker::invite() {
    [MRMyTracker trackInviteEvent];
}

void GodotMytracker::inviteWithParams(const Dictionary& params) {
    NSDictionary *dict = convertFromDictionary(params);
    [MRMyTracker trackInviteEventWithParams:dict];
}

void GodotMytracker::level() {
    [MRMyTracker trackLevelAchieved];
}

void GodotMytracker::levelWithNum(int num) {
    [MRMyTracker trackLevelAchievedWithLevel:@(num)];
}

void GodotMytracker::levelWithNumAndParams(int num, const Dictionary& params) {
    NSDictionary *dict = convertFromDictionary(params);
    [MRMyTracker trackLevelAchievedWithLevel:@(num) eventParams:dict];
}

void GodotMytracker::sendEvent(const String& event) {
    NSString *eventName = [NSString stringWithUTF8String:event.utf8().get_data()];
    [MRMyTracker trackEventWithName:eventName];
}

void GodotMytracker::sendEventWithParams(const String& event, const Dictionary& params) {
    NSString *eventName = [NSString stringWithUTF8String:event.utf8().get_data()];
    NSDictionary *dict = convertFromDictionary(params);
    [MRMyTracker trackEventWithName:eventName eventParams:dict];
}

void GodotMytracker::_bind_methods()
{
    ClassDB::bind_method(D_METHOD("init", "key"), &GodotMytracker::init);
    ClassDB::bind_method(D_METHOD("user_id", "uid"), &GodotMytracker::userID);
    ClassDB::bind_method(D_METHOD("registration"), &GodotMytracker::registration);
    ClassDB::bind_method(D_METHOD("login"), &GodotMytracker::login);
    ClassDB::bind_method(D_METHOD("invite"), &GodotMytracker::invite);
    ClassDB::bind_method(D_METHOD("invite_with_params", "params"), &GodotMytracker::inviteWithParams);
    ClassDB::bind_method(D_METHOD("new_level"), &GodotMytracker::level);
    ClassDB::bind_method(D_METHOD("new_level_num"), &GodotMytracker::levelWithNum);
    ClassDB::bind_method(D_METHOD("new_level_params"), &GodotMytracker::levelWithNumAndParams);
    ClassDB::bind_method(D_METHOD("event", "name"), &GodotMytracker::sendEvent);
    ClassDB::bind_method(D_METHOD("event_with_params", "name", "params"), &GodotMytracker::sendEventWithParams);
}
