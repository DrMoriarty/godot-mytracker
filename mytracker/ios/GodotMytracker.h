//
//  GodotMytracker.h
//
//  Created by Vasiliy on 25.06.19.
//
//

#ifndef GodotMytracker_h
#define GodotMytracker_h

#include "core/object.h"

class GodotMytracker : public Object {
    GDCLASS(GodotMytracker, Object);

    static void _bind_methods();

public:
    GodotMytracker();
    ~GodotMytracker();

    void init(const String& key);
    void sendEvent(const String& event);
    void sendEventWithParam(const String& event, const String& param);
    void sendEventWithParams(const String& event, const Dictionary& params);
    void sendStandardEvent(int eventId);
    void sendStandardEventWithParam(int eventId, const String& params);
    void sendStandardEventWithParams(int eventId, const Dictionary& params);

};

#endif /* GodotMytracker_h */
